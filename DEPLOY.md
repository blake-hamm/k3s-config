# To deploy
Copy `./manifests` to `/var/lib/rancher/k3s/server/manifests/custom`

Then, get your argocd secret with `sudo kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d` (username is admin).

Next, deploy an app with `sudo kubectl apply -f apps/local.yaml`.
