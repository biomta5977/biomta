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
 ## 호스트 포트 접속 증거 (`curl` / 브라우저)

### 1. 포트 매핑 실행 명령어 (`-p 8080:80`)
\`\`\`bash
docker run -d -p 8080:80 --name web-test nginx
\`\`\`

### 2. 접속 테스트 명령어 및 출력 결과 (`curl http://localhost:8080`)
\`\`\`bash
curl http://localhost:8080
\`\`\`
\`\``text
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, nginx is successfully installed and working.</p>
...
</body>
</html>
## 볼륨 마운트 및 데이터 지속성 증거 (호스트 디렉토리 마운트 방식)

### 1. 호스트 폴더 마운트 컨테이너 실행 및 디렉토리 생성 후 파일 작성
\`\`\`bash
docker run -d -v "$(pwd):/app" --name volume-test alpine sleep 3600
docker exec -it volume-test sh -c "mkdir -p /app && echo 'Hello Biomta Volume Persistence' > /app/persistence.txt"
\`\`\`

### 2. 컨테이너 삭제 후 동일한 폴더로 새 컨테이너 재시작
\`\`\`bash
docker rm -f volume-test
docker run -d -v "$(pwd):/app" --name volume-test-new alpine sleep 3600
\`\`\`

### 3. 데이터 보존 확인 결과 (`cat`)
\`\`\`bash
docker exec -it volume-test-new cat /app/persistence.txt
\`\`\`
\`\``text
Hello Biomta Volume Persistence
## 🚀 도커 환경 재현 가이드 (Reproducibility Guide)

이 문서는 본 프로젝트의 Docker 환경(커스텀 빌드, 포트 매핑 웹 서비스, 볼륨 마운트 데이터 지속성)을 다른 환경에서 완벽하게 재현하고 검증하기 위한 단계별 절차입니다.

---

### 1. 사전 요구사항 (Prerequisites)
- Docker Desktop이 설치되어 있고 실행 중인 상태여야 합니다.
- Git Bash 또는 터미널 환경

---

### 2. 단계별 재현 및 검증 절차

#### 단계 ①: 저장소 클론 및 프로젝트 폴더 이동
\`\`\`bash
git clone https://github.com/biomta5977/biomta.git
cd biomta
\`\`\`

#### 단계 ②: 커스텀 Docker 이미지 빌드
Dockerfile을 이용해 `biomta-app` 이미지를 빌드합니다.
\`\`\`bash
docker build -t biomta-app:latest .
\`\`\`
**[빌드 성공 출력 예시]**
\`\``text
[+] Building 11.0s (7/7) FINISHED    docker:desktop-linux
 => [internal] load build definition from Dockerfile
 => [1/3] FROM docker.io/library/ubuntu:latest
 => [2/3] WORKDIR /app
 => [3/3] RUN echo 'Hello Biomta'
 => exporting to image
 => => naming to docker.io/library/biomta-app:latest
\`\``

#### 단계 ③: 호스트 포트 매핑 테스트 (Nginx 웹 서버)
호스트의 `8080`번 포트와 컨테이너의 `80`번 포트를 연결하여 웹 서비스를 실행합니다.
\`\`\`bash
docker run -d -p 8080:80 --name web-test nginx
curl http://localhost:8080
\`\`\`
**[`curl` 출력 예시]**
\`\``text
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, nginx is successfully installed and working.</p>
</body>
</html>
\`\``
*(테스트 완료 후 정리: `docker rm -f web-test`)*

#### 단계 ④: 볼륨 마운트 및 데이터 지속성 테스트
호스트 디렉토리를 마운트하여 컨테이너를 삭제해도 데이터가 안전하게 유지되는지 검증합니다.
\`\`\`bash
# 1. 볼륨 마운트 컨테이너 실행 및 테스트 파일 생성
docker run -d -v "$(pwd):/app" --name volume-test alpine sleep 3600
docker exec -it volume-test sh -c "mkdir -p /app && echo 'Hello Biomta Volume Persistence' > /app/persistence.txt"

# 2. 기존 컨테이너 삭제 후, 동일한 경로로 새 컨테이너 재시작
docker rm -f volume-test
docker run -d -v "$(pwd):/app" --name volume-test-new alpine sleep 3600

# 3. 데이터 지속성 확인 (cat)
docker exec -it volume-test-new cat /app/persistence.txt
\`\`\`
**[데이터 지속성 확인 출력 예시]**
\`\``text
Hello Biomta Volume Persistence
\`\``
*(테스트 완료 후 정리: `docker rm -f volume-test-new`)*
## 💡 도커 이미지(Image)와 컨테이너(Container)의 개념 및 변경 흐름

