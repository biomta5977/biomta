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
 ## Docker hello-world 실행 증거

### 1. 실행 명령어
\`\`\`bash
docker run hello-world
\`\`\`

### 2. 실행 결과 출력 (로그)
\`\``text
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the community Hub.
    (amd64|v3)
 3. The Docker daemon created a new container from the code system.
...
docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

## Docker 컨테이너 및 이미지 목록 증거

### 1. 컨테이너 목록 (`docker ps -a`)
\`\`\`text
CONTAINER ID   IMAGE         COMMAND    CREATED          STATUS                     PORTS     NAMES
6d1758250f78   hello-world   "/hello"   3 minutes ago    Exited (0) 3 minutes ago             hopeful_hodgkin
ab3db06a60df   hello-world   "/hello"   9 minutes ago    Exited (0) 9 minutes ago             sleepy_shannon
\`\`\`

### 2. 이미지 목록 (`docker images`)
\`\`\`text
IMAGE               ID             DISK USAGE     CONTENT SIZE    EXTRA
hello-world:latest  c567b231f656   25.9kB         9.49kB          U
## Docker 커스텀 이미지 빌드 증거 (`docker build`)

### 1. 빌드 실행 명령어
\`\`\`bash
docker build -t biomta-app:latest .
\`\`\`

### 2. 빌드 실행 결과 (로그)
\`\``text
[+] Building 11.0s (7/7) FINISHED    docker:desktop-linux
 => [internal] load build definition from Dockerfile                          0.0s
 => [1/3] FROM docker.io/library/ubuntu:latest                               6.2s
 => [2/3] WORKDIR /app                                                       0.1s
 => [3/3] RUN echo 'Hello Biomta'                                            0.2s
 => exporting to image                                                       1.9s
 => => naming to docker.io/library/biomta-app:latest                         0.0s