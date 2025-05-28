# DevOps Fullstack Lab

> 온프레미스 기반 DevOps 파이프라인 구축 실습 프로젝트입니다.

---

## 📌 프로젝트 개요

이 프로젝트는 다음과 같은 DevOps 기술을 통합한 실습형 포트폴리오입니다:

- **인프라 자동화 (IaC)**: Terraform + cloud-init
- **구성 관리**: Ansible
- **컨테이너 오케스트레이션**: Kubernetes (kubeadm)
- **배포 자동화**: GitHub Actions + ArgoCD (GitOps)
- **모니터링/로깅**: Prometheus, Grafana, Loki
- **샘플 앱**: Python Flask + PostgreSQL

---

## 🧱 사용 스택

| 범주 | 도구 |
|------|------|
| VM 자동화 | Terraform + libvirt |
| 초기 셋업 | cloud-init, Ansible |
| K8s 설치 | kubeadm, kubelet, kubectl |
| GitOps | ArgoCD, GitHub Actions |
| 모니터링 | Prometheus, Grafana |
| 로깅 | Loki or EFK |
| 배포 앱 | Flask + PostgreSQL |
| 기타 | NGINX Ingress, HAProxy, Sealed Secrets |

---

## 📁 디렉토리 구조

```bash
devops-fullstack-lab/
│
├── terraform/                  # KVM VM 생성 자동화
│   └── kvm/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── cloud-init/
│           └── user-data.yml
│
├── ansible/                    # 초기 설정 자동화
│   ├── inventory.ini
│   ├── playbooks/
│   │   └── setup-k8s.yml
│   └── roles/
│       └── base/
│           └── tasks/
│
├── k8s/                        # Kubernetes 배포 파일 및 Helm 차트
│   ├── manifests/
│   └── helm/
│       └── flask-chart/
│
├── cicd/                       # CI/CD 자동화 설정
│   └── github-actions/
│       └── deploy.yml
│
├── monitoring/                # 모니터링/로깅 구성
│   ├── prometheus/
│   ├── grafana/
│   └── loki/
│
├── app/                        # 샘플 애플리케이션 (Flask)
│   └── flask-api/
│       ├── app.py
│       ├── Dockerfile
│       └── requirements.txt
│
├── secrets/                   # Sealed Secrets 또는 인증 정보 (비공개)
│   └── sealed-secret.yaml
│
├── docs/                      # 설계 문서, 회고, 아키텍처 등
│   ├── architecture.png
│   ├── setup-guide.md
│   ├── workflow.md
│   ├── troubleshooting.md
│   └── retrospective.md
│
├── .gitignore
├── README.md
└── LICENSE
