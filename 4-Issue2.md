
# 이슈2: 특정 컴포넌트 접근 불가

## 개요

**‘전화번호 복사’** 컴포넌트에서 발생한 초점 통합 이슈에 대해 소개한 후, 개발팀과 접근성 팀의 논의를 바탕으로 이슈 상황을 재현했습니다. 그리고 이슈 분석 및 작업을 정리하고, 결과를 바탕으로 의견을 제안했습니다. 마지막으로 해당 이슈의 원인인 컴포넌트 구현 의도를 분석했습니다.

<br>


## 작업 상세

### 구현 방법

`NSMutableAttributedString` 를 사용하여 하나의 `UILabel`을 두 가지 영역으로 나누어 레이아웃 및 기능을 추가했습니다. “전화번호 복사”  문자열 중 “복사”의 영역을 찾아 색상을 변경하고 `UITapGestureRecognizer`를 적용하여 복사하기 동작을 구현했습니다.

### 구현 결과

| 구현 결과 화면 |
| ----- |
| <img src = "https://github.com/user-attachments/assets/3a729490-6b33-4261-b8d3-5c4605084754" width = 260 height = 580> |


<br>


## 작업 결과

### 초점 설정 단위 및 가능한 개선 방안

VoiceOver 활성화 시 초점이 설정되는 단위는 컴포넌트 또는 여러 컴포넌트를 결합하여 만든 컨테이너입니다. 따라서 하나의 컴포넌트에 두 개의 초점을 설정하는 것을 불가능합니다. 이러한 이유로 “전화번호 복사” 컴포넌트에 두 개의 초점을 두기 위해서는 두 개의 버튼으로 컴포넌트를 분리해야합니다. 만약 UI 변경이 불가능하다면 복사하기 기능을 로터로 제공하는 것이 바람직할 거 같습니다.

### **구현 방식을 변경한다면**

> 두 개의 버튼 컴포넌트로 분리
> 

‘전화번호’와 ‘복사’에 개별 초점을 주기 위해서는 두 개의 컴포넌트로 구분하는 것이 가장 좋은 방법입니다.

문제가 되는 컴포넌트와 형태가 유사한 컴포넌트들을 함께 살펴본 결과, 텍스트 바로 옆에 버튼이 구현된 컴포넌트가 있는 것을 발견했습니다. 이것으로 본다면 ‘전화번호’와 ‘복사’ 역시 분리시켜 UI를 구성할 수 있을 것으로 보입니다.
 
<br>


### **기존 구현 방식을 유지한다면**

> 하나의 텍스트 컴포넌트 유지
> 

기존 구현 방식을 유지한다면 이중탭은 ‘전화 걸기’ 그리고 로터로 ‘복사하기’ 기능을 주는 것이 최선일 것으로 판단됩니다.

현재 구현 방식은 터치된 지점을 기반으로 동작을 구분하는 방식으로 되어 있습니다. 즉, “복사”가 문자열 내에 몇 번째에 위치하는지 확인한 후 해당 영역에 터치가 일어나면 복사 동작이 실행되는 방식입니다.

초점은 개별의 컴포넌트 또는 여러 개의 컴포넌트를 하나로 그룹으로 묶어 설정할 수 있습니다. 하지만 하나의 컴포넌트를 두 개로는 분리하는 것은 불가능하며 권장되지 않습니다. 따라서 기본 구현 방식을 변경하지 않는다면, 현재의 구현 방식이 최적으로 예상됩니다.

iOS의 기본 **날씨 앱**에서 한 텍스트 컴포넌트에 로터를 사용하여 동작을 추가한 사례를 발견해 함께 첨부합니다.

| 날씨앱 예시 |
| ----- |
| <img src = "https://github.com/user-attachments/assets/fd899193-8b7a-4648-b03a-31064edb08c8" width = 260 height = 580> |



<br>

### 구현 의도 분석

본 구현에서 처음부터 두 개의 버튼 대신, 하나의 문자열을 사용하고 터치 지점을 인식하는 복잡한 방식으로 동작을 구현되어있습니다. 일반적으로 버튼을 사용하는 간단하고 직관적인 방식이 아닌 복잡한 방식이 사용되었는지에 대한 유추를 해보았습니다.

<br>

### 1. 초기 구현 의도 가정

