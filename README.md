# Starbuckst

> ☕️  스타벅스 앱의 첫 화면을 만드는 프로젝트입니다. 코드스쿼드 2022 iOS 과정의 개인 프로젝트로 진행했으며, 다양한 View를 사용해 보고 API통신 및 캐싱을 하는 것에 목표를 두었습니다.

- **Skill** : URLSession, NSCache
- **UI** : TabBarController, UIScrollView, UICollectionView

## 주요 화면

| Home 화면 (1) | Home 화면 (2) | Order 화면 |
|---|---|---|
|![Simulator Screen Shot - iPhone 14 Pro - 2023-01-09 at 17 15 09](https://user-images.githubusercontent.com/67407678/212027943-019f4192-aa7b-45d2-8b84-4697d73485f0.png)|![Simulator Screen Shot - iPhone 14 Pro - 2023-01-09 at 17 15 13](https://user-images.githubusercontent.com/67407678/212028016-94e8b732-5477-40bb-8b4d-ceec2641399a.png)|![Simulator Screen Shot - iPhone 14 Pro - 2023-01-12 at 18 11 51](https://user-images.githubusercontent.com/67407678/212028052-b2072cec-3564-4588-8593-f539d20abf73.png)|


## 학습한 내용

- [네트워크 통신](https://bibi6666667.tistory.com/386)
    - URLSession을 사용해 API 요청을 보내고, 응답받은 데이터와 이미지를 화면에 보여줍니다.
    - API에서 이미지를 제공하지 않는 경우 대체 이미지를 띄우도록 했습니다.
- [이미지 캐싱](https://bibi6666667.tistory.com/375)
    - 한 번 다운로드한 이미지는 캐시에 저장해 두고, 이미지가 캐싱되어 있지 않을 때만 URL을 통해 다운로드를 진행했습니다.
- 싱글톤 패턴 사용
    - NetworkManager와 ImageCacheManager

## 🔲 클래스 다이어그램

![스크린샷 2023-01-12 오후 9 27 43](https://user-images.githubusercontent.com/67407678/212071786-d5658510-76a5-4ef9-bb5e-60e41eede065.png)

## 회고

- 복잡한 뷰 구현하기 
    - 기획서를 본 다음, 한 화면에 여러 뷰가 사용되므로 하나의 뷰 컨트롤러에 여러 자식 뷰 컨트롤러를 사용해 구현했습니다. 화면을 만들긴 했지만 결국 복잡도가 상당히 증가했습니다.
    - 한 화면 안에 있는 여러 뷰들에 대해 각각 뷰컨트롤러를 만들고 그것을 자식 뷰 컨트롤러로 두는 것과,
    - 한 화면 안에 여러 뷰들을 만들고 하나의 뷰컨트롤러가 모든 delegate, datasource를 수행하는 것
    - 각각의 장단점을 비교해서 사용해야 함을 느꼈습니다.
    - 키워드 : Container view controller, child view controller
    - [child view controllers](https://www.swiftbysundell.com/basics/child-view-controllers/)
- 싱글톤 패턴
    - NetworkManager와 ImageCacheManager는 여러 클래스에서 필요로 하므로 싱글톤으로 선언했습니다.
    - 하지만 여러 이미지를 비동기로 동시에 다운로드하는 상황에서, 여러 스레드가 하나의 ImageCacheManager에 접근하게 된다는 문제가 있습니다.
    - 다음에 싱글톤을 사용할 때는 더 안전한 방법으로 사용해야겠다고 느꼈습니다.
    - [what is a singleton and how to create one in swift](https://cocoacasts.com/what-is-a-singleton-and-how-to-create-one-in-swift) , [are singletons bad](https://cocoacasts.com/are-singletons-bad/)
    - [thread-safe singletons and their usage in Swift](https://sachithrasiriwardhane.medium.com/thread-safe-singletons-and-their-usage-in-swift-c992d34d85dd)
