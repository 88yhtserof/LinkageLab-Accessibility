
# 멜론 차트 탐색 분석 및 제안

<br>

## 개요 및 목차

### 개요

여러 목록 탐색 방식에 대해 분석하고, 그 중 멜론의 차트 탐색에 적용된 방식을 구현한 내용을 정리했습니다. 또한 해당 방식이 향후 적용될 가능성에 대한 의견을 담았습니다.

<br>

### 목차

1. **작업 개요**
    - 1.1 작업 내용
    - 1.2 배경 및 상황
2. **작업 상세**
    - 2.1 구현 방법
    - 2.2 구현 결과 화면
3. **작업 결과**
    - 3.1 멜론 차트 탐색 방식의 향후 적용 가능성
    - 3.2 향후 개선 방향 제안
4. **종합 의견**

<br>

## 작업 개요

### 작업 내용

멜론 차트 탐색에서 사용된 Section 중심의 목록 탐색 및 동작 구현

<br>

### 배경 및 상황

기본 컴포넌트에서는 **아이템 내부의 Component** 중심의 탐색이 이루어집니다. 이는 동일한 의미를 가진 컴포넌트를 여러 번 탐색해야하므로 비효율적입니다.

일반적으로 목록 탐색을 개선하기 위한 방법은 **Item**을 하나의 컨테이너로 구성하는 것입니다. 이를 통해 동일한 의미를 가진 컴포넌트들이 하나로 결합되며, 결과적으로 목록 탐색의 시간이 단축됩니다.

하지만 여전히 목록의 모든 아이템을 모두 탐색하지 않으면 아래로 넘어가지 않는 문제가 존재합니다. 이를 개선하기 위해 **Section 중심으로 초점이 이동** 가능하도록 개선된 것이 바로 **멜론 초점 탐색 방식**입니다.

- 기본: **Component**(컴포넌트) 중심 탐색
- 일반적인 개선: **Item**(아이템) 중심 탐색
- 멜론 탐색 방식: **Section**(섹션) 중심 탐색

<br>

| 기본 컴포넌트의 초점(Component) <br> / 일반적인 개선시 초점(Item) | 멜론 차트 탐색 화면 초점(Section) |
| ----- | ----- |
| <img src = "https://github.com/user-attachments/assets/1c6bcb98-30b0-4ca8-b09f-98afbda680ba" width = 600 height = 580> | <img src = "https://github.com/user-attachments/assets/b9e27ddb-17a7-4992-82c3-748b7ec204e7" width = 260 height = 580> |



<br>

## 작업 상세

### 구현 방법

멜론에서 사용한 개선 방식의 특징을 아래와 같습니다:

- **Section** 중심 탐색
- **로터**: 내부 아이템 탐색
- **동작**: 내부 아이템 기능

**VoiceOver**의 초점은 컴포넌트 또는 컨테이너 단위로 이동하기 때문에, 접근성을 개선하기 위해서는 화면 구성을 면밀히 분석해야 합니다. 이에 따라, 기능 구현에 앞서 **멜론 차트** 화면의 구성을 분석한 결과는 다음과 같습니다.

멜론 차트 화면은 **세로 List** 아이템에 **가로 List**가 삽입된 형태로 구성되어 있으며, **가로 List** 컴포넌트에 초점을 설정하여 **Section 단위 탐색**이 가능하도록 구현되어 있습니다.

<br>

| 화면 구조 설명 그림 | 멜론 차트 탐색 화면 초점(Section별) |
| ----- | ----- |
| <img src = "https://github.com/user-attachments/assets/350a5fdd-c01f-472f-9c9f-b8b97e80818e" width = 400 height = 580> | <img src = "https://github.com/user-attachments/assets/b9e27ddb-17a7-4992-82c3-748b7ec204e7" width = 260 height = 580> |



<br>

### 구현 결과 화면

<br>


