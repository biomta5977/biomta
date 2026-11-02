# Biomta Development Workstation Setup, Verification & Troubleshooting Report

## 1. 환경 설정 및 Git 원격 연동
- **OS**: Windows (Git Bash 환경)
- **Working Directory (`~/Desktop/biomta`)**: 프로젝트 루트 디렉토리이며, 소스 코드, Dockerfile 및 관련 설정 파일을 관리하는 공간입니다.
- **디렉토리 구조 및 목적**:
  - `README.md`: 프로젝트 및 실습 수행 결과 리포트
  - `Dockerfile`: 커스텀 컨테이너 이미지 빌드를 위한 설정 파일
  - `src/` 또는 실습 파일들: 소스 코드 및 테스트 파일 저장소
- **Git Global Config 및 원격 연동 증거**:
  - User Name: 손경남
  - User Email: atom_bit@naver.com
```bash
$ git remote -v
origin  [https://github.com/biomta5977/biomta.git](https://github.com/biomta5977/biomta.git) (fetch)
origin  [https://github.com/biomta5977/biomta.git](https://github.com/biomta5977/biomta.git) (push)

$ git log -n 1 --oneline
7220ecb docs: add detailed execution logs