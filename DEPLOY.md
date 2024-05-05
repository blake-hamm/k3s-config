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
sudo kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/tigera-operator.yaml
git clone https://github.com/blake-hamm/k3s-config.git
sudo kubectl create -f k3s-config/manifests/calico.yaml
sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
Wait for `deployment.apps/calico-apiserver` to finish before going to the next step.

## Core k3s tools
Now we have a functioning k3s cluster, but set up the rest of the cluster for our homelab with argocd. We deploy the `core` argocd applications. This will stand up the following tools:
 - kube-vip for ha control plane and kubernetes services (lb)
 - vault for secrets
 - vaultwarden for passwords
 - traefik for ingress
 - cert manager for certs (w/ cloudflare)
 - authelia for middleware
 - pihole for dns
 - external dns to update pihole
 - prometheus + grafana for monitoring
 - nginx example app
 - homepage with links

 To deploy these core tools run:
 ```bash
 sudo kubectl config set-context --current --namespace=argocd
 sudo kubectl apply -f k3s-config/apps/core.yaml
 sudo KUBECONFIG=/etc/rancher/k3s/k3s.yaml argocd login --core
 sudo KUBECONFIG=/etc/rancher/k3s/k3s.yaml argocd app sync core
 sudo KUBECONFIG=/etc/rancher/k3s/k3s.yaml argocd app sync -l argocd.argoproj.io/instance=core
 ```
