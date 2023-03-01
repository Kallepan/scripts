# Redirection Error

This happens due to argocd not knowing that it is behind a reverse proxy.
- Simply reconfigure the deployment file by running:
```sh
kubectl -n argocd edit deployments.apps argocd-server
```
- and including the --insecure flag in the container:

```yaml
    container:
      - argocd
      - --insecure
```