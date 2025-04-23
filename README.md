# Flutter Core

Flutter Core는 Flutter 기반의 모바일 애플리케이션 개발을 위한 핵심 프레임워크입니다. 이 프로젝트는 Clean Architecture와 BLoC 패턴을 기반으로 하여 확장성과 유지보수성이 뛰어난 구조를 제공합니다.

## 주요 특징

- **Clean Architecture**: 도메인 중심의 계층화된 구조
- **BLoC 패턴**: 상태 관리 및 비즈니스 로직 분리
- **의존성 주입**: ServiceLocator를 통한 효율적인 의존성 관리
- **환경 변수 관리**: dotenv를 활용한 환경별 설정 관리
- **인증 시스템**: 사용자 인증 및 권한 관리 기능

## 프로젝트 구조

```
lib/
├── core/           # 핵심 기능 및 유틸리티
│   ├── auth/      # 인증 관련 기능
│   ├── errors/    # 에러 처리 및 예외 관리
│   ├── layout/    # 공통 레이아웃 컴포넌트
│   ├── network/   # 네트워크 통신 관련
│   ├── router/    # 라우팅 관리
│   ├── services/  # 서비스 로케이터 및 의존성 주입
│   └── utils/     # 유틸리티 함수 및 헬퍼
└── src/           # 애플리케이션 소스 코드
    └── features/  # 기능별 모듈
```

## 시작하기

1. 환경 설정
```bash
flutter pub get
```

2. 환경 변수 설정
- `.env` 파일을 프로젝트 루트에 생성하고 필요한 환경 변수를 설정합니다.

3. 실행
```bash
flutter run
```

## 기술 스택

### 핵심 프레임워크
- Flutter SDK ^3.7.0
- Dart SDK ^3.7.0

### 상태 관리 & 아키텍처
- flutter_bloc ^9.1.0
- bloc ^9.0.0
- equatable ^2.0.7
- dartz ^0.10.1

### 네트워크 & API
- dio ^5.4.0
- retrofit ^4.4.2
- ferry ^0.16.1+2 (GraphQL 클라이언트)
- gql_http_link ^1.1.0
- json_annotation ^4.9.0

### 의존성 주입 & 서비스
- get_it ^8.0.3
- flutter_secure_storage ^9.2.4

### 라우팅
- go_router ^15.0.0

### 환경 설정
- flutter_dotenv ^5.1.0

### 코드 생성 & 유틸리티
- build_runner ^2.4.6
- freezed ^2.5.7
- freezed_annotation ^2.4.1
- json_serializable ^6.7.1
- retrofit_generator ^8.0.0
- built_value ^8.9.5

### 개발 도구
- flutter_lints ^5.0.0

## 라이센스

이 프로젝트는 MIT 라이센스 하에 배포됩니다.
