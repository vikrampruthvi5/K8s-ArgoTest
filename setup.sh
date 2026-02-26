
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
helm install argo-cd charts/argo-cd/

sleep 30

kubectl create -f argocd/repo-secret.yaml
kubectl create -f argocd/project.yaml 
kubectl create -f argocd/app.yaml

kubectl create ns python-app
kubectl create ns kubernetes-dashboard

sleep 5

kubectl -n kubernetes-dashboard create token admin-user

kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d