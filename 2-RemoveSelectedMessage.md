# "선택됨" 메세지 제거 작업


## 개요 및 목차


### 개요

List 컴포넌트에서 VoiceOver 사용 시 출력되는 “선택됨”이라는 메시지에 대해 설명하고, 이를 제거하기 위해 수행한 작업을 정리했습니다. 더불어 작업의 난이도 및 소요 시간에 대한 의견을 담았습니다.

<br>

### 목차

1. **작업 개요**
    - 1.1 작업 내용
    - 1.2 배경 및 상황
    - 1.3 접근성 문제의 원인
2. **구현 상세**
    - 2.1 구현 방법
    - 2.2 UIAccessibility 설명
    - 2.3 List 컴포넌트의 UIAccessibilityTraits
    - 2.4 “선택됨” 메시지 출력과 관련된 UIAccessibilityTraits
    - 2.5 .accessibilityTraits 재정의 방법
    - 2.6 accessibility 속성 재정의 작업
3. **작업 결과**
    - 3.1 작업 난이도 및 소요 시간
4. **종합 의견**

<br>


## 작업 개요


### 작업 내용

“선택됨” 음성 출력 제거 작업

<br>


### 배경 및 상황

`CollectionView` 또는 `TableView`(이하 List 컴포넌트)에서 select 동작 시 해당 아이템의 상태가 “선택”으로 설정되어 동작 및 확인 시 VoiceOver 음성으로 “선택됨”이 출력되었습니다.

<br>

| 선택됨 음성 출력 이미지 |
| ----- |
| <img src = "https://github.com/user-attachments/assets/162d376e-ddaa-4250-87b9-91b5d855bf97" width = 260 height = 580> |


<br>


### 접근성 문제의 원인

“선택됨”이라는 메시지는 동작에 대한 혼동을 일으켜 접근성에 문제가 됩니다. 

1. 사용자가 “해제됨”이라는 반대 개념이 존재한다고 오해할 수 있습니다. 
    
    예) 약관 동의
    
2. 추가 기능이 있다고 잘못 인식할 수 있습니다.
    
    예) 앨범 - 사진 선택, 사진 모아 보내기
    

<br>


## 구현 상세

### 구현 방법

`accessibilityTraits`을 재정의해서 컴포넌트 동작시 자동으로 설정되는 traits 차단하기

<br>


### UIAccessibility 개요


