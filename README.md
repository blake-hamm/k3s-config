# k3s config
*For an opinionated homelab*

A monorepo with an opinionated take on k3s. It assumes you have a k3s cluster running and you want to deploy services securily and access them safely with your LAN or wireguard.

It is similar to standard k3s, but instead uses kube-vip for a load balancer and virtual ip solution. This way, k3s is accessible as an ip on your local network. This is configured in the `manifests` directory.

Moreover, we propose a derrivative architecture of k3s that provides tooling for a **homelab**. It automatically deployes argocd and manages additional kubernetes resource with gitops in the `apps` directory.

# Quick start
In order to begin, install k3s. Then copy manifests directory:
`sudo cp -r ./manifests /var/lib/rancher/k3s/server`
