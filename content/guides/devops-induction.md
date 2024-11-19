+++
title = "Civic Code Lab - Foundations Guide (v0.2 - 2024)"
date = 2024-11-19

[taxonomies]
tags = ["Training"]
+++

## Note for New Team Members

Please consult with your manager to create a personalised learning path based on:
* Your current role requirements
* Professional development goals
* Prior experience level

*Note: Timeline estimates assume 5-10 hours of study per week alongside regular work duties. Progress may vary based on prior experience and available study time.*

## Getting Started

### Useful Tools

**Development Environment**
* Github: https://docs.github.com/en/codespaces/getting-started/quickstart

**Kubernetes (CNCF) Tools**
* Skaffold: https://skaffold.dev/docs/quickstart/
* Minikube: https://kubernetes.io/docs/tutorials/hello-minikube/
* Talos Linux: https://www.talos.dev/v1.8/introduction/getting-started/

**Infrastructure as Code**
* AWS IaC: https://developer.hashicorp.com/terraform/tutorials/aws-get-started
* Azure IaC: https://developer.hashicorp.com/terraform/tutorials/azure-get-started

## Free Training Resources

These are our recommended resources for building core technical skillsets.

### 1. Cloud Native Fundamentals (4-6 weeks)

**👉 New Team Members Start Here!**

* Linux Foundation Cloud Intro: https://training.linuxfoundation.org/training/introduction-to-cloud-infrastructure-technologies/
  * Expected outcomes: Understanding of cloud native architecture and principles
* Linux Foundation Kubernetes Intro: https://training.linuxfoundation.org/training/introduction-to-kubernetes/
  * Expected outcomes: Understanding of container orchestration and basic DevOps practices

### 2. Cloud Platform Essentials (2-3 weeks)

**AWS Resources**
* AWS Cloud Practitioner: https://explore.skillbuilder.aws/learn/course/external/view/elearning/134/aws-cloud-practitioner-essentials
* AWS Security Fundamentals: https://explore.skillbuilder.aws/learn/course/external/view/elearning/48/aws-security-fundamentals

**Azure Resources**
* Azure Fundamentals: https://learn.microsoft.com/en-us/training/courses/az-900t00
* Microsoft Security: https://microsoft.github.io/PartnerResources/skilling/microsoft-security-academy/start

### 3. Development Paths

Understanding the OWASP Projects (https://owasp.org/projects/) focused on Secure Development Life Cycle's (SDLC) will help in getting across the common security capabilities platforms and software should generally have. The below **Data Integration** and **Frontend Frameworks** all are typically secure by default, however the way they are deployed can significantly change their risk profile. For production or high risk environments it's always best to review the operational procedures against the 2 above standards.

#### Backend Development (4-6 weeks)
Expected outcomes: Basic programming skills, understanding of software design principles and secure development practices

* Python: https://third-bit.com/sdxpy/
* JavaScript: https://third-bit.com/sdxjs/
* **Software and code security**
  * Safestack intro: https://safestack.io/free-application-security-program/
  * OWASP ASVS https://owasp.org/www-project-application-security-verification-standard/ for software executing on servers (such as Websites and API's) - default to ASVS Level 2
  * OWASP MASVS https://mas.owasp.org/MASVS/ for software executing on clients (such as Mobile Applications) - default to MAS-L2
  * Testing & QA - Scan for vulnerabilities and configuration/secret issues with https://aquasecurity.github.io/trivy/v0.57/
  * Testing & QA - https://playwright.dev/

#### Data Integration (2-3 weeks each)
Expected outcomes: Understanding how to ingest/manage data with Python and SQL and generate reports with Markdown

* SQL & Data Pipelines: https://sqlmesh.readthedocs.io/en/stable/concepts/overview/
  * R Programming: https://books.ropensci.org/targets/ (for data scientists familiar with R)
* Documentation & Reporting: https://quarto.org/

#### Frontend Frameworks (1-2 weeks each)
The below frameworks are all focused on having simple, minimal code easy for small teams to maintain.

* Evidence Web Reports https://evidence.dev - Web based reporting stack ties nicely in with sqlmesh flows all built on https://duckdb.org
* Capacitor UI Abstraction https://capacitorjs.com/docs/getting-started/ui - Capacitor has excellent web/PWA/iOS/Android targeting support, focusing on https://ionicframework.com/docs/react likely easiest for a newcomer due to availability of docs etc.
* Streamlit in browser python prototypes https://edit.share.stlite.net can be used for fast prototypes in python that compiles to browser
* Zola (https://www.getzola.org) is a fast simple static site generator, Astro (https://astro.build) adds lots more js/app functions but is more complex

### 4. Paid Certifications (2-3 months)

* Linux Foundation CNCF Bundle https://training.linuxfoundation.org/training/cka-ckad-cks-exam-bundle/
* AWS Solutions Architect https://aws.amazon.com/certification/certified-solutions-architect-associate/
* Azure Developer Associate https://learn.microsoft.com/en-us/credentials/certifications/azure-developer/?practice-assessment-type=certification