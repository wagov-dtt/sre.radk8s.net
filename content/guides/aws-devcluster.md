+++
title = "AWS EC2 Dev Cluster"
date = 2024-09-13T15:43:35Z
draft = true

[taxonomies]
tags = ["Kubernetes"]
+++

# Rancher env for non production workloads

Deploy the [aws-devcluster.yaml](/aws-devcluster.yaml) cloudformation template then use the bootstrap script below to install rancher / longhorn (connect to the instance via SSM).

```bash
export FQDN=...
helm repo add jetstack https://charts.jetstack.io
helm repo add longhorn https://charts.longhorn.io
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm install --atomic cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set crds.enabled=true
helm install --atomic longhorn longhorn/longhorn --namespace longhorn-system --create-namespace  --set defaultSettings.defaultDataLocality=best-effort --set defaultSettings.storageReservedPercentageForDefaultDisk=10
helm install --atomic rancher rancher-latest/rancher --create-namespace --namespace cattle-system --set ingress.tls.source=letsEncrypt --set letsEncrypt.ingress.class=traefik --set hostname=$FQDN --set letsEncrypt.email=$FQDN@maildrop.cc
echo https://$FQDN/dashboard/?setup=$(kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}')
```

As all the dirs are on ZFS, local snapshotting is used to enable rollbacks / basic DR.