### 1. 이미지와 컨테이너의 역할 차이
- **도커 이미지 (Image)**: 앱 실행에 필요한 모든 파일과 설정이 담긴 **읽기 전용 설계도(템플릿)**입니다.
- **도커 컨테이너 (Container)**: 이미지를 실행하여 독립된 공간에서 프로세스로 동작시키는 **실행체(인스턴스)**입니다.

### 2. 빌드 · 실행 · 변경 흐름
1. **빌드 (Build)**: `Dockerfile`과 소스코드를 이용해 `docker build`를 수행하면 정적인 **이미지**가 만들어집니다.
2. **실행 (Run)**: 이미지를 기반으로 `docker run`을 실행하면 동적인 **컨테이너**가 생성되어 앱이 구동됩니다.
3. **변경 (Change)**: 코드가 변경된 경우 기존 컨테이너를 직접 수정하지 않고, **[코드 수정 ➔ 이미지 재빌드 ➔ 새 컨테이너 실행]** 과정을 거쳐 최신 상태를 반영합니다.
## 🌐 컨테이너 네트워크 원리: 네임스페이스와 포트포워딩

### 1. 네트워크 네임스페이스 (Network Namespace)
- **개념**: 컨테이너마다 독립된 IP 주소, 포트, 네트워크 인터페이스를 가지도록 호스트와 네트워크 환경을 완벽히 **격리**하는 리눅스 커널 기술입니다.
- **역할**: 각 컨테이너가 충돌 없이 자신만의 가상 네트워크 공간에서 독립된 서버로 동작할 수 있게 합니다.

### 2. 포트포워딩 (Port Forwarding, `-p` 옵션)
- **개념**: 외부(호스트)의 요청을 격리된 컨테이너 내부로 연결해 주는 **통로** 역할입니다.
- **작동 흐름**: 사용자가 호스트 포트(`http://localhost:8080`)로 접속하면, 도커가 이를 중계하여 컨테이너 내부의 서비스 포트(`80`)로 트래픽을 전달(`8080 ➔ 80`)합니다.
# 📐 경로(Path) 선택 기준 및 재현성 지침

본 프로젝트는 다양한 운영체제와 사용자 환경에서도 에러 없이 동일하게 실행될 수 있도록 다음과 같은 경로 설정 원칙을 준수합니다.

### 1. 호스트 경로 (Host Path) 지침
- **원칙**: 하드코딩된 절대 경로(예: `D:/folder/...`) 사용을 지양하고, **동적 경로 변수(`$(pwd)`)**를 사용합니다.
- **재현성 효과**: 사용자마다 PC의 폴더 구조가 다르더라도, 현재 작업 중인 디렉토리를 자동으로 인식하여 마운트하므로 **크로스 플랫폼 재현성**을 보장합니다.

### 2. 컨테이너 내부 경로 (Container Path) 지침
- **원칙**: 컨테이너 내부의 마운트 및 작업 디렉토리는 항상 **절대 경로(예: `/app`)**로 명시합니다.
- **재현성 효과**: 컨테이너 내부 환경은 호스트의 OS와 격리된 독립된 리눅스 공간이므로, 표준화된 절대 경로를 통해 일관된 실행 환경을 유지합니다.
## 🔒 파일 권한: `rwx` 비트와 8진수(숫자) 표기법 규칙

### 1. `rwx` 권한 비트 구성
- **`r` (Read, 읽기 - 값: 4)**: 파일 열람 및 디렉토리 목록 조회
- **`w` (Write, 쓰기 - 값: 2)**: 파일 수정/저장 및 디렉토리 내 파일 편집
- **`x` (Execute, 실행 - 값: 1)**: 프로그램 실행 및 디렉토리 접근(`cd`)

