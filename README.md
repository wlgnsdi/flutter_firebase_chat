## 1. 프로젝트 설치 방법
해당 파일에는 기본적인 lib 폴더 아래의 Flutter 작성 코드 뿐이기에 각 플랫폼 폴더 생성 및 Firebase 연결 작업을 해주어야 합니다.

#### 1.1 android 폴더, ios 폴더 생성 작업
```bash
$ flutterfire create .
```

#### 1.2 Firebase 연동 작업
```bash
$ flutterfire configure
```

#### 1.3 @riverpod 자동 코드가 없다면 생성 작업
```bash
$ flutter pub run build_runner build --delete-conflicting-outputs
```

## 2. 데이터베이스 설명
Firestore 를 활용해서 데이터베이스를 구성 했으며, Firebase 에서 Firestore 데이터베이스 2개를 만들어서 사용했습니다.  
`기본 데이터베이스` 와 `chatroom 데이터베이스` 를 만들었습니다.

![데이터베이스](/asset/firestore.png)  

## 3. 프로젝트 환경, 구조 및 형태
Flutter version 3.27.0  
Dart version 3.6.0  
Mac OS Sequioa 15.2  

회원가입은 별도로 구성하지 않았으며 `email 로그인`을 구성해놓았습니다. email 아이디는 Firebase 에서 추가하셔서 사용하기 바랍니다.


## 4. 화면
스크린샷 화면을 참고해주세요.
| 로그인  | 로그인 후 | 빈 채팅 화면 | 채팅방 존재 | 채팅방 |
|:-----:|:-------:|:---------:|:--------:|:-----:|
![데이터베이스](/asset/1.png) | ![데이터베이스](/asset/2.png) | ![데이터베이스](/asset/3.png) |  ![데이터베이스](/asset/5.png) | ![데이터베이스](/asset/4.png) |