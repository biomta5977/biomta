# Biomta - Docker 실습 및 환경 검증 프로젝트

본 문서는 Windows의 Git Bash와 Docker Desktop 환경에서 수행한 기본 명령어, Docker 이미지·컨테이너, 웹 서버 실행 및 데이터 마운트 실습을 정리한 과제 보고서입니다.

> **실행 결과 작성 원칙:** 실제 실행을 확인한 결과와 재현을 위한 명령 예시를 구분했습니다. 예시 출력은 실제 측정 결과로 오해하지 않도록 표시했습니다.

---

## 1. 프로젝트 디렉토리 구성

주요 파일과 디렉토리의 역할은 다음과 같습니다.

| 항목 | 용도 |
|---|---|
| `README.md` | 실습 과정 및 결과 보고서 |
| `Dockerfile` | 사용자 정의 Docker 이미지 빌드 설정 |
| `script.sh` | 셸 스크립트 실습 파일 |
| `test.txt` | 파일 생성 및 관리 실습 파일 |
| `src/` | 소스 코드 및 관련 리소스 |
| `backup/` | 백업 파일 보관용 디렉토리 |

### 디렉토리 및 파일 생성

```bash
mkdir -p src backup
touch README.md test.txt
pwd
ls -la
```

### 파일 이동 및 삭제 실습

```bash
mv test.txt backup/
ls -la backup/
rm -rf backup/
```

위 삭제 명령은 `backup/` 디렉토리와 그 안의 파일을 삭제합니다. 실제 과제 제출본에서는 필요한 백업 파일이 남아 있는지 먼저 확인해야 합니다.

---

## 2. 파일 권한 설정 실습

`chmod` 명령으로 셸 스크립트에 실행 권한을 부여합니다.

```bash
chmod 755 script.sh
ls -l script.sh
```

기존 저장소에 기록된 권한 확인 결과:

```text
-rwxr-xr-x 1 AONINNI 197121 13 Nov  2 21:19 script.sh
```

### 권한 숫자의 의미

- `r`(읽기) = 4
- `w`(쓰기) = 2
- `x`(실행) = 1
- `755` = 소유자 `rwx`, 그룹 `r-x`, 기타 사용자 `r-x`

---

## 3. Docker 설치 및 실행 상태 확인

### Docker 버전

실습 환경에서 확인한 Docker Client/Server 버전은 **29.9.2**입니다.

```bash
docker --version
docker info
```

기존에 기록한 `docker info` 결과 중 확인 가능한 항목:

```text
Client:
 Version: 29.9.2
 Context: desktop-linux

Server:
 Server Version: 29.9.2
 Operating System: Docker Desktop
```

### Docker 정상 동작 확인

```bash
docker run hello-world
```

기존 실습 기록에는 다음 성공 메시지가 포함되어 있습니다.

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

### 컨테이너 및 이미지 목록 확인

```bash
docker ps -a
docker images
```

기존 기록에는 `hello-world` 컨테이너와 이미지가 표시되어 있습니다. 목록은 실행 시점에 따라 달라질 수 있습니다.

---

## 4. 사용자 정의 Docker 이미지 빌드

저장소의 `Dockerfile`을 사용해 이미지를 빌드하는 명령입니다.

```bash
docker build -t biomta-app:latest .
```

빌드 결과 확인:

```bash
docker images
```

> 참고: 이전 README에 있던 빌드 로그는 예시 형태로 정리했습니다. 실제 빌드 성공을 증명하려면 본인 PC에서 명령을 실행한 터미널 화면을 캡처해 첨부하세요.

---

## 5. Nginx 웹 서버 실행 및 포트 매핑

호스트 PC의 8080 포트와 컨테이너의 80 포트를 연결합니다.

```bash
docker run -d -p 8080:80 --name web-test nginx
```

브라우저에서 다음 주소에 접속합니다.

```text
http://localhost:8080
```

정상적으로 실행되면 Nginx 기본 환영 페이지가 표시됩니다.

### Docker 웹 서버 실행 결과

![Docker 웹 서버 실행 화면](05_docker_web_server.png)

실습 후 컨테이너를 정리하려면 다음 명령을 사용합니다.

```bash
docker rm -f web-test
```

---

## 6. 볼륨 마운트와 데이터 지속성

### 바인드 마운트(Bind Mount)

