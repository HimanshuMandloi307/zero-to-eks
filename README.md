# zero-to-eks 🚀

A production-grade EKS cluster setup built from scratch using industry-standard DevOps tools.

## 🏗️ Architecture

```
GitHub → GitHub Actions → Helm → EKS Cluster
                                      ↑
                               ArgoCD (GitOps)
                                      ↑
                          Prometheus + Grafana (Monitoring)
```

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Terraform | Infrastructure as Code (VPC, EKS) |
| Helm | Kubernetes package manager |
| ArgoCD | GitOps continuous delivery |
| Prometheus | Metrics collection |
| Grafana | Metrics visualization |
| GitHub Actions | CI/CD pipeline |
| AWS EKS | Managed Kubernetes |

## 📁 Project Structure

```
zero-to-eks/
├── terraform/
│   ├── modules/
│   │   ├── vpc/          # VPC, Subnets, NAT Gateway
│   │   └── eks/          # EKS Cluster, Node Groups
│   └── envs/
│       └── dev/          # Dev environment config
├── helm/
│   └── charts/
│       └── sample-app/   # Sample nginx app
├── argocd/               # ArgoCD manifests
├── monitoring/           # Prometheus + Grafana config
└── .github/
    └── workflows/
        └── deploy.yaml   # GitHub Actions pipeline
```

## 🚀 Getting Started

### Prerequisites
- AWS CLI configured
- Terraform >= 1.0
- kubectl
- Helm >= 3.0
- eksctl

### 1. Clone the repo
```bash
git clone https://github.com/HimanshuMandloi307/zero-to-eks.git
cd zero-to-eks
```

### 2. Deploy Infrastructure
```bash
cd terraform/envs/dev
terraform init
terraform apply
```

### 3. Configure kubectl
```bash
aws eks update-kubeconfig --region ap-south-1 --name zero-to-eks
```

### 4. Install ArgoCD
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### 5. Install Monitoring
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace \
  --set grafana.adminPassword=admin123
```

### 6. Access Grafana
```bash
kubectl port-forward svc/prometheus-grafana -n monitoring 3000:80
```
Open: http://localhost:3000 (admin/admin123)

## ⚙️ GitHub Actions

Pipeline triggers on push to `helm/charts/**`:
1. Configures AWS credentials
2. Updates kubeconfig
3. Deploys via Helm

## 🔐 Required GitHub Secrets

| Secret | Description |
|--------|-------------|
| `AWS_ACCESS_KEY_ID` | AWS Access Key |
| `AWS_SECRET_ACCESS_KEY` | AWS Secret Key |

## 📊 Monitoring

- **Prometheus** — scrapes metrics from all pods and nodes
- **Grafana** — visualizes metrics with pre-built Kubernetes dashboards
- Dashboard ID: `15760` for Kubernetes Pod monitoring

## 👤 Author

**Himanshu Mandloi** — DevOps Engineer  
[GitHub](https://github.com/HimanshuMandloi307) • [LinkedIn](https://linkedin.com/in/himanshu-mandloi)