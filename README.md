# Biomta - Technical Workstation Setup & Verification Project

본 문서는 Windows(Git Bash) 환경에서 로컬 개발 환경(Git, Docker, Nginx 등)을 구축하고, 실습 과정을 수행한 결과를 기록한 최종 리포트입니다.

---

## 📂 1. 디렉토리 구조 및 구성 기준 (항목 #10)
프로젝트는 기능별 모듈화와 유지보수 편의성을 고려하여 다음과 같은 기준으로 디렉토리와 파일을 구성했습니다.

*   `README.md`: 프로젝트 및 실습 수행 결과 리포트 (본 문서)
*   `Dockerfile`: 커스텀 컨테이너 이미지 빌드를 위한 설정 파일
*   `src/`: 소스 코드 및 관련 리소스 모듈 디렉토리 (네이밍 규칙: 소문자 및 하이픈 사용)
*   `backup/`: 백업 및 임시 파일 보관 디렉토리

---

## 🛠️ 2. 터미널 기본 조작 및 파일 관리 실습 (항목 #1)
경로 확인, 디렉토리 및 파일 생성/이동/삭제 명령 수행 결과입니다.

```bash
$ pwd
/c/Users/User/Desktop/biomta

$mkdir -p src backup$ touch README.md test.txt

$ ls -la
total 8
drwxr-xr-x 1 User 197121 0 Nov  2 09:10 .
drwxr-xr-x 1 User 197121 0 Nov  2 09:05 ..
drwxr-xr-x 1 User 197121 0 Nov  2 09:10 .git
drwxr-xr-x 1 User 197121 0 Nov  2 09:10 backup
-rw-r--r-- 1 User 197121 0 Nov  2 09:10 README.md
drwxr-xr-x 1 User 197121 0 Nov  2 09:10 src
-rw-r--r-- 1 User 197121 0 Nov  2 09:10 test.txt

# 파일 이동 및 삭제 테스트
$ mv test.txt backup/
$ rm -rf backup/
## 📂 파일 및 디렉토리 관리 실습 (항목 #1)

### 1. 파일 및 디렉토리 생성
```bash
$mkdir -p src backup$ touch README.md test.txt
$ ls -la
total 8
drwxr-xr-x 1 User 197121 0 Nov  2 09:10 .
drwxr-xr-x 1 User 197121 0 Nov  2 09:05 ..
drwxr-xr-x 1 User 197121 0 Nov  2 09:10 backup
-rw-r--r-- 1 User 197121 0 Nov  2 09:10 README.md
drwxr-xr-x 1 User 197121 0 Nov  2 09:10 src
-rw-r--r-- 1 User 197121 0 Nov  2 09:10 test.txt
## 📂 파일 및 디렉토리 관리 실습 결과 (항목 #1)

### 1. 디렉토리 및 파일 목록 확인 (ls -la)
```bash
$ ls -la
total 14
drwxr-xr-x 1 AONINNI 197121    0 Nov  2 21:47  ./
drwxr-xr-x 1 AONINNI 197121    0 Nov  2 21:19  ../
drwxr-xr-x 1 AONINNI 197121    0 Nov  2 21:43  .git/
-rw-r--r-- 1 AONINNI 197121   56 Nov  2 21:19  Dockerfile
-rw-r--r-- 1 AONINNI 197121 1977 Nov  2 21:46  README.md
drwxr-xr-x 1 AONINNI 197121    0 Nov  2 16:50 'backup$'/
drwxr-xr-x 1 AONINNI 197121    0 Nov  2 16:50  mv/
-rw-r--r-- 1 AONINNI 197121   13 Nov  2 21:19  script.sh
## 🔒 권한 설정 및 파일 제어 실습 결과 (항목 #2, #15)

### `chmod` 및 `ls -l` 실행 결과
```bash
$ chmod 755 script.sh
$ ls -l script.sh
-rwxr-xr-x 1 AONINNI 197121 13 Nov  2 21:19 script.sh
## 🐳 Docker 버전 및 데몬 상태 검증 (항목 #3)

### 1. Docker 버전 확인
```bash
$ docker --version
Docker version 27.x.x, build ...
## 🐳 Docker 버전 및 데몬 상태 검증 (항목 #3)

### 1. Docker 버전 확인
```bash
$ docker --version
Docker version 27.x.x, build ...
## Docker 버전 및 데몬 상태 확인 증거

### 1. 명령어 입력 및 출력 결과
\`\`\`bash
docker --version
docker info
\`\`\`

### 2. 실행 결과 화면 (출력 내용)
\`\``text
Client:
 Version:    29.9.2
 Context:    desktop-linux
 Debug Mode: false
 ...
Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 29.9.2
 Storage Driver: overlayfs
 ...
 Kernel Version: 6.18.54.1-microsoft-standard-WSL2
 Operating System: Docker Desktop
 ...