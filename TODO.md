# Goals
I want to have my vault instance accessible via https://vault.bhamm-lab.com on my LAN; then, I can leverage it in other projects. In order to accomplish this, I need:
- [ ] LetsEncrypt acme challenge with my domain on cloudflare
- [ ] Local DNS with pihole
- [ ] Traefik ingress

## Next steps:
- [ ] LetsEncrypt acme challenge with cloudflare vault secret (manually setup)
- [ ] Deploy pihole and setup with opnsense
- [ ] Traefik config for nginx, then vault
- [ ] Finalize vault url with middleware to check host ip (only my framework)

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
