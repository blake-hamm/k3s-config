# Full deployment

## Pre-reqs
- VM accessible with ssh

## k3s
Deploy k3s with the following flags:
```bash
  "--debug"
  "--disable=traefik"
  "--disable=servicellb"
  "--flannel-backend=none"
  "--disable-network-policy"
  "--tls-san=192.168.69.20"
```

## Required k3s tools
After the cluster is deployed, you should be able to access it with kubectl on the host machine. However, you will notice none of the pods have started. To get the cluster functional, deploy the files in the manifests directory:
```bash
sudo kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/tigera-operator.yaml
sudo kubectl create -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb-native.yaml
git clone https://github.com/blake-hamm/k3s-config.git
cd k3s-config && git checkout feature/init # Only needed when on branch
sudo kubectl create -f ~/k3s-config/manifests
watch sudo kubectl get all --all-namespaces
```


Once the cluster us up and the CNI is working properly (`deployment.apps/calico-apiserver`), copy the `/etc/rancher/k3s/k3s.yaml` config to your local `.kube/config` and replace the ip address with your kube-vip address. Then, you can continue deploy services on your local:
```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd --version 7.1.0
watch kubectl get all --all-namespaces
```

## Core k3s tools
Now we have a functioning k3s cluster, but set up the rest of the cluster for our homelab with argocd. We deploy the `core` argocd applications. This will stand up the following tools:
 - kube-vip for ha control plane and kubernetes services (lb)
 - vault for secrets (to unseal follow docs - https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-minikube-raft)
 - vaultwarden for passwords
 - traefik for ingress/proxy
 - cert manager for certs (w/ cloudflare)
 - authelia for middleware
 - pihole for dns
 - external dns to update pihole
 - prometheus + grafana for monitoring
 - nginx example app
 - homepage with links

First, add you cloudflare api key as a kubernetes secret:
```bash
kubectl create secret generic cloudflare-token-secret \
  --from-literal=cloudflare-token=<my_token>
```

 Then, deploy these core tools with:
 ```bash
kubectl apply -f apps/core.yaml
argocd login --core
argocd app sync core
argocd app sync -l argocd.argoproj.io/instance=core
 ```

#### Vault
To unseal:
```bash
sudo kubectl exec vault-0 -n vault -- vault operator init     -key-shares=1     -key-threshold=1     -format=json > cluster-keys.json
VAULT_UNSEAL_KEY=$(jq -r ".unseal_keys_b64[]" cluster-keys.json)
sudo kubectl exec vault-0 -n vault -- vault operator unseal $VAULT_UNSEAL_KEY
```

To access via cli:
```
export VAULT_ADDR=https://vault.bhamm-lab.com
vault status # Check status
export VAULT_TOKEN=$(kubectl get secrets vault-unseal-keys -o jsonpath={.data.vault-root} | base64 --decode) # Get token

```

To sync vault secrets with kubernetes - https://developer.hashicorp.com/vault/tutorials/kubernetes/vault-secrets-operator

#### Cert Manager & DNS
To create cf token:
```bash
sudo kubectl -n cert-manager create secret generic cloudflare-token-secret --from-literal=cloudflare-token=<token>
```

#### Kubernetes dashboard
To access the kubernetes dashboard:
```bash
kubectl create token admin-user
```

## Testing
For testing new applications with argocd, it's best to use a seperate app from "core" because we generally don't want to remove it. To do this, you can use the "test" app. To deploy/sync:
 ```bash
 sudo kubectl config set-context --current --namespace=argocd
 sudo kubectl apply -f ~/k3s-config/apps/test.yaml
 sudo KUBECONFIG=/etc/rancher/k3s/k3s.yaml argocd login --core
 sudo KUBECONFIG=/etc/rancher/k3s/k3s.yaml argocd app sync test
 sudo KUBECONFIG=/etc/rancher/k3s/k3s.yaml argocd app delete test
 ```

Troubleshooting:
```bash
 sudo KUBECONFIG=/etc/rancher/k3s/k3s.yaml argocd app list

# To delete argo app:
kubectl patch app APPNAME  -p '{"metadata": {"finalizers": null}}' --type merge
kubectl delete app APPNAME

```
