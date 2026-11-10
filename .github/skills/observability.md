# SKILL: Observability Integration

## Core Requirements (Priority 3)

* **Telemetry Availability:** Ensure infrastructure manifests automatically output telemetry endpoints. Pair Kubernetes service creations with matching `ServiceMonitor` or `PodMonitor` definitions.
* **Structured Output:** Standardize application or automation logs to structured JSON outputs to allow reliable log shipping, ingestion, and metric generation.
