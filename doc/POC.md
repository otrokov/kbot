# ArgoCD

## Why Argo CD?
Application definitions, configurations, and environments should be declarative and version controlled. Application deployment and lifecycle management should be automated, auditable, and easy to understand.


## Installing ArgoCD in k3d cluster with GUI interface

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
## Port forwarding

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
The API server can then be accessed using https://localhost:8080




## Get password
To login you’ll need to obtain the admin password and URL for the Argo CD instance:

```bash
argoPass=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo $argoPass
```

Access the Argo CD  by logging in with the username **admin** and the password extracted in the previous step.






[def]: /home/otrokovanton/argo.png "ArgoCD"
[def2]: file:///home/otrokovanton/argo0.png