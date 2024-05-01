# k3s config
*For an opinionated homelab*

This monorepo houses a NixOS package and module to bootstrap a k3s cluster and deploy apps. The package deploys a standard single node cluster on a NixOS machine. However, the module can be used with additional flags to customize your deployment.

It is similar to standard k3s, but instead uses kube-vip for a load balancer and virtual ip solution. This way, k3s is accessible as an ip on your local network. This is ocnfigured in the `manifests` directory.

Moreover, we propose a derrivative architecture of k3s that provides tooling for a **homelab**. It automatically deployes argocd and manages additional kubernetes resource in gitops in the `apps` directory.

# Quick start
In order to begin
