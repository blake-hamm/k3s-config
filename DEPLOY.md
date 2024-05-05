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


## Extra config
After the cluster is deployed, you should be able to access it with kubectl on the host machine. However, you will notice none of the pods have started. To get the cluster functional, deploy the files in the manifests directory:
```bash
sudo kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/tigera-operator.yaml
git clone https://github.com/blake-hamm/k3s-config.git
sudo kubectl create -f k3s-config/manifests/calico.yaml
sudo kubectl create namespace argocd
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
