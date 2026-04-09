# 🚀 Monitoring Setup (Prometheus + Grafana + Node Exporter)

## 🧱 Architecture Overview

* **Node Exporter** → Collects system metrics (CPU, RAM, Disk)
* **Prometheus** → Scrapes metrics from Node Exporter
* **Grafana** → Visualizes data from Prometheus

---

## ✅ Step 1: Launch EC2 Instance (AWS)

* Instance Type: `t2.micro` (free tier)
* OS: Ubuntu 22.04
* Open Ports in Security Group:

  * `22` → SSH
  * `9090` → Prometheus
  * `3000` → Grafana
  * `9100` → Node Exporter

---

## ✅ Step 2: Install Prometheus

```bash
# Create user
sudo useradd --no-create-home --shell /bin/false prometheus

# Download Prometheus
cd /tmp
wget https://github.com/prometheus/prometheus/releases/latest/download/prometheus-*.linux-amd64.tar.gz

# Extract
tar -xvf prometheus-*.tar.gz
cd prometheus-*

# Move binaries
sudo cp prometheus /usr/local/bin/
sudo cp promtool /usr/local/bin/

# Create config dir
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

# Copy config
sudo cp prometheus.yml /etc/prometheus/
```

---

## ✅ Step 3: Configure Prometheus

```bash
sudo vim /etc/prometheus/prometheus.yml
```

```yaml
scrape_configs:
  - job_name: "node_exporter"
    static_configs:
      - targets: ["localhost:9100"]
```

---

## ✅ Step 4: Create Prometheus Service

```bash
sudo vim /etc/systemd/system/prometheus.service
```

```ini
[Unit]
Description=Prometheus
After=network.target

[Service]
User=prometheus
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
```

---

## ✅ Step 5: Install Node Exporter

```bash
cd /tmp
wget https://github.com/prometheus/node_exporter/releases/latest/download/node_exporter-*.linux-amd64.tar.gz

tar -xvf node_exporter-*.tar.gz
cd node_exporter-*

sudo cp node_exporter /usr/local/bin/
```

---

## ✅ Step 6: Create Node Exporter Service

```bash
sudo vim /etc/systemd/system/node_exporter.service
```

```ini
[Unit]
Description=Node Exporter

[Service]
User=prometheus
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
```

---

## ✅ Step 7: Install Grafana

```bash
sudo apt-get update
sudo apt-get install -y software-properties-common

# Add repo
sudo apt-get install -y apt-transport-https
sudo mkdir -p /etc/apt/keyrings/

wget -q -O - https://apt.grafana.com/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/grafana.gpg

echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Install
sudo apt-get update
sudo apt-get install grafana -y
```

```bash
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
```

---

## ✅ Step 8: Access Services

* Prometheus:
  `http://<EC2-IP>:9090`

* Grafana:
  `http://<EC2-IP>:3000`
  Default login:

  * user: `admin`
  * pass: `admin`

---

## ✅ Step 9: Connect Prometheus to Grafana

1. Open Grafana UI
2. Go to **Settings → Data Sources**
3. Click **Add Data Source**
4. Select **Prometheus**
5. URL:

   ```
   http://localhost:9090
   ```
6. Click **Save & Test**

---

## ✅ Step 10: Create Dashboard

### Option 1 (Recommended – Fast)

* Import dashboard ID: **1860**

Steps:

1. Go to **+ → Import**
2. Enter ID: `1860`
3. Select Prometheus datasource
4. Click Import

---

### Option 2 (Manual Panels)

* CPU Usage:

  ```
  100 - (avg by(instance)(irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
  ```

* Memory Usage:

  ```
  node_memory_MemAvailable_bytes
  ```

* Disk Usage:

  ```
  node_filesystem_avail_bytes
  ```

---

## 🔥 Common Issues & Fix

### ❌ Port not accessible

```bash
sudo ufw allow 9090
sudo ufw allow 3000
sudo ufw allow 9100
```

### ❌ Service not starting

```bash
systemctl status prometheus
journalctl -xe
```

---

## 💡 Interview Tip

> Node Exporter collects system metrics, Prometheus scrapes them, and Grafana visualizes them via dashboards.

---

## ✅ Final Output

* 📊 Grafana Dashboard (CPU, RAM, Disk)
* 📡 Prometheus scraping metrics
* 🖥️ Node Exporter providing system metrics

