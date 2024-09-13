---
title: Home
---

# Overview

Initial goal is reducing cost/effort to run a security focused [Internal Developer Platform](https://internaldeveloperplatform.org) with a small team.

## Training on Cloud Native Infrastructure & Application Development

Aim to medium term (e.g. 1-2 years) go for a formal certification like [![](https://training.linuxfoundation.org/wp-content/uploads/2018/07/cropped-unnamed-32x32.png)Certified Kubernetes Administrator (CKA) + Certified Kubernetes Application Developer (CKAD) + Certified Kubernetes Security Specialist (CKS) Exam Bundle - Linux Foundation - Training](https://training.linuxfoundation.org/training/cka-ckad-cks-exam-bundle/) .

Free courses:

- [Introduction to Cloud Infrastructure Technologies (LFS151) | Linux Foundation Training](https://training.linuxfoundation.org/training/introduction-to-cloud-infrastructure-technologies/)
- [Introduction to Kubernetes (LFS158) | Linux Foundation](https://training.linuxfoundation.org/training/introduction-to-kubernetes/)

Tools / tutorials to help with training

- GitHub CodeSpaces - for secure local dev [Quickstart for GitHub Codespaces - GitHub Docs](https://docs.github.com/en/codespaces/getting-started/quickstart)
- Skaffold + minikube - for building app manifests to deploy to k8s [Skaffold Quickstart](https://skaffold.dev/docs/quickstart/)
- AWS Cluster API - for building target k8s environments [Getting Started - Kubernetes Cluster API Provider AWS](https://cluster-api-aws.sigs.k8s.io/getting-started)
- Terrform AWS Services - for building supporting infra in AWS [Manage AWS RDS instances | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/tutorials/aws/aws-rds)

## General approach to secure development practices

Make sure all code and infra is managed in git repos, per repo try to implement the following:

- Code repos should have [codeql](https://docs.github.com/en/code-security/code-scanning/introduction-to-code-scanning/about-code-scanning-with-codeql) + [supply chain security (dependabot)](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/about-supply-chain-security) + [secrets](https://docs.github.com/en/code-security/secret-scanning/introduction/about-secret-scanning) + [grype (containers)](https://github.com/anchore/grype) reporting configured
- Infrastructure manifests should have [Trivy misconfiguration](https://aquasecurity.github.io/trivy/v0.55/tutorials/misconfiguration/terraform/) reporting configured
  - Deployments should be from infra repos (ideally proxied through [self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners) using [AWS instance roles](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html) / [Azure managed identities](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-to-configure-managed-identities?pivots=qs-configure-portal-windows-vm) to avoid credential handling)
  - If deployments still manual/external, introspection and automated commits from a tool like [terraformer](https://github.com/GoogleCloudPlatform/terraformer) required to ensure drift detection and full visibility of assets

## Opinionated CNCF k8s platforms

Below guides are to setup [Certified Kubernetes](https://www.cncf.io/training/certification/software-conformance/) on public cloud environments with:

- [Karpenter](https://karpenter.sh) to prefer spot nodes and revert to ondemand if they aren’t available
- [Longhorn ready nodes and NVMe disks](https://longhorn.io/docs/latest/references/settings/#create-default-disk-on-labeled-nodes)  with [best-effort data locality](https://longhorn.io/docs/latest/high-availability/data-locality/#data-locality-settings)
- [Traefik](https://doc.traefik.io/traefik/) and [LetsEncrypt](https://letsencrypt.org/getting-started/) with a [cert-manager (ACME)](https://cert-manager.io/docs/configuration/acme/#configuration) ClusterIssuer configured
- [Rancher](https://ranchermanager.docs.rancher.com/getting-started/overview) and [Fleet](https://fleet.rancher.io) for multi cluster admin, gitops and access mgmt.

## Install Guides

- Azure with [AKS Automatic](docs/kubernetes/aks-automatic)
- TODO: AWS with [karpenter/eksctl](https://karpenter.sh/v1.0/getting-started/getting-started-with-karpenter/)
- TODO: GKE with [Autopilot](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)
- TODO: OCI with [OKE](https://www.oracle.com/cloud/cloud-native/kubernetes-engine/features/)

## References
- [CNCF Landscape](https://landscape.cncf.io)
- [Internal Developer Platform](https://internaldeveloperplatform.org)
- [CISA Secure By Design Principles](https://www.cisa.gov/resources-tools/resources/secure-by-design)
- [DoD Platform One](https://p1.dso.mil)
