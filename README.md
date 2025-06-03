# DevOps Fullstack Lab

> 온프레미스 기반 DevOps 파이프라인 + 이벤트 기반 자동화 + 웹 앱 배포까지,  
> 실무 전반을 아우르는 자동화 프로젝트입니다.

---

## 📌 프로젝트 개요

이 프로젝트는 **RHAAP(Red Hat Ansible Automation Platform)**을 기반으로  
**Ansible에서 Terraform을 실행해 VM을 자동 생성**하고,  
**Kubernetes 클러스터 구성 → GitOps 기반 애플리케이션 배포 → 모니터링/로깅 → EDA 기반 자동 대응 → 웹 서비스 외부 노출**까지  
**DevOps 전 과정을 실습하며 자동화**하는 풀스택 실습형 포트폴리오입니다.

---

## 🧱 사용 기술 스택

| 범주 | 도구 |
|------|------|
| 인프라 자동화 | Terraform (Ansible → 모듈 호출), KVM |
| 구성 관리 | Ansible |
| 실행 플랫폼 | RHAAP (Ansible Automation Platform) |
| Kubernetes 구성 | kubeadm, kubelet, kubectl |
| GitOps 배포 | GitHub Actions, ArgoCD |
| 모니터링 | Prometheus, Grafana |
| 로깅 | Loki or EFK Stack |
| 이벤트 자동화 | EDA Controller, Prometheus Alertmanager, Email Notification |
| 앱 | Python Flask + PostgreSQL |
| 웹 노출 | NGINX Ingress, HAProxy or MetalLB, Cert-Manager |
| 기타 | Sealed Secrets, Helm, Slack Webhook |

---

## 📦 자동화 흐름 요약

```plaintext
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
    → Alertmanager Webhook → EDA Controller
    → Ansible 자동 실행 (상태 점검 + Email 발송)

6. [NGINX Ingress → 외부 서비스 노출]
    → HTTP/HTTPS 접속으로 최종 결과 확인 가능
