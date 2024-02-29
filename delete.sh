#!/bin/bash

# Delete Horizontal Pod Autoscaler (HPA) / Lösche den Horizontal Pod Autoscaler (HPA)
kubectl delete -f mf-hpa.yaml

# Delete NIGINX WebServer Pod / Lösche den NGINX Webserver Pod
kubectl delete -f mf-nginx-websrv.yaml

# Delete ConfigMap / Lösche die ConfigMap
kubectl delete configmap nginx-html -n dev-cgi-ac-ns

# Delete NGINX-Ingress-Controller / Lösche NGINX-Ingress-Controller
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml

# Delete Cert-Manager / Lösche Cert-Manager
kubectl delete -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.yaml

# Delete Routing / Lösche Routing
kubectl delete -f mf-routing.yaml

# Delete Namespace / Lösche den Namespace
kubectl delete -f mf-namespace.yaml
