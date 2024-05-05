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
git clone https://github.com/blake-hamm/k3s-config.git
sudo kubectl create -f k3s-config/manifests/1-*.yaml
sudo kubectl create -f k3s-config/manifests/2-*.yaml
sudo kubectl create -f k3s-config/manifests/3-*.yaml
```
