📌 프로젝트 개요
이 프로젝트는 RHAAP(Red Hat Ansible Automation Platform)을 기반으로
Ansible에서 Terraform을 실행해 VM을 자동 생성하고,
Kubernetes 클러스터 구성 → GitOps 기반 애플리케이션 배포 → 모니터링/로깅 → EDA 기반 자동 대응까지
DevOps 전 과정을 실습하며 자동화하는 풀스택 실습형 포트폴리오입니다.

🧱 사용 기술 스택
범주	도구
인프라 자동화	Terraform (Ansible → 모듈 호출), KVM
구성 관리	Ansible
실행 플랫폼	RHAAP (Ansible Automation Platform)
Kubernetes 구성	kubeadm, kubelet, kubectl
GitOps 배포	GitHub Actions, ArgoCD
모니터링	Prometheus, Grafana
로깅	Loki or EFK Stack
이벤트 자동화	EDA Controller, Prometheus Alertmanager, Email Notification
앱	Python Flask + PostgreSQL
기타	NGINX Ingress, HAProxy, Cert-Manager, Sealed Secrets

📦 자동화 흐름 요약
plaintext
복사
편집
1. [RHAAP Job Template 실행]
    → Ansible Playbook 호출
    → Terraform으로 VM 생성

2. [VM 생성 완료]
    → Ansible로 초기 설정
    → Kubeadm으로 Kubernetes 구성

3. [GitHub → GitHub Actions]
    → CI (빌드 + Docker 이미지 푸시)

4. [ArgoCD → K8s 자동 배포]
    → 앱 Helm 차트 배포

5. [Prometheus 모니터링 + Alert Trigger]
    → Alertmanager → Webhook → EDA Controller
    → Ansible 자동 실행 (상태 점검 + Email 발송)
📂 디렉토리 구조 (EDA 포함 최종 버전)
bash
복사
편집
devops-fullstack-lab/
│
├── terraform/
│   └── kvm/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── cloud-init/
│           └── user-data.yml
│
├── ansible/
│   ├── inventories/
│   ├── playbooks/
│   │   ├── run-terraform.yml
│   │   ├── setup-vm.yml
│   │   └── setup-k8s.yml
│   └── roles/
│       └── terraform_runner/
│           └── tasks/
│               └── main.yml
│
├── eda/
│   ├── rulebook.yml                     # EDA 이벤트 규칙
│   ├── playbooks/
│   │   └── handle-alert.yml             # 상태 점검 + 이메일 전송
│   └── templates/
│       └── email-template.j2            # 이메일 포맷 (Jinja2)
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
│   │   └── alert-rules.yml              # CPU/Memory/Disk 경고 정의
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
