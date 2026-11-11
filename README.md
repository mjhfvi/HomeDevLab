# HomeDevLab

A technical home lab and infrastructure engineering repository focused on automating, hardening, and validating a self-hosted Kubernetes platform using Infrastructure as Code, configuration management, and security-first DevOps practices.

This project is designed as a practical portfolio for DevOps and platform engineering roles, showcasing automation for cluster bootstrap, cloud provisioning, environment standardization, and secure deployment workflows.

## Overview

HomeDevLab combines:

- Ansible for operating system and cluster bootstrap automation
- Terragrunt + Terraform-style IaC patterns for multi-cloud and Kubernetes provisioning
- Kubernetes deployment patterns for self-hosted workloads
- Security controls and policy hardening (secret scanning, linting, CI checks)
- Documentation and testing strategies to demonstrate production-minded engineering practices

The repository is intentionally structured to look and behave like a real-world platform automation codebase rather than a toy lab, with clear separation between infrastructure, applications, security, and delivery concerns.

## Architecture

```text
┌───────────────────────────────┐
│        Operations Layer       │
│  Ansible + Jenkins + tooling  │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│      Infrastructure Layer     │
│    Terragrunt / Terraform     │
│  AWS / Azure / Cloudflare     │
│  Kubernetes / Network Config  │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│      Workload Layer           │
│  Kubernetes workloads, apps   │
│  Helm / runtime services      │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│      Security & Validation    │
│  linting, secret scanning,    │
│  checks, test strategies      │
└───────────────────────────────┘
```

## Repository Structure

```text
.
├── .github/                 # CI/CD and workflow automation
├── .jenkins/               # Jenkins-related configuration
├── .vscode/                # Editor and workspace settings
├── ansible/                # Provisioning and Kubernetes bootstrap automation
│   ├── group_vars/
│   ├── roles/
│   ├── templates/
│   ├── playbook.yaml
│   ├── requirements.yaml
│   ├── README.md
│   ├── SECURITY.md
│   └── CLEANUP.md
├── continuous_testing/     # Test and validation strategy notes
├── documentation/          # Architecture and operational docs
├── kubernetes/             # Kubernetes manifests and workload assets
├── security/               # Security hardening and policy assets
├── terragrunt/             # Environment orchestration and cloud IaC modules
│   ├── aws/
│   ├── azure/
│   ├── cloudflare/
│   ├── kubernetes/
│   ├── global.hcl
│   └── README.md
├── .pre-commit-config.yaml # Local validation hooks
├── .gitleaks.toml          # Secret scanning configuration
├── .yamllint               # YAML linting config
├── tox.ini                 # Python test configuration
├── sonar-project.properties # Code quality config
├── README.md               # Project overview
└── LICENSE                 # Project licensing (if present in the repository)
```

## Core Technologies

- Ansible: configuration management and OS / cluster setup automation
- Kubernetes: control-plane and workload orchestration for self-hosted services
- Terragrunt: reusable environment orchestration for cloud and platform infrastructure
- Helm / Kubernetes packaging patterns: deployment of applications into cluster environments
- Python: automation support, tooling, and validation scripts
- Groovy / Jenkins pipeline automation
- HCL: infrastructure definition and configuration
- Bash / Shell: operational tooling and environment bootstrapping
- GitHub Actions / CI integration patterns
- Static analysis and security scanning: gitleaks, yamllint, pre-commit, SonarQube

## What This Project Demonstrates

### Infrastructure as Code

The repository illustrates a practical IaC mindset with environment-aware configuration, modular folder structure, and provider-specific orchestration for multi-cloud and hybrid-lab setups.

### Automated Provisioning

Ansible playbooks automate the core lifecycle tasks:

- base OS preparation
- package installation
- Docker installation
- Kubernetes node configuration
- CNI and cluster bootstrap operations
- Helm installation
- ArgoCD or platform service setup
- cleanup and fail-safe teardown flows

### Platform Hardening

The project includes strong DevSecOps patterns with:

- secret scanning via gitleaks
- YAML validation
- linting configuration
- pre-commit validation hooks
- security documentation and review-oriented setup files

### Operational Readiness

The structure is intentionally designed around production operational patterns:

- environment separation
- repeatable automation
- documentation for troubleshooting
- cleanup procedures for lab and testing environments
- modularized cloud/platform configuration

## Typical Deployment Flow

```bash
# 1. Configure environment and inventory
# 2. Bootstrap OS and packages via Ansible
ansible-playbook -i inventory.yaml playbook.yaml --tags ubuntu_setup,docker_setup

# 3. Build Kubernetes control plane / workers
ansible-playbook -i inventory.yaml playbook.yaml --tags kubeadm_setup

# 4. Deploy platform services and workloads
helm install <release> ./charts/<chart>

# 5. Validate environment and security posture
pre-commit run --all-files
```

## Security & Quality Controls

This repository follows a security-first engineering mindset:

- pre-commit hooks for code hygiene and consistency
- secret detection and baseline management
- YAML linting and formatting validation
- SonarQube configuration for static quality analysis
- environment-specific documentation to reduce deployment drift

## DevOps Competencies Highlighted

This project is aligned to the following DevOps capability areas:

- Cloud infrastructure automation
- Kubernetes platform operations
- Configuration management
- CI/CD and pipeline thinking
- Environment standardization
- Infrastructure hardening
- Operational documentation and troubleshooting
- Security-conscious automation practices

## Career / CV Note for DevOps Recruitment

This project reflects hands-on experience in building and automating a self-hosted infrastructure platform using modern DevOps tooling and practices. It demonstrates competence in Infrastructure as Code, configuration management, Kubernetes operations, environment automation, and security hardening. The repository was designed to showcase practical skills relevant to DevOps Engineer, Platform Engineer, Cloud Engineer, and Site Reliability Engineering roles, with emphasis on repeatability, automation, troubleshooting, and secure deployment workflows.

## CV-Friendly Summary

DevOps Engineer with hands-on experience designing and automating self-hosted infrastructure using Ansible, Kubernetes, Terragrunt, Helm, and cloud-native tooling. Focused on Infrastructure as Code, environment provisioning, operational automation, platform security, and production-ready deployment workflows. Experienced in building repeatable, secure, and maintainable automation for hybrid and multi-environment infrastructure projects.

## Recommended Use

This repository is suitable as:

- a personal DevOps portfolio project
- an infrastructure automation lab
- a practical example of enterprise-style automation structure
- a basis for discussing real-world platform engineering responsibilities in interviews

## Contact

For collaboration opportunities, platform engineering discussions, or DevOps recruitment conversations:

- LinkedIn: <https://www.linkedin.com/in/mjhfvi>
- Email: <mjhfvi@gmail.com>

---
