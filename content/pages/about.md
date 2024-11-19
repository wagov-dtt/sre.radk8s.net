+++
title = "About"
path = "about"
template = "pages.html"
draft = false
+++

# About

Initial goal is reducing cost/effort to run a security focused [Internal Developer Platform](https://internaldeveloperplatform.org) with a small team.

## Guiding Principles

### For all systems and services:

1.  **Security by design**

    1.  Integrate security practices throughout the development lifecycle, not as an afterthought, reference: [ACSC Secure-by-Design](https://www.cyber.gov.au/resources-business-and-government/governance-and-user-education/secure-by-design "https://www.cyber.gov.au/resources-business-and-government/governance-and-user-education/secure-by-design")

        -   Software executing on servers (such as Websites, API's) will be constructed to meet the [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/ "https://owasp.org/www-project-application-security-verification-standard/") v4+ standard to ASVS Level 2. 

        -   Software executing on clients (such as Mobile Applications) will be constructed to meet the [OWASP MASVS](https://mas.owasp.org "https://mas.owasp.org") v2+ standard to MAS-L1. 

    2.  Ensure service providers meet the [Minimum Viable Secure Product](https://mvsp.dev "https://mvsp.dev") baseline, and additional security controls from the [WA Cyber Security Policy](https://www.wa.gov.au/government/publications/2024-wa-government-cyber-security-policy "https://www.wa.gov.au/government/publications/2024-wa-government-cyber-security-policy") if needed by the organisations risk assessment.

2.  **Privacy by design**

    1.  Embed privacy protections into the design and architecture of IT systems and business practices from the outset, not as an afterthought, reference [OAIC Privacy by design](https://www.oaic.gov.au/privacy/privacy-guidance-for-organisations-and-government-agencies/privacy-impact-assessments/privacy-by-design "https://www.oaic.gov.au/privacy/privacy-guidance-for-organisations-and-government-agencies/privacy-impact-assessments/privacy-by-design") and [WA Privacy and Responsible Information Sharing](https://www.wa.gov.au/government/privacy-and-responsible-information-sharing "https://www.wa.gov.au/government/privacy-and-responsible-information-sharing").

3.  **Data Classification and Handling**

    1.  Classify information based on sensitivity and implement appropriate handling procedures throughout the data lifecycle, reference [WA Information Classification Policy](https://www.wa.gov.au/government/publications/western-australian-information-classification-policy "https://www.wa.gov.au/government/publications/western-australian-information-classification-policy")

4.  **Align investment to risk and market capabilities**

    1.  Systematically migrate legacy systems to modern, low-risk environments with reduced technical debt, prioritising based on business value and risk assessment, reference [ACSC Managing the Risks of Legacy IT: Executive Guidance](https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/legacy-it-management/managing-risks-legacy-it-executive-guidance "https://www.cyber.gov.au/resources-business-and-government/maintaining-devices-and-systems/system-hardening-and-administration/legacy-it-management/managing-risks-legacy-it-executive-guidance")

    2.  Re-use or acquire systems where existing or commercial options closely match business needs

    3.  Develop systems where commercial options are limited or would require significant tailoring to meet business needs

5.  **Adopt [**CNCF Cloud-native**](https://github.com/cncf/toc/blob/main/DEFINITION.md "https://github.com/cncf/toc/blob/main/DEFINITION.md") practices**

    1.  Architect loosely coupled systems that interoperate in a manner that is secure, resilient, manageable, sustainable, and observable. 

    2.  Use automation and the above practices to enable your organization to make high-impact changes frequently, predictably, with minimal toil and clear separation of concerns.

### For organisation developed systems:

1.  **Ownership and Open Source Licencing**

    1.  Retain ownership of code and artifacts developed with public funding and use the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0 "https://www.apache.org/licenses/LICENSE-2.0") to enable broad use, modification, and distribution while limiting legal liability.

2.  **Microservices architecture**

    1.  Design applications as collections of loosely coupled, independently deployable services, reference [Microservices Patterns](https://microservices.io/patterns/index.html "https://microservices.io/patterns/index.html")

    2.  Adopt [Service meshes](https://landscape.cncf.io/guide#orchestration-management--service-mesh "https://landscape.cncf.io/guide#orchestration-management--service-mesh") to add reliability, observability, and security features uniformly across all services on a platform layer without touching the app code. They are compatible with any programming language, allowing development teams to focus on writing business logic.

    3.  Develop and document APIs according to the [OpenAPI Specification](https://spec.openapis.org/oas/latest.html "https://spec.openapis.org/oas/latest.html") to ensure consistency, clarity, and interoperability

3.  **Containerization and orchestration**

    1.  Package applications and dependencies into containers for consistency and portability, reference [CNCF Application Definition & Image Build](https://landscape.cncf.io/guide#app-definition-and-development--application-definition-image-build "https://landscape.cncf.io/guide#app-definition-and-development--application-definition-image-build")

4.  **Continuous Integration & Delivery**

    1.  Automate watching source code for changes, automatically building and testing the code, then begin moving it from development to production where it has to pass a variety of tests or validation to determine if the process should continue or fail, reference [CNCF Continuous Integration & Delivery](https://landscape.cncf.io/guide#app-definition-and-development--continuous-integration-delivery "https://landscape.cncf.io/guide#app-definition-and-development--continuous-integration-delivery")

## References
- [Kubernetes Cluster API](https://cluster-api.sigs.k8s.io)
- [CNCF Landscape](https://landscape.cncf.io)
- [Internal Developer Platform](https://internaldeveloperplatform.org)
- [CISA Secure By Design Principles](https://www.cisa.gov/resources-tools/resources/secure-by-design)
- [DoD Platform One](https://p1.dso.mil)