바인드 마운트는 호스트 PC의 특정 폴더를 컨테이너 내부 경로에 연결하는 방식입니다.

기존 실습에 기록된 명령:

```bash
docker run -d -v "$(pwd):/app" --name volume-test alpine sleep 3600
docker exec volume-test sh -c "mkdir -p /app && echo 'Hello Biomta Volume Persistence' > /app/persistence.txt"
docker rm -f volume-test
docker run -d -v "$(pwd):/app" --name volume-test-new alpine sleep 3600
docker exec volume-test-new cat /app/persistence.txt
```

기존 기록에 남아 있는 확인 문자열:

```text
Hello Biomta Volume Persistence
```

이 방식은 호스트 폴더에 파일이 저장되므로 컨테이너를 삭제하고 다시 만들어도 파일을 유지할 수 있습니다.

### Docker Named Volume 실습 (실제 실행 확인)

Named Volume은 Docker가 관리하는 저장 공간입니다. Windows CMD에서 아래 명령을 실제 실행했습니다.

```cmd
docker volume ls
docker run --rm -v my-volume:/data alpine sh -c "echo 'Docker Named Volume 실습 성공' > /data/test.txt"
docker run --rm -v my-volume:/data alpine cat /data/test.txt
```

Volume 목록에서 `my-volume`을 확인했고, 파일을 저장한 뒤 다시 읽었을 때 다음 결과가 출력되었습니다.

```text
Docker Named Volume 실습 성공
```

**실행 증거:** 2026-11-04 CMD 화면 캡처를 저장소에 업로드했습니다.

![Docker Named Volume 실습 결과](06_docker_named_volume.png)

> `my_volume`도 Volume 목록에 있었지만, 이번 실습에서 실제 사용한 이름은 `my-volume`입니다.

---

## 7. Docker 이미지와 컨테이너의 차이

- **이미지(Image):** 컨테이너 실행에 필요한 파일과 설정을 담은 읽기 전용 템플릿입니다.
- **컨테이너(Container):** 이미지를 기반으로 실행되는 독립된 프로세스 환경입니다.

일반적인 작업 흐름:

1. `Dockerfile` 작성
2. `docker build`로 이미지 생성
3. `docker run`으로 컨테이너 실행
4. 소스나 설정 변경 시 이미지를 다시 빌드하고 새 컨테이너 실행

---

## 8. Docker 네트워크와 포트포워딩

컨테이너는 네트워크 네임스페이스 등을 통해 독립된 네트워크 환경을 사용할 수 있습니다.

`-p 8080:80` 옵션은 호스트의 8080 포트로 들어온 요청을 컨테이너의 80 포트로 전달합니다.

### 네트워크 확인 명령

```bash
docker network ls
docker network inspect bridge
```

### 사용자 정의 네트워크 실습 (실제 실행 확인)

Windows CMD에서 사용자 정의 네트워크를 만들고, Nginx 컨테이너와 테스트용 BusyBox 컨테이너를 같은 네트워크에 연결했습니다.

실행한 명령:

```cmd
docker network create biomta-net
docker network ls
docker run -d --name biomta-web --network biomta-net nginx
docker run --rm --network biomta-net busybox ping -c 3 biomta-web
```

BusyBox가 로컬에 없어 처음 실행할 때 Docker Hub에서 이미지를 내려받았으며, 이후 컨테이너 이름인 `biomta-web`을 대상으로 ping 테스트를 진행했습니다.

실제 확인 결과:

```text
PING biomta-web (172.18.0.2): 56 data bytes
64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.674 ms
64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.065 ms
64 bytes from 172.18.0.2: seq=2 ttl=64 time=0.075 ms

--- biomta-web ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
```

**결과:** 3개 패킷을 보내 3개 모두 수신했고, 패킷 손실률은 0%였습니다. 같은 사용자 정의 네트워크에 연결된 컨테이너끼리 이름으로 통신할 수 있음을 확인했습니다.

> 실행 증거 캡처 파일은 GitHub 저장소에 추가한 뒤 아래에 연결합니다.

---

## 9. 경로(Path) 선택 기준

- 호스트 경로는 사용자 PC마다 다를 수 있으므로 Git Bash에서 `$(pwd)`와 같은 현재 경로 변수를 활용할 수 있습니다.
- 컨테이너 내부 경로는 `/app`처럼 명확한 절대 경로를 사용하는 것이 좋습니다.
- Windows와 Linux/macOS는 경로 표기 방식이 다를 수 있으므로 실행 환경에 맞는 명령을 사용해야 합니다.

