# Starbuckst

> ☕️  스타벅스 앱의 첫 화면을 만드는 프로젝트입니다. 코드스쿼드 2022 iOS 과정의 개인 프로젝트로 진행했으며, 다양한 View를 사용해 보고 API통신 및 캐싱을 하는 것에 목표를 두었습니다.

- **Skill** : URLSession, NSCache
- **UI** : TabBarController, UIScrollView, UICollectionView

## 주요 화면

| Home 화면 (1) | Home 화면 (2) | Order 화면 |
|---|---|---|
|![Simulator Screen Shot - iPhone 14 Pro - 2023-01-09 at 17 15 09](https://user-images.githubusercontent.com/67407678/212027943-019f4192-aa7b-45d2-8b84-4697d73485f0.png)|![Simulator Screen Shot - iPhone 14 Pro - 2023-01-09 at 17 15 13](https://user-images.githubusercontent.com/67407678/212028016-94e8b732-5477-40bb-8b4d-ceec2641399a.png)|![Simulator Screen Shot - iPhone 14 Pro - 2023-01-12 at 18 11 51](https://user-images.githubusercontent.com/67407678/212028052-b2072cec-3564-4588-8593-f539d20abf73.png)|


## 기능

- [네트워크 통신](https://bibi6666667.tistory.com/386)
    - URLSession을 사용해 API 요청을 보내고, 응답받은 데이터와 이미지를 화면에 보여줍니다.
    - API에서 이미지를 제공하지 않는 경우 대체 이미지를 띄우도록 했습니다.
- [이미지 캐싱](https://bibi6666667.tistory.com/375)
    - 한 번 다운로드한 이미지는 캐시에 저장해 두고, 이미지가 캐싱되어 있지 않을 때만 URL을 통해 다운로드를 진행했습니다.

## **🔲** 클래스 다이어그램
