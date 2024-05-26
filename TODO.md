# Goals
I want to have my argo UI accessible via https://argocd.bhamm-lab.com on my LAN; then, I can troubleshoot it more easily. In order to accomplish this, I need:
- [x] Multiple nodes to load balance
- [x] LetsEncrypt acme challenge with my domain on cloudflare
- [x] Traefik ingress

## Next steps:
- [x] Deploy multi node cluster
- [x] LetsEncrypt acme challenge with cloudflare vault secret (manually setup)
- [x] Traefik config for nginx
- [ ] Finalize middleware to check host ip (only my framework)

### Once vault is functioning as planned, some bonus feature are:
- [ ] Setup authelia middleware
- [ ] Expose UI's behind authelia:
  - [ ] Kubernetes
  - [ ] Traefik
  - [ ] Vault
  - [ ] PiHole
  - [ ] Argo

## After some UI's are accessible
- [ ] Multi-node cluster
- [ ] nfs persistent volume
- [ ] Prometheus, grafana, loki
- [ ] DNS records for bare metal and network equipment
- [ ] Nextcloud w/ Aubrey access
- [ ] Argo events/workflows w/ kubernetes-native backups
- [ ] Gitea
- [ ] Wireguard
- [ ] Deploy pihole and setup with opnsense
- [ ] Update pihole records with external dns - https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/pihole.md

### Some more fun services
- [ ] Homelab dashboard
- [ ] rr stack
