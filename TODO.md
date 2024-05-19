# Goals
I want to have my argo UI accessible via https://argocd.bhamm-lab.com on my LAN; then, I can troubleshoot it more easily. In order to accomplish this, I need:
- [ ] Multiple nodes to load balance
- [ ] LetsEncrypt acme challenge with my domain on cloudflare
- [ ] Local DNS with pihole
- [ ] Traefik ingress

## Next steps:
- [ ] Deploy multi node cluster
- [ ] LetsEncrypt acme challenge with cloudflare vault secret (manually setup)
- [ ] Deploy pihole and setup with opnsense
- [ ] Update pihole records with external dns - https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/pihole.md
- [ ] Traefik config for nginx
- [ ] Finalize middleware to check host ip (only my framework)

### Once vault is functioning as planned, some bonus feature are:
- [ ] Setup authelia middleware
- [ ] Expose UI's behind authelia:
  - [ ] Kubernetes
  - [ ] Traefik
  - [ ] Vault
  - [ ] PiHole
  - [ ] Argo

## After vault, local dns and some UI's are accessible
- [ ] Multi-node cluster
- [ ] nfs persistent volume
- [ ] Prometheus, grafana, loki
- [ ] DNS records for bare metal and network equipment
- [ ] Nextcloud w/ Aubrey access
- [ ] Argo events/workflows w/ kubernetes-native backups
- [ ] Gitea
- [ ] Wireguard

### Some more fun services
- [ ] Homelab dashboard
- [ ] rr stack