> [**UIAccessibilityTraits:**](https://developer.apple.com/documentation/uikit/uiaccessibilitytraits)
접근성 요소의 작동 방식을 설명하는 특징
> 

아래와 같이 기본적으로 제공되는 요소들이 있어 해당하는 특성을 찾아 임의로 설정할 수 있습니다:

- button
- link
- image
- header
- select
- …


<br>


### List 컴포넌트의 UIAccessibilityTraits

List 컴포넌트의 기본적인 traits는 `.none`으로, 즉 어떤 특성도 가지고 있지 않습니다. 개발자가 임의로 설정해주면 아래와 같이 설정된 traits에 따라 안내 메시지를 출력합니다.

```swift
func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, item: Detail) {
    
    ...
    if UIAccessibility.isVoiceOverRunning {
        cell.isAccessibilityElement = true
        cell.accessibilityTraits = .button  // ⭐️
    }
}
```


<br>

| 버튼  출력 이미지 |
| ----- |
| <img src = "https://github.com/user-attachments/assets/ad2344f8-54ae-4a23-86b6-458a9d3d2d9e" width = 260 height = 580> |



<br>


### “선택됨” 메시지 출력과 관련된 UIAccessibilityTraits

여러 `accessibilityTraits` 중 “선택됨” 안내 메시지를 출력하는 특성은 `.selected` 입니다. List 컴포넌트에서는 기본적으로 어떤 traits도 가지지 않지만, 선택 이벤트 발생 시 자동으로 해당 아이템은 `.selected` traits를 갖게 됩니다. 

정확하게 말하자면 accessibilityTraits가 button과 selected를 함께 가진 `UIAccessibilityTraits(rawValue: 9)` 으로 변경되게 됩니다.

컴포넌트 자체에 구현되어 있기 때문에 선택 이벤트 발생 시 자동으로 accessibilityTraits가 설정되므로 이를 차단하기 위해서는 해당 속성의 재정의가 필요합니다.

<br>


### .accessibilityTraits 재정의 방법

아래와 같이 accessibilityTraits를 재정의해줍니다. `get`에는 원하는 traits을 전달해주고 `set`은 초기화해주어 컴포넌트에서 자동으로 설정되는 selected 특성을 차단해줍니다.

```swift
class ButtonTraitsCollectionListCell: UICollectionViewListCell {
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get { .button }
        set {}
    }
}
```

<br>


### accessibility 속성 재정의 작업

accessibility 속성 재정의가 필요한 작업의 예시는 다음과 같습니다:

- 버튼 특성 설정: **accessibilityTraits**
- 이중 탭 동작 설정: **accessibilityActive**
- …

<br>


## 작업 결과

### 작업 난이도 및 소요 시간

VoiceOver의 “선택됨” 메시지를 제거하는 작업은 어렵지 않습니다. 왜냐하면 위의 코드와 같이  `UIAccessibilityTraits`를 재정의하여 시스템의 작업을 차단해주기만 하면 되기 때문입니다. 하지만 프로젝트의 규모에 따라 작업 시간이 달라질 수 있다고 생각됩니다.

보통 서비스는 일관된 UI를 위해 한 커스텀 컴포넌트를 여러 곳에서 사용합니다. 또한 유사한 기능을 수행할 때 컴포넌트 구현체 간 긴밀한 관계(상속)를 가지기도 합니다. 이러한 기존 구현에 `accessibilityTraits`를 재정의하게 되면 이에 영향을 받아 수정이 필요해지는 부분들이 많이 생길 수도 있습니다.

이번 프로젝트는 규모가 작아 `accessibilityTraits` 재정의에 어려움은 없었으나, 다음과 같은 수정이 필요했습니다.

1. 기존에 뉴스 더보기 에서 사용하던 커스텀 컴포넌트의 상속을 변경해주어야 했습니다. 
accessibilityTraits를 재정의한 개체를 만든 후 이를 상속받는 형식으로 수정했습니다.
    
    ```swift
    class ButtonTraitsTableCell: UITableViewCell {
        
        override var accessibilityTraits: UIAccessibilityTraits {
            get { .button }
            set {}
        }
    }
    ```
    
    ```swift
    final class NewsListCellWithAccessibility: ButtonTraitsTableCell { ... }
    
    ```

<br>

| 뉴스 더보기 accessibilityTraits 설정 |
| ----- |
| <img src = "https://github.com/user-attachments/assets/3a4807e6-dfc3-444d-a0d2-d81919b00631" width = 260 height = 580> | 


<br>

1. Outline 화면에서 머리말과 세부 구분은 동일한 UI를 가지기 때문에 둘다 `UICollectionListViewCell` 을 사용했지만, 서로 다른 traits을 갖기 때문에 이를 위해 두 개의 개체로 구분해주어야 했습니다.
    
    ```swift
    
    // 1️⃣
    class HeaderTraitsCollectionListCell: UICollectionViewListCell {
        
        override var accessibilityTraits: UIAccessibilityTraits {
            get { .header } // 머리말
            set {}
        }
    }
    
    // 2️⃣
    class ButtonTraitsCollectionListCell: UICollectionViewListCell {
        
        override var accessibilityTraits: UIAccessibilityTraits {
            get { .button } // 버튼
            set {}
        }
    }
    ```
    
    ```swift
    final class OutlineViewController: DefaultViewController {
        
        // 1️⃣
        func headerRegistrationHandler(cell: HeaderTraitsCollectionListCell, indexPath: IndexPath, item: Detail) {
            ...
        }
    
    		// 2️⃣
        func cellRegistrationHandler(cell: ButtonTraitsCollectionListCell, indexPath: IndexPath, item: Detail) {
            ...
        }
    }
    ```
    

<br>

| Outline 화면 머리말 traits | Outline 화면 세부 구분 traits |
| ----- | ----- |
| <img src = "https://github.com/user-attachments/assets/a3814571-15ba-43d8-8838-096813795661" width = 260 height = 580> | <img src = "https://github.com/user-attachments/assets/f6cebc8a-d44e-4584-87ff-3696a080b628" width = 260 height = 580> |






<br>


## 종합 의견

“선택됨” 메시지는 사용자에게 동작에 대한 혼동을 일으킬 수 있어 개선이 필요합니다. 이를 제거하기 위해 accessibility 속성을 재정의하는 작업이 필요했습니다. 재정의 과정에서 기존 프로젝트의 구현 부분을 수정해야했고, 이로 인해 일정 시간이 소요되었습니다.

accessibility 속성을 재정의하는 작업은 본질적으로는 어렵지 않지만, 기존 구조에 변화를 주는 만큼 프로젝트의 규모에 따라 소요 시간이 크게 달라질 것으로 예상됩니다.



<br>


<br>

