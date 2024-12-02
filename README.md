# 링키지랩

> 기간: 2024.09 - 2024.11 <br>
> 기술: Swift, UIKit, SwiftUI, Accessibility APIs, Concurrency

- 카카오 서비스 디지털 접근성 컨설팅 팀 iOS 인턴
- 모바일 애플리케이션 접근성 지침 기반 iOS 서비스 분석
- Accessibility API를 활용한 iOS 서비스 접근성 개선


 <img src = "https://github.com/user-attachments/assets/76a4583e-61bb-46bd-9fea-c040c9d1e135" width = 100 height = 100>  <img src = "https://github.com/user-attachments/assets/913f5809-497d-4671-a15c-5d0942816ecc" width = 100 height = 100>  <img src = "https://github.com/user-attachments/assets/14e7b305-899b-4b37-b705-47c8a6ccd707" width = 100 height = 100>




<br>


## 카카오 iOS 접근성 이슈 분석 및 제안

### 이슈1: 임의 탐색 불가

- 화면 UI 구성에서 컴포넌트의 상하위 계층 구조로 인해 발생한 문제
- ZStack과 accessibilitySortPrioroty 속성을 사용하여 컴포넌트의 초점 우선 순위를 설정
- 우선 순위 설정 시 컴포넌트의 계층 구조가 자동으로 설정됨을 발견하고 탐구 및 의견 제안
- [**🔗상세 설명**](https://github.com/88yhtserof/LinkageLab-Accessibility/blob/main/3-Issue1.md)


<br>

### 이슈2: 특정 컴포넌트 접근 불가
- 초점 설정 단위와 화면 UI 구성 방식에 의해 발생한 문제
- NSMutableAttributedString과 UITapGestureRecognizer를 활용하여 초점 설정 시도
- VoiceOver의 초점 설정 단위는 컴포넌트 단위로, 추가 초점 설정 불가 확인 및 의견 제안
- [**🔗상세 설명**](https://github.com/88yhtserof/LinkageLab-Accessibility/blob/main/4-Issue2.md)

<br>

| 이슈1 재현 | 이슈2 재현 |
| ----- | ----- |
| <img src = "https://github.com/user-attachments/assets/766e896f-9270-41e6-a95a-c0a13de73167" width = 260 height = 580> | <img src = "https://github.com/user-attachments/assets/3a729490-6b33-4261-b8d3-5c4605084754" width = 260 height = 580> |


<br>

<br>

<br>

## <Basic Components with Accessibility: iOS 디지털 접근성 교육용 앱> 제작

- 30개 이상의 컴포넌트 사례의 접근성 보장 여부 조사 및 개선 작업
- 멜론 차트 탐색 분석 및 제안
    - 여러 List 탐색 방식을 조사하고 멜론의 차트 탐색 방식과 비교, 분석 및 향후 적용 방식 제안
    - [**🔗상세 설명**](https://github.com/88yhtserof/LinkageLab-Accessibility/blob/main/1-MelonChart.md)
- “선택됨” 메세지 제거 작업
    - List 컴포넌트에서 음성 출력되는 “선택됨” 메시지 분석, 제거 작업 진행 및 의견 제안
    - [**🔗상세 설명**](https://github.com/88yhtserof/LinkageLab-Accessibility/blob/main/2-RemoveSelectedMessage.md)




<br>

<br>



<br>