---

## 10. 포트 충돌 진단 및 해결

이미 다른 프로그램이나 컨테이너가 포트를 사용 중이면 `port is already allocated` 또는 `Address already in use` 오류가 발생할 수 있습니다.

### 포트 사용 여부 확인

Windows CMD 또는 PowerShell:

```cmd
netstat -ano | findstr 8080
```

Git Bash에서 사용 가능한 경우:

```bash
netstat -ano | grep 8080
```

출력 마지막 열의 숫자는 PID(프로세스 ID)입니다. 해당 프로세스가 무엇인지 확인한 뒤 종료 여부를 결정합니다.

### 프로세스 확인 및 종료

Windows CMD 또는 PowerShell:

```cmd
tasklist /FI "PID eq 1234"
taskkill /PID 1234 /F
```

Linux/macOS:

```bash
ps -p 1234 -f
kill 1234
```

> `1234`는 명령 사용 방법을 보여주는 예시 PID입니다. 실제 출력에서 확인한 PID로 바꿔 사용해야 하며, 어떤 프로그램인지 확인하지 않고 프로세스를 종료하지 마세요.

---

## 11. Docker Volume과 Bind Mount 비교

| 구분 | Docker Volume | Bind Mount |
|---|---|---|
| 저장 위치 | Docker가 관리하는 저장 공간 | 사용자가 지정한 호스트 폴더 |
| 주요 용도 | 데이터베이스 등 지속 데이터 | 소스 코드 공유 및 개발 |
| 장점 | Docker가 수명과 저장 공간을 관리 | 호스트에서 파일을 바로 확인·수정 가능 |
| 고려 사항 | Docker 명령으로 관리하는 것이 편리 | 호스트 경로 및 권한에 영향을 받음 |

### Volume 백업 예시

```bash
docker volume create my_volume
docker run --rm -v my_volume:/volume -v "$(pwd):/backup" alpine tar -czf /backup/backup.tar -C /volume .
```

### Volume 복원 예시

```bash
docker volume create restored_volume
docker run --rm -v restored_volume:/volume -v "$(pwd):/backup" alpine tar -xzf /backup/backup.tar -C /volume
```

> 백업·복원 명령은 사용 예시입니다. 실제 백업 파일 생성 및 복원 여부는 별도로 실행해 확인해야 합니다.

---

## 12. 트러블슈팅 사례 기록

### Case 1. 컨테이너 포트 바인딩 충돌

**문제 현상**

`docker run -p 8080:80` 실행 시 8080 포트가 이미 사용 중이라는 오류가 발생할 수 있습니다.

**원인 가설**

다른 컨테이너 또는 로컬 프로그램이 호스트의 8080 포트를 사용하고 있을 수 있습니다.

**검증 명령**

```cmd
netstat -ano | findstr 8080
```

**조치 절차**

1. 출력에서 PID를 확인합니다.
2. 작업 관리자 또는 `tasklist`로 프로세스를 확인합니다.
3. 불필요한 프로세스인지 확인한 뒤 종료하거나, Docker 실행 포트를 다른 번호로 변경합니다.

예를 들어 호스트 포트를 8081로 바꿀 수 있습니다.

```bash
docker run -d -p 8081:80 --name web-test-8081 nginx
```

**실제 증거 추가 필요:** 오류가 발생한 화면, 포트 확인 결과, 조치 후 브라우저 접속 화면을 캡처해 이 항목에 추가하세요. 현재 README에는 실제 오류 로그와 조치 후 결과가 모두 확인된 상태가 아니므로 완료된 사례로 단정하지 않습니다.

---

## 13. 제출 전 최종 확인

- [ ] README의 제목과 실습 설명 확인
- [ ] Dockerfile, script.sh, test.txt 등 필요한 파일 확인
- [ ] `05_docker_web_server.png`가 저장소에 존재하는지 확인
- [ ] GitHub README 화면에서 이미지가 정상 표시되는지 확인
- [ ] Named Volume 실습 결과 캡처 추가
- [ ] Docker 네트워크 실습 결과 캡처 파일을 저장소에 업로드하고 README에 연결
- [ ] 트러블슈팅 실제 검증 및 조치 결과 추가

