---
title: AWS EC2 Dev Cluster
---

# Rancher env for non production workloads

Deploy the [aws-devcluster.yaml](/aws-devcluster.yaml) cloudformation template then use the bootstrap script below to install rancher / longhorn (connect to the instance via SSM).

```bash
# TODO
```

As all the dirs are mounted from FSX, the backups of the FSX vol will cover whole environment, and new booted instances will remember/pick up full local rancher/cluster config.