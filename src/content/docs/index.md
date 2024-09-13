---
title: DGov Site Reliability Engineering
pubDate: 2024-09-13T16:05:12Z
---

# Overview

Initial goal is reducing cost/effort to run a security focused [Internal Developer Platform](https://internaldeveloperplatform.org) with a small team.

## General approach to secure development and infrastructure management

Aligned with [CISA Secure By Design Principles](https://www.cisa.gov/resources-tools/resources/secure-by-design) - make sure all code and infra is managed in git repos, per repo try to implement the following:

- Code repos should have [codeql](https://docs.github.com/en/code-security/code-scanning/introduction-to-code-scanning/about-code-scanning-with-codeql) + [supply chain security (dependabot)](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/about-supply-chain-security) + [secrets](https://docs.github.com/en/code-security/secret-scanning/introduction/about-secret-scanning) + [grype (containers)](https://github.com/anchore/grype) reporting configured (preference Helm / Terraform IaC artifacts)
- Infrastructure manifests should have [Trivy misconfiguration](https://aquasecurity.github.io/trivy/v0.55/tutorials/misconfiguration/terraform/) reporting configured
  - Deployments should be from infra repos (ideally proxied through [self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners) using [AWS instance roles](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html) / [Azure managed identities](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/how-to-configure-managed-identities?pivots=qs-configure-portal-windows-vm) to avoid credential handling and minimise internet exposure of admin interfaces)
  - If deployments still manual/external, introspection and automated commits from a tool like [terraformer](https://github.com/GoogleCloudPlatform/terraformer) required to ensure drift detection and full visibility of assets.

## Training on Cloud Native Infrastructure & Application Development

Aim to medium term (e.g. 1-2 years) go for a formal certification like [Certified Kubernetes Administrator (CKA) + Certified Kubernetes Application Developer (CKAD) + Certified Kubernetes Security Specialist (CKS) Exam Bundle - Linux Foundation - Training](https://training.linuxfoundation.org/training/cka-ckad-cks-exam-bundle/) .

Free courses:

- [Introduction to Cloud Infrastructure Technologies (LFS151) | Linux Foundation Training](https://training.linuxfoundation.org/training/introduction-to-cloud-infrastructure-technologies/)
- [Introduction to Kubernetes (LFS158) | Linux Foundation](https://training.linuxfoundation.org/training/introduction-to-kubernetes/)

Tools / tutorials to help with training

- GitHub CodeSpaces - for secure local dev [Quickstart for GitHub Codespaces - GitHub Docs](https://docs.github.com/en/codespaces/getting-started/quickstart)
- Skaffold + minikube - for building app manifests to deploy to k8s [Skaffold Quickstart](https://skaffold.dev/docs/quickstart/)
- AWS Cluster API - for building target k8s environments [Getting Started - Kubernetes Cluster API Provider AWS](https://cluster-api-aws.sigs.k8s.io/getting-started)
- Terrform AWS Services - for building supporting infra in AWS [Manage AWS RDS instances | Terraform | HashiCorp Developer](https://developer.hashicorp.com/terraform/tutorials/aws/aws-rds)

## References
- [Kubernetes Cluster API](https://cluster-api.sigs.k8s.io)
- [CNCF Landscape](https://landscape.cncf.io)
- [Internal Developer Platform](https://internaldeveloperplatform.org)
- [CISA Secure By Design Principles](https://www.cisa.gov/resources-tools/resources/secure-by-design)
- [DoD Platform One](https://p1.dso.mil)
