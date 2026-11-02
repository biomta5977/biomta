# Biomta Development Workstation Setup & Verification Report

## 1. 환경 설정 및 Git 설정
- **OS**: Windows (Git Bash 환경)
- **Working Directory**: `~/Desktop/biomta`
- **Git Global Config**:
  - User Name: 손경남
  - User Email: atom_bit@naver.com

---

## 2. Linux CLI 및 파일 권한 실습 증거
### 실습 명령어 및 출력 결과
```bash
$ touch README.md test.txt
$ echo "Hello Biomta" > test.txt
$ cat test.txt
Hello Biomta
$ chmod +x test.txt
$ ls -l test.txt
-rw-r--r-- 1 User 197121 21 Nov  2 15:56 test.txt