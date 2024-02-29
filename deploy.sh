#!/bin/bash

# Update kubeconfig for the AKS cluster again / Setze die kubeconfig für den AKS-Cluster neu
az aks get-credentials --resource-group dev-cgi-ac-resource-grp --name dev-cgi-ac-k8s --overwrite-existing
sleep 15

# Create new Namespace / Erstelle einen Namespace
kubectl apply -f mf-namespace.yaml

# Create a ConfigMap from the custom "index.html" file / Erstelle eine ConfigMap aus der Custom "index.html" Datei
kubectl create configmap nginx-html --from-file=index.html -n dev-cgi-ac-ns

# Install NGINX WebServer / Hier wird der NGINX WebServer installiert
kubectl apply -f mf-nginx-websrv.yaml
sleep 5

# Create RBAC role for the web server / Erstelle RBAC Rolle für den Webserver (Role-Based Access Control)
kubectl apply -f role-webserver.yaml -n dev-cgi-ac-ns

# Install Horizontal Pod Autoscaler / Horizontal Pod Autoscaler (HPA) wird installiert
kubectl apply -f mf-hpa.yaml
sleep 5

# Install NGINX-Ingress-Controller / NGINX-Ingress-Controller wird installiert
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/cloud/deploy.yaml
sleep 30

# Create RBAC role for the NGINX-Ingress-Controller / Erstelle RBAC Rolle für den NGINX-Ingress-Controller (Role-Based Access Control)
kubectl apply -f role-ingress-controller.yaml -n ingress-nginx

# Installiert Cert-Manager - Installiert einen ClusterIssuer - Setztdann die Routen
# Installs Cert-Manager - Installs a ClusterIssuer - Then sets the routes
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.yaml
sleep 60
kubectl apply -f mf-clusterissuer.yaml
sleep 15
kubectl apply -f mf-routing.yaml
sleep 5

# Create RBAC role for the Cert-Manager / Erstelle RBAC Rolle für den Cert-Manager (Role-Based Access Control)
kubectl apply -f role-cert-manager.yaml -n cert-manager

# Show the IP of the various services / Zeige die IP der verschiedenen Services an (DirtyMethod)
kubectl get services -n dev-cgi-ac-ns
kubectl get services -n ingress-nginx