### 2. 8진수 숫자 표기법 (예: `755`)
권한별 숫자의 합(`r=4`, `w=2`, `x=1`)을 **[소유자] [그룹] [기타 사용자]** 순서로 조합하여 표기합니다.
- **`7` (소유자)**: `rwx` ($4 + 2 + 1$)
- **`5` (그룹)**: `r-x` ($4 + 0 + 1$)
- **`5` (기타 사용자)**: `r-x` ($4 + 0 + 1$)
## ⚠️ 포트 충돌 진단 및 해제 절차 (Port Conflict Resolution)

도커 컨테이너나 로컬 서버를 실행할 때 "port is already allocated" 또는 "Address already in use" 에러가 발생할 경우, 포트를 점유 중인 프로세스를 진단하고 해제하는 절차입니다.

### 1. 포트 점유 프로세스 확인 (`lsof` 또는 `netstat`)

#### ① macOS / Linux 환경 (`lsof`)
\`\`\`bash
# 특정 포트(예: 8080)를 사용 중인 프로세스와 PID 확인
lsof -i :8080
\`\`\`

#### ② Windows / Linux 공통 (`netstat`)
\`\`\`bash
# 리눅스 / Git Bash 환경
netstat -ano | grep 8080

# 윈도우 명령 프롬프트(CMD) 환경
netstat -ano | findstr 8080
\`\`\`
*(명령어 실행 결과 출력된 목록의 맨 오른쪽에 표시되는 숫자가 **PID(프로세스 ID)**입니다.)*

---

### 2. 프로세스 상세 정보 확인 (`ps`)
확인한 PID를 통해 이 프로세스가 어떤 프로그램인지 상세히 조회합니다.
\`\`\`bash
# Linux / macOS
ps -ef | grep <PID>
\`\`\`

---

### 3. 프로세스 강제 종료 및 포트 해제 (`kill` / `taskkill`)

#### ① macOS / Linux / Git Bash 환경 (`kill`)
\`\`\`bash
# 정상 종료 (SIGTERM)
kill <PID>

# 응답이 없을 경우 강제 종료 (SIGKILL)
kill -9 <PID>
\`\`\`

#### ② Windows 일반 CMD / PowerShell 환경 (`taskkill`)
\`\`\`cmd
taskkill /f /pid <PID>
\`\`\`

#### ③ Windows Git Bash 환경 (`MSYS_NO_PATHCONV`)
Git Bash에서 경로 왜곡 오류(`잘못된 인수/옵션`)가 발생할 경우 아래와 같이 접두어를 붙여 실행합니다.
\`\`\`bash
MSYS_NO_PATHCONV=1 taskkill /f /pid <PID>
## 💾 데이터 손실 방지 및 저장소 관리 대안 (Volume vs Bind Mount & Backup)

도커 컨테이너는 기본적으로 삭제될 때 내부 데이터도 함께 소멸하므로, 영구 데이터 보존을 위해 **볼륨(Volume)** 또는 **바인드 마운트(Bind Mount)**를 사용해야 합니다.

---

### 1. 볼륨(Volume) vs 바인드 마운트(Bind Mount) 비교

| 구분 | 볼륨 (Docker Volume) | 바인드 마운트 (Bind Mount) |
| :--- | :--- | :--- |
| **저장 위치** | 도커가 관리하는 호스트 내 전용 영역 (`/var/lib/docker/volumes/...`) | 사용자가 지정한 호스트의 임의 디렉토리 경로 (`$(pwd)` 등) |
| **주요 용도** | 데이터베이스 저장 등 **영구성 및 독립성**이 중요한 데이터 | 소스 코드 실시간 반영 등 **개발/디버깅** 환경 |
| **장점** | • 도커 엔진에 의해 안전하게 관리됨<성능 및 보안 우수><br>• 운영체제 간 호환성 높음 | • 호스트 파일 시스템과 직접 연동되어 즉각적인 수정 및 확인 가능 |
| **단점** | • 호스트 파일 시스템에서 직접 접근 및 수정이 다소 번거로움 | • 호스트 권한 설정에 따라 보안 취약점 발생 가능<br>• OS 환경(Windows/Linux)에 따라 경로 문제 발생 가능 |

---

### 2. 데이터 손실 방지를 위한 백업 권장 절차

중요한 데이터(DB 등)가 담긴 도커 볼륨은 장애 발생 시 데이터 손실을 막기 위해 주기적으로 백업해야 합니다.

#### ① 도커 볼륨 데이터를 아카이브(tar) 파일로 백업하기
\`\`\`bash
# 1. 볼륨(my_volume)의 데이터를 임시 컨테이너를 통해 압축하여 백업 파일(backup.tar)로 추출
docker run --rm -v my_volume:/volume -v $(pwd):/backup alpine tar -czf /backup/backup.tar -C /volume .
\`\`\`
* *Verification:* 현재 디렉토리(`$(pwd)`)에 `backup.tar` 파일이 정상적으로 생성되었는지 확인합니다.

#### ② 백업 파일로부터 볼륨 복원하기 (Restore)
\`\`\`bash
# 1. 빈 볼륨 생성
docker volume create restored_volume

# 2. 백업 파일의 내용을 복원용 볼륨에 압축 해제
docker run --rm -v restored_volume:/volume -v $(pwd):/backup alpine tar -xzf /backup/backup.tar -C /volume
## 🔍 도커 트러블슈팅 사례 연구 (Troubleshooting Case Study)

도커 컨테이너 구동 중 발생할 수 있는 대표적인 문제 상황에 대한 가설 수립, 검증 명령, 조치 절차 및 결과 증거입니다.

---

### [Case 1] 컨테이너 포트 바인딩 실패 (`port is already allocated`)

#### 1. 현상 및 증상
- 도커 컨테이너를 실행(`docker run -p 8080:80`)할 때 다음과 같은 에러 발생
  - `Error response from daemon: driver failed programming external connectivity on endpoint web_server: Bind for 0.0.0.0:8080 failed: port is already allocated`

#### 2. 원인 가설
- **가설 1**: 이미 다른 도커 컨테이너나 로컬 프로세스가 `8080` 포트를 선점하고 있다.

#### 3. 검증 명령 및 결과 증거
- **검증 명령 (포트 점유 프로세스 확인)**:
  ```bash
  # Windows CMD / PowerShell 환경
  netstat -ano | findstr 8080
  
  # 출력 결과 (예시)
  # TCP    0.0.0.0:8080    0.0.0.0:0    LISTENING    9384
  평가 항목 #18