| ‘기본 컴포넌트 모음’의 ‘멜론 차트 탐색’ 구현 화면 | ‘기본 컴포넌트 모음’의 ‘멜론 차트 탐색’ 시연 영상 |
| ----- | ----- |
| <img src = "https://github.com/user-attachments/assets/26b45e96-da77-4d56-ad36-dc88701e5e28" width = 300 height = 580> | <img src = "https://github.com/user-attachments/assets/83daa67a-577d-4835-895d-cf533522d1b8" width = 260 height = 580> |


<br>

## 작업 결과

### Section 중심 탐색 방식의 향후 적용 가능성

멜론 차트 탐색에서 사용되는 **Section 중심 탐색 방식**은 iOS의 **List 컴포넌트** 발전에 따라 앞으로 적용이 어려울 것으로 예상됩니다.

**iOS 13-14**부터, Apple은 **UICollectionView**의 더 진보된 UI 구성 방식인 **CompositionalLayout**을 제공했습니다. 이 CompositionalLayout은 **Section**, **Group**, **Item** 단위로 구성되어, 다양한 방향과 디자인으로 각 Section을 자유롭게 구성할 수 있는 유연성을 제공합니다.

이와 함께, 내부의 **가로 List**에 해당하는 **UICollectionViewOrthogonalScrollView**는 시스템이 자동으로 관리하게 되어, 개발자가 직접 접근할 수 없게 되었습니다.


<br>



| ‘CompositionalLayout 구조 | CollectionView 내부의 가로 List인 <br> _UICollectionViewOrthogonalScrollView |
| ----- | ----- |
| <img src = "https://github.com/user-attachments/assets/d80dd886-b302-48af-8943-12a04df652aa" width = 300 height = 450> | <img src = "https://github.com/user-attachments/assets/7fccba07-f975-4106-9780-6871a9d00b4d" width = 300 height = 450> |




<br>

### 향후 개선 방향 제안

AppStore는 **UICollectionView**를 사용하는 대표적인 Apple의 애플리케이션으로, 이 앱에서는 **VoiceOver** 기능을 활용할 때 초점이 **아이템** 중심으로 설정되도록 구현되어 있습니다. 또한, 멜론 차트 탐색 개선 이후 **목록 탐색 지침**이 변경되었으며, 이에 따라 기존에 사용되었던 **아이템 중심 목록 탐색 방식**이 새로운 표준으로 제안되고 있습니다.

따라서, 기술적 요구 사항과 새로운 지침에 부합하는 **아이템 중심 목록 탐색 방식**을 적용하는 것이 바람직할 것으로 판단됩니다.


<br>

| AppStore의 List 탐색 방식(아이템별 탐색) | 기본 컴포넌트 모음 CollectionView 개선 화면 (아이템별 탐색) |
| ----- | ----- |
| <img src = "https://github.com/user-attachments/assets/feb08354-d347-4afa-a6be-84f48f6088ff" width = 260 height = 550> | <img src = "https://github.com/user-attachments/assets/a90b2778-fe75-40af-8c79-997a83d54d98" width = 300 height = 550> |




<br>

## 종합 의견

멜론 차트 화면에서는 여러 목록 탐색 방식 중 **Section 중심 탐색 방식**이 사용되었습니다. 해당 화면은 **세로 List**에 **가로 List**를 결합한 형태로 구성되어 있으며, **가로 List**에 초점을 임의로 설정하여 **Section 중심 탐색**을 구현할 수 있었습니다. 그러나 **iOS 13-14** 이후 **CollectionView**의 UI 구성 방식이 진보됨에 따라, 앞으로는 **Section 중심 탐색 방식**을 적용하기 어려울 것으로 예상됩니다. 또한, 멜론 차트 탐색 개선 이후 **목록 탐색 지침**이 변경되었으며, 이에 따라 기존에 사용된 **아이템 중심 목록 탐색 방식**이 새로운 지침으로 제안되고 있습니다.

따라서, **목록 탐색**의 향후 개선 방향은 **기술적 요구 사항**과 **새로운 지침**에 부합하는 **아이템 중심 목록 탐색 방식**을 적용하는 것이 바람직하다고 판단됩니다.



<br>

<br>


