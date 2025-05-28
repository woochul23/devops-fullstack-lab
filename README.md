# DevOps Fullstack Lab

> 온프레미스 기반 DevOps 파이프라인 구축 실습 프로젝트입니다.

---

## 📌 프로젝트 개요

이 프로젝트는 **RHAAP(Red Hat Ansible Automation Platform)**을 기반으로  
**Ansible → Terraform → KVM VM 자동 생성 → Kubernetes 구성 → GitOps 배포 → 모니터링/로깅**까지  
DevOps의 엔드-투-엔드 전체 흐름을 실습하고 문서화하는 개인 포트폴리오입니다.

자동화된 VM 프로비저닝부터 GitOps 기반 애플리케이션 배포, 관측성(Observability)까지 포함하여 실무 수준에 가까운 인프라를 구현하는 것을 목표로 합니다.

---

## 🧱 사용 기술 스택

| 범주 | 도구 |
|------|------|
| 인프라 자동화 | Terraform, Ansible (via RHAAP) |
| 프로비저닝 실행 플랫폼 | Red Hat Ansible Automation Platform (RHAAP) |
| 가상화 인프라 | KVM (libvirt) |
| 클러스터 구성 | kubeadm, kubelet, kubectl |
| GitOps | GitHub Actions, ArgoCD |
| 모니터링 | Prometheus, Grafana |
| 로깅 | Loki or EFK Stack |
| 앱 | Python Flask + PostgreSQL |
| 기타 | NGINX Ingress, HAProxy, Sealed Secrets, Cert-Manager |

---

## 📂 디렉토리 구조

```bash
devops-fullstack-lab/
│
├── terraform/
│   └── kvm/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── cloud-init/user-data.yml
│
├── ansible/
│   ├── inventories/
│   ├── playbooks/
│   │   ├── run-terraform.yml        # Terraform 실행
│   │   └── setup-vm.yml             # VM 초기 구성
│   └── roles/
│       └── terraform_runner/
│           └── tasks/main.yml
│
├── k8s/
│   ├── manifests/
│   └── helm/
│       └── flask-chart/
│
├── cicd/
│   └── github-actions/
│       └── deploy.yml
│
├── monitoring/
│   ├── prometheus/
│   ├── grafana/
│   └── loki/
│
├── app/
│   └── flask-api/
│       ├── app.py
│       ├── Dockerfile
│       └── requirements.txt
│
├── secrets/
│   └── sealed-secret.yaml
│
├── docs/
│   ├── architecture.png
│   ├── setup-guide.md
│   ├── workflow.md
│   ├── troubleshooting.md
│   └── retrospective.md
│
├── .gitignore
├── README.md
└── LICENSE
