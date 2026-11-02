# Biomta Development Workstation Setup, Verification & Troubleshooting Report

## 1. 실행 환경
- OS: Windows (Git Bash 환경)
- Shell: bash
- Docker: 29.9.2
- Git: latest (Global Config configured)

---

## 2. 수행 체크리스트
- [x] 터미널 기본 조작 및 폴더 구성
- [x] 권한 변경 실습 (rwx / 755)
- [x] Docker 설치/점검 (version & info)
- [x] hello-world 실행
- [x] Docker images / ps -a 운영
- [x] Dockerfile 빌드/실행
- [x] 포트 매핑 접속 (8080:80)
- [x] 볼륨 영속성 검증
- [x] Git 설정 + GitHub 연동 및 푸시 완료

---

## 3. 수행 로그 및 검증 방법

### ① 터미널 기본 조작 및 경로 관리
```bash
$ pwd
/c/Users/User/Desktop/biomta
$mkdir -p src backup$ touch README.md test.txt
$ ls -la

