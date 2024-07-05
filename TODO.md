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
- [ ] Deploy Sonarr/Radarr
- [ ] Deploy Qbittorent with vpn sidecar (mullvad + gluetun) or deluge

### Once vault is functioning as planned, next steps are:
- [ ] Setup authelia middleware
  - [ ] Deploy openldap helm
  - [ ] Deploy authelia helm
  - [ ] Integrate with traefik
  - [ ] Integrate with argocd
- [ ] Setup valero for kubernetes backups
- [ ] Expose UI's behind authelia:
  - [ ] Kubernetes
  - [ ] Traefik
  - [ ] Vault
  - [ ] Argo
- [ ] Setup local internet/bare metal ip mapping
- [ ] Setup PV on nfs
- [ ] Setup backups with https://velero.io/
- [ ] Add omada controller https://github.com/mbentley/docker-omada-controller


## After some UI's are accessible
- [x] Multi-node cluster
- [ ] nfs persistent volume
- [ ] Prometheus, grafana, loki
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
