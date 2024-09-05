# Goals
I want to have my argo UI accessible via https://argocd.bhamm-lab.com on my LAN; then, I can troubleshoot it more easily. In order to accomplish this, I need:
- [x] Multiple nodes to load balance
- [x] LetsEncrypt acme challenge with my domain on cloudflare
- [x] Traefik ingress

## Next steps:
- [x] Deploy multi node cluster
- [x] LetsEncrypt acme challenge with cloudflare vault secret (manually setup)
- [x] Traefik config for nginx
- [x] Finalize middleware to check host ip (only lan)
- [x] Setup vault
  - [x] Deploy helm chart
  - [x] Setup dashboard
  - [x] Sync vault and k8s secrets (Try [external secrets](https://github.com/external-secrets/external-secrets) or [vault external secrets operator](https://developer.hashicorp.com/vault/tutorials/kubernetes/vault-secrets-operator))
  - [ ] More fine grain permissions on `cr-raft.yaml`
  - [x] Use native kubernetes secrets and manage secrets (manually?) in vault

### Setup Servarr
- [x] Setup PV on nfs
- [x] Deploy Prowlarr
- [x] Deploy Sonarr/Radarr
  - [x] Finetune settings based on trash guides
- [x] Deploy Qbittorent
  - [x] Deploy glueten w/ protonvpn config
  - [ ] Troubleshoot automated port forwarding config
- [x] Deploy Jellyfin
- [x] Deploy Emby
- [ ] Deploy Jellyseerr (opt)
- [ ] Configure Unpackarr
- [x] Deploy Flaresolverr
- [ ] Deploy sabnzbd or nzbget (opt)

### Let's setup monitoring:
- [ ] Deploy:
  - [x] Prometheus
  - [x] Grafana
  - [x] Use external secret for password
  - [x] More fine grain needs for helm dashboards (remove windows and mac)
  - [ ] Setup
    - [x] ceph
    - [x] traefik
    - [x] metallb
    - [x] calico
    - [ ] aorus node - https://wiki.nixos.org/wiki/Prometheus
    - [ ] zfs/nfs - https://github.com/pdf/zfs_exporter
    - [ ] postgres - https://github.com/prometheus-community/postgres_exporter
    - [ ] vault - https://bank-vaults.dev/docs/operator/monitoring/
    - [ ] external-secrets - https://external-secrets.io/latest/api/metrics/
    - [ ] cert-manager - https://cert-manager.io/docs/devops-tips/prometheus-metrics/
    - [ ] opnsense - https://github.com/opnsense/plugins
    - [ ] argocd - https://argo-cd.readthedocs.io/en/stable/operator-manual/metrics/
  - [ ] Create PV for prometheus data
  - [ ] Loki

### Let's optimize our cluster and it's storage:
- [x] Setup bare metal nodes
- [x] Setup ceph cluster with rook

### Once vault is functioning as planned, next steps are:
- [x] Setup authelia middleware
  - [x] Deploy lldap
  - [ ] OPTIONAL: gitops for ldap - https://github.com/lldap/lldap/blob/main/example_configs/bootstrap/bootstrap.md#environment-variables
  - [x] Deploy authelia helm
  - [x] Integrate with traefik
  - [x] Integrate with argocd
- [ ] Setup valero for kubernetes backups
- [ ] Expose UI's behind authelia:
  - [ ] Kubernetes
  - [x] Traefik
  - [x] Vault
  - [x] Argo
  - [ ] Grafana
- [ ] Setup local internet/bare metal ip mapping
- [ ] Setup backups with https://velero.io/
- [ ] Add omada controller https://github.com/mbentley/docker-omada-controllerh
- [x] Setup postgresql db

### Time to figure out vlans:
- [ ] Deploy omada cloud controller


## After some UI's are accessible
- [x] Multi-node cluster
- [x] nfs persistent volume
- [ ] DNS records for bare metal and network equipment (pi-hole)
- [ ] Nextcloud w/ Aubrey access
- [ ] Argo events/workflows for backups and software updates
- [ ] Telegram messages
- [ ] Gitea
- [ ] Vaultwarden
- [ ] Wireguard
- [ ] Deploy pihole and setup with opnsense
- [ ] Update pihole records with external dns - https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/pihole.md
- [ ] Fine grain namespaces

### Some more fun services
- [ ] Homelab dashboard
- [ ] rr stack

*At some point, let's refactor nix-config and k3s-config into a monorepo.*
