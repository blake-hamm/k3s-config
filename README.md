# k3s config
*For an opinionated homelab*

A monorepo with NixOS package/module/flake(?) to bootstrap a k3s cluster and deploy apps. The package deploys a standard single node cluster on a NixOS machine. However, the module can be used with additional flags to customize a more complex deployment with multiple vms or bare metal NixOS machines (including autoscaling additional [microvm](https://astro.github.io/microvm.nix/)s).

It is similar to standard k3s, but instead uses kube-vip for a load balancer and virtual ip solution. This way, k3s is accessible as an ip on your local network. This is configured in the `manifests` directory.

Moreover, we propose a derrivative architecture of k3s that provides tooling for a **homelab**. It automatically deployes argocd and manages additional kubernetes resource with gitops in the `apps` directory.

# Quick start
In order to begin...
