
# Docker Daemon Metrics Setup with Prometheus

This guide explains how to enable Docker daemon metrics on Linux servers and configure Prometheus (running in Kubernetes) to scrape those metrics.

---

## Prerequisites

- Linux servers running Docker daemon with root or sudo access.
- Kubernetes cluster with Prometheus deployed in the `monitoring` namespace.
- `kubectl` access to your Kubernetes cluster.
- Prometheus running as a Pod using a ConfigMap for configuration.

---

## Step 1: Enable Docker Daemon Metrics on Linux Servers

1. **Edit Docker daemon config:**

Create or modify `/etc/docker/daemon.json`:

```json
{
  "metrics-addr": "0.0.0.0:9323",
  "experimental": true
}
```

2. **Remove conflicting systemd flags:**

If Docker’s systemd service passes `--metrics-addr` or `--experimental` flags, remove them to avoid conflicts.

Create or edit `/etc/systemd/system/docker.service.d/override.conf` with:

```ini
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
```

3. **Reload systemd and restart Docker:**

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart docker
```

4. **Verify Docker metrics endpoint:**

```bash
curl http://<docker-host-ip>:9323/metrics
```

You should see metrics output.

---

## Step 2: Configure Prometheus to Scrape Docker Metrics

1. **Update Prometheus ConfigMap (`prometheus-prometheus-server-config` in `monitoring` namespace):**

Add the following job under `scrape_configs`:

```yaml
- job_name: 'docker-daemon'
  static_configs:
    - targets:
        - 'ip:9323'
```

2. **Apply ConfigMap:**

```bash
kubectl apply -f prometheus-configmap.yaml
```

3. **Restart Prometheus pod:**

```bash
kubectl delete pod prometheus-server-<pod-id> -n monitoring
```

4. **Verify scrape targets:**

Visit `http://<prometheus-service-ip>:9090/targets` and ensure `docker-daemon` targets are UP.

---

Feel free to customize IPs and namespaces to fit your environment.

---

# License

This guide is provided as-is, free to use and modify.
