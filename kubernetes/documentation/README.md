# Kubernetes Cluster Manifests (ArgoCD + Helm)

This repository contains Kubernetes manifests and Helm definitions used to bootstrap cluster infrastructure and application stacks. The main workflow is:

- Deploy AWS EBS CSI Driver
- Deploy AWS Load Balancer Controller
- Deploy Traefik
- Deploy ArgoCD/Argocd Image Updater
- Deploy Crossplane
- Deploy OpenSearch/OpenSearch-Dashboards/OpenTelemetry
- Deploy Vantage Kubernetes Agent
- Deploy Kite
- Deploy KEDA
- Deploy Stakater Reloader
- Deploy External Secrets Operator
- Deploy Grafana/Prometheus

## Prerequisites

- `kubectl` configured for the target cluster
- `helm` installed
- Cluster permissions to create namespaces and install controllers

## Quick Start

**Note**: See more information about the namespace structure in this link: [Namespace Structure]()

### Deploy AWS CSI Driver and Load Balancer Controller

This guide will deploy the AWS EBS CSI Driver and AWS Load Balancer Controller to the cluster, to automate provisioning of persistent volumes and load balancers for applications.

[See Instructions](./kube-system/README.md)

## Deploy Traefik

This guide will deploy Traefik as the Ingress Controller for the cluster using the AWS Load Balancer Controller, to manage incoming traffic and route it to applications.

[See Instructions](./infrastructure/traefik/README.md)

### Deploy ArgoCD

This guide will deploy ArgoCD to the cluster using Helm, to enable GitOps-based continuous deployment of applications and infrastructure.

[See Instructions](./infrastructure/argocd/README.md)

## Deploy Crossplane

This guide will deploy Crossplane to the cluster using Helm, to enable infrastructure provisioning and management using Kubernetes manifests.

[See Instructions](./infrastructure/crossplane/README.md)

## Deploy OpenSearch

This guide will deploy OpenSearch to the cluster using Helm, to provide a scalable search and analytics engine for application data.

[See Instructions](./observability/opensearch/README.md)

## Deploy Vantage Kubernetes Agent

This guide will deploy the Vantage Kubernetes Agent to the cluster using Helm, to enable monitoring and observability of cluster resources and applications.

[See Instructions](./observability/vantage/README.md)

## Deploy Kite

This guide will deploy Kite to the cluster using Helm, to provide a management interface for cluster resources and applications.

[See Instructions](./management/kite/README.md)

## Deploy KEDA

This guide will deploy KEDA to the cluster using Helm, to enable event-driven autoscaling of applications.

[See Instructions](./infrastructure/keda/README.md)

## Deploy Stakater Reloader

This guide will deploy Stakater Reloader to the cluster using Helm, to enable automatic reloading of applications when ConfigMaps or Secrets change.

[See Instructions](./infrastructure/stakater/README.md)

---

## Service URLs and Endpoints

This provides a quick reference guide for accessing all externally available services across development and production clusters.

[See Service URLs](./URLS.md)

---

### Configure Kubernetes with Lens

This guide will show how to configure the Kubernetes cluster with Lens, a popular Kubernetes IDE, to enable easy management and monitoring of cluster resources.

[See Instructions](./documentation/LENS.md)

---

## Add Services to the Cluster

This guide will show how to add services to the cluster, to enable deployment and management of applications using Deploy.

[See Instructions](./documentation/CREDENTIALS.md)

## Update Kubernetes Cluster

This guide will show how to update the Kubernetes cluster with new services and applications, to ensure that the cluster remains up-to-date and can support the latest features and capabilities.

[See Instructions](./documentation/UPDATE.md)
