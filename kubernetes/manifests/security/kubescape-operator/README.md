# Setup

## View your cluster's configuration scanning schedule

```bash
kubectl -n security get cj kubescape-scheduler -o=jsonpath='{.metadata.name}{"\t"}{.spec.schedule}{"\n"}'
```

## To change the schedule, set `.spec.schedule`

```bash
kubectl -n security edit cj kubescape-scheduler
```

## View your cluster's image scanning schedule

```bash
kubectl -n security get cj kubevuln-scheduler -o=jsonpath='{.metadata.name}{"\t"}{.spec.schedule}{"\n"}'
```

## To change the schedule, edit `.spec.schedule`

```bash
kubectl -n security edit cj kubevuln-scheduler
```

## View your image vulnerabilities scan summaries

```bash
kubectl get vulnerabilitymanifestsummaries -A
```

## Detailed reports are also available

```bash
kubectl get vulnerabilitymanifests -A
```

## kubescape-operator generates suggested network policies. To view them

```bash
kubectl get generatednetworkpolicies -n <namespace>
```

---

WARNING: capabilities.nodeProfileService=enable but the backend is not configured (.Values.server is empty / submit is disabled). This capability requires the synchronizer, which is only enabled when connected to a backend, so nodeProfileServiceEnabled renders as FALSE in the node-agent configmap and node profiles will NOT be generated. To use it, set .Values.server (requires account and accessKey, or an existing credentials.cloudSecret).

WARNING: capabilities.networkEventsStreaming=enable but the backend is not configured (.Values.server is empty / submit is disabled). This capability requires submitting data to a backend, so networkStreamingEnabled renders as FALSE in the node-agent configmap and network events will NOT be streamed. To use it, set .Values.server (requires account and accessKey, or an existing credentials.cloudSecret).

WARNING: capabilities.httpDetection=enable but capabilities.runtimeDetection is not enabled. HTTP detection runs on top of runtime detection, so httpDetectionEnabled renders as FALSE in the node-agent configmap. To use it, set capabilities.runtimeDetection=enable.
