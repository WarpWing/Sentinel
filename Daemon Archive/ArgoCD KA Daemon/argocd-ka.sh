#!/bin/bash
# ArgoCD Deployment Daemon
while true; do
  kubectl port-forward svc/argocd-server -n argocd 8080:443;
  sleep 1s;
done