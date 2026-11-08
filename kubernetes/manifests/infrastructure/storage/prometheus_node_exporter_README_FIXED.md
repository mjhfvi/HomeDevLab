
# 📦 Prometheus Node Exporter Setup on Storage Server

## ⚡ TL;DR

1. SSH into your NAS server:
   ```bash
   ssh username@nas-storage-ip
   ```

2. Create systemd service (run this as one command):
   ```bash
   sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
   [Unit]
   Description=Prometheus Node Exporter
   After=network.target

   [Service]
   ExecStart=/usr/local/bin/node_exporter
   Restart=always

   [Install]
   WantedBy=multi-user.target
   EOF
   ```

3. Download & install Node Exporter:
   ```bash
   wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz
   tar xvf node_exporter-1.8.1.linux-amd64.tar.gz
   sudo mv node_exporter-1.8.1.linux-amd64/node_exporter /usr/local/bin/
   sudo systemctl daemon-reexec
   sudo systemctl daemon-reload
   sudo systemctl enable node_exporter
   sudo systemctl start node_exporter
   ```

4. Verify Node Exporter is running:
   ```bash
   curl http://localhost:9100/metrics
   ```

5. Add to your Prometheus config:
   ```yaml
   - job_name: 'nas-node-exporter'
     static_configs:
       - targets: ['<nas-storage-ip>:9100']
   ```

---

## 🖥️ Step 1: SSH into the Storage Server

```bash
ssh username@nas-storage-ip
```

Replace `username` with your actual username and `nas-storage-ip` with the NAS IP address.

---

## 📥 Step 2: Download and Install Node Exporter

```bash
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz
tar xvf node_exporter-1.8.1.linux-amd64.tar.gz
sudo mv node_exporter-1.8.1.linux-amd64/node_exporter /usr/local/bin/
```

---

## ⚙️ Step 3: Create a systemd Service

Create and open the systemd service file:

```bash
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOF
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
ExecStart=/usr/local/bin/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
EOF
```

---

## ▶️ Step 4: Start and Enable Node Exporter

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
```

---

## ✅ Step 5: Verify

Check that Node Exporter is running:

```bash
curl http://localhost:9100/metrics
```

Or check its systemd status:

```bash
systemctl status node_exporter
```

---

## 📡 Prometheus Configuration (Example)

In your Prometheus `prometheus.yml`:

```yaml
- job_name: 'nas-node-exporter'
  static_configs:
    - targets: ['<nas-storage-ip>:9100']
```

Replace `<nas-storage-ip>` with the actual IP of the NAS server.

---