처음에 가정한 구현 의도는 **가게 정보**가 하나의 고정된 리스트로 구현되어 있어 동일한 구조를 반복해야 했기 때문에, 이를 처리하기 위해 하나의 텍스트 컴포넌트로 구현했을 가능성이 있다고 생각했습니다. 즉, 반복되는 정보 구조를 간결하게 처리하기 위해 하나의 텍스트 컴포넌트를 사용했을 것이라는 분석이었습니다.

<br>

### 2. 복잡한 방식 선택 이유

그러나 실제 화면을 살펴보면, 한 행에 여러 개의 분리된 컴포넌트가 존재하는 것을 확인할 수 있었습니다. 


이러한 점을 바탕으로, 복잡한 방식이 선택된 이유에 대해 다시 생각해본 결과, **다음과 같은 가능성을 유추할 수 있었습니다.**

- 이미 만들어진 **커스텀 컴포넌트**가 여러 곳에서 사용되고 있을 수 있습니다. 이 경우, 기존 컴포넌트를 수정하는 데 시간이 많이 소요될 수 있기 때문에, **하나의 텍스트 컴포넌트**로 구현하여 수정 작업을 보다 효율적으로 처리하려는 의도가 있었을 가능성이 있습니다.
- 여러 컴포넌트를 수정하는 데 드는 시간과 비용을 절감하기 위해, 초기 구현에서 복잡한 방식이 선택되었을 것으로 예상됩니다.

<br>

### 3. 결론

따라서, 처음에 복잡한 방식으로 구현된 이유는 **기존의 커스텀 컴포넌트를 재사용하려는 의도**와 **수정 및 유지보수 작업의 효율성을 고려한 결정**이었을 가능성이 높습니다. 이러한 방식이 선택된 배경을 통해, 구현자가 프로젝트의 유지보수성을 높이기 위한 전략이었을 것으로 유추됩니다.

<br>

### 작업 결과에 따른 결론

결과적으로 가장 좋은 방식은 현재 하나의 텍스트 컴포넌트로 구성되어 있는 “전화번호 복사”를 두 개의 버튼 컴포넌트를 구분하는 것입니다. 두 개 모두 동작 기능을 포함하고 있어 버튼의 역할을 수행하고 있으며, 각각 다른 의미를 갖고 다른 동작을 수행하고 있기 때문에 분리되는 것이 바람직합니다.

만약 상황상 UI 변경이 어렵다면 현재 구현되어 있는 “로터로 동작 제공” 방식이 최선으로 보여집니다. 초점의 최소 단위는 컴포넌트이며 하나의 컴포넌트를 두 개로 분리할 수 없습니다. 따라서 하나에 두 개의 다른 동작을 추가하기 위해 로터가 기능이 필요할 것 같습니다.

<br>

## 종합 의견

**‘전화번호 복사’** 컴포넌트에서 발생한 초점 통합 이슈는 **초점 설정 단위**와 **화면 UI 구성 방식**에 의해 발생한 문제입니다.

이 문제를 해결하기 위해 해당 화면을 분석한 후, `NSMutableAttributedString`과 `UITapGestureRecognizer`를 활용하여 한 컴포넌트에 두 개의 초점을 설정하려는 작업을 시도했습니다. 그러나 VoiceOver의 초점 설정 단위는 **컴포넌트** 단위로, 하나의 컴포넌트에 두 개의 초점을 설정하는 것은 불가능한 상황임을 확인했습니다.

이러한 분석 결과를 바탕으로, 두 가지 해결 방안을 제안하였습니다. 기존 화면 UI 구성을 유지하는 경우, **복사 기능을 로터로 제공**하는 방법이 최적일 것으로 판단됩니다. 화면 UI 구성을 변경할 수 있다면, **전화 걸기 버튼**과 **복사 버튼**을 분리하여 구성하는 것이 바람직한 방법입니다.

마지막으로 이슈 발생 원인인 컴포넌트의 구현 의도를 분석했습니다. 일반적으로 사용하는 버튼 컴포넌트가 아닌 터치 지점을 인식해 동작을 수행하는 복잡한 방식을 사용한 이유는 기존 커스텀 컴포넌트를 재사용하려는 의도와 수정 및 유지보수 작업의 효율성을 고려한 방법으로 유추됩니다.
