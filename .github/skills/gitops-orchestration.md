# SKILL: GitOps, Helmfile, & Cloud-Native Orchestration

## Core Requirements (Priority 3)

* **Declarative Integrity:** All Kubernetes workloads must follow strict GitOps paradigms for Flux CD and ArgoCD. Structure configurations so that the continuous delivery controllers remain the single source of truth.
* **Helmfile Optimization:** Write scalable `helmfile.yaml` declarations utilizing environment expressions (e.g., `{{ .Environment.Name }}`), explicit release names, and cleanly decoupled values layers.
* **Workload Resiliency:** Every generated manifest or template must enforce operational boundaries: include realistic CPU/Memory `requests` and `limits`, explicitly define `livenessProbes` and `readinessProbes`, and prohibit the usage of the `:latest` image tag in favor of semantic versions or precise image digests.