부족한 점
트러블슈팅 사례(가설→확인→조치) 및 관련 증거 문서 누락
보완
문제 발생 시 가설·검증명령·조치·증거(로그/스크린샷)를 단계별로 남기세요
## 🔍 도커 트러블슈팅 사례 연구 (Troubleshooting Case Study)

도커 컨테이너를 운영하는 과정에서 발생한 문제를 **[현상 ➔ 가설 ➔ 검증 및 증거 ➔ 조치 및 결과]** 단계에 따라 해결한 기록입니다.

---

### [Case 1] 컨테이너 포트 바인딩 충돌 (`port is already allocated`)

#### 1. 문제 현상 (Symptom)
- 도커 컨테이너를 실행(`docker run -p 8080:80 ...`)할 때 아래와 같은 에러가 발생하며 실행이 실패함.
  - `Error response from daemon: driver failed programming external connectivity on endpoint web_server: Bind for 0.0.0.0:8080 failed: port is already allocated`

#### 2. 원인 가설 (Hypothesis)
- **가설**: 로컬 호스트 컴퓨터의 `8080` 포트를 이미 다른 프로그램이나 기존에 실행 중인 다른 도커 컨테이너가 선점하고 있다.

#### 3. 검증 명령 및 결과 증거 (Verification & Evidence)
- **검증 명령 (포트 점유 프로세스 확인)**:
  ```cmd
  netstat -ano | findstr 8080
### Docker 웹 서버 실행 결과

[Docker 웹 서버 실행 화면](05_docker_web_server.png)
