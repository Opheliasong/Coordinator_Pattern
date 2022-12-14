# Coordinator Pattern Example

## Coordinator Pattern을 생각하게 된 배경

예전 한 프로젝트를 맡아 유지, 보수 관리를 해야 하는 업무를 맡아야 하였는데, MVC 구조의 형태중 ViewController에 너무 많은 기능이 부여 되어 있어(매우 Massive View Controller한) 결합이 너무 강하게 되어 있어 수정이 쉽지 않은 상황에 코드 인계를 받고 수정 관리 하게 된 적이 있었습니다.

해당 프로젝트의 경우 다양한 View들의 전환이 유기적이길 원했고, 이런 유기적인 전환과 새로운 기능 추가의 이슈 홍수속에 ViewController의 내부는 더욱더 비대해지고, 다른 View들간의 종속성이 더욱 깊어져 갔습니다.

이런 강한 종속성의 문제는 새로운 기능, 프로젝트의 새로운 이벤트가 진행시 필요한 작업을 위해 고려 해야 할 부분이 많으며, 빈번한 수정 이슈(가벼운 A/B 테스트, 혹은 View 수정)에 대응하기 위해 항상 거대한 ViewController의 코드의 물결에서 뷰 전환 로직을 찾아 수정해야 했으며 이런 Massive한 코드를 누비며 여유롭게 수정하기에는 가벼운 수정에도 많은 시간이 필요하게 되는 문제가 점점 두각되기 시작합니다.

결국 이런 구조는 매우 빈번한 휴먼에러를 발생 시켜 QA 인력 및 개발 인력들을 긴장하고 피곤하게 만들기 시작했습니다.

결론적으로 이런 무식하게 기능이 많은 UiViewController의 기능을 줄이고, 유기적인 구조의 View전환을 통해 개발 시간의 단축 및 가시성을 높이고 싶은 욕구가 생기기 시작합니다.
~~너무 나도 자주 보는 시나리오이지 않나 싶습니다. 불편해야 발전을 하지~~

우선 모든 구조를 바꾸긴 쉽지 않으니 적어도 뷰 전환을 위한 코드들에 패턴을 적용하여 해결해 보기 시작합니다.

## Coordinator?

이미 오래된 2015년의 Soroush Khanlou가 발표한 내용의 Coordinator로 [(Blog)](https://khanlou.com/2015/01/the-coordinator/), 그의 주장을 쉽게 정리하자면

- 심플한 라인으로 View의 present 로직이 구성된다. 이건 심플한 앱에서는 매우 쉽고 훌륭하다.
- 하지만, 복잡도가 증가하고 같은 View에서 서로 다른 View들로 가기 위해 새로운 작업들을 해야 할 것이며 이런 present 로직들은 서로 다음 단계로의 진입에 대하여만 알게 된다.
- UIViewController는 UI영역에 포함된 객체이며, 그렇기에 보다 상위 단계의 객채에서 이런 것들을 관리하게 될 경우 매우 큰 이점들이 존재하며 이는 순서의 배열, 모든 View를 관리하는 controller들을 관리하기 수월함이 있다.
- 

## 시나리오

1. 해당 앱은 색상들을 나열하고, 해당 색의 상세 정보, 구매, 할인 이벤트 안내 및 할인 구매 행동을 할 수 있다.
2. 전체 UI View의 종류는 다음과 같다
    1. Main :  앱 최초 실행시 등장하는 VIew
    2. Detail: 색의 상세 정보값을 보여주며, 가격 및 RGB 값을 보여주는 view.
    구매 행동을 할 수 있다.
    3. Events: 현재 할인 행사중인 이벤트의 상세 정보를 보여준다. 구매 및 상세 페이지로 이동이 가능하다
    4. Buy: 선택한 색의 구매 페이지로 구매 행동을 할 수 있다. 구매 완료시 Main으로 다시 돌아간다.
3. Main view의 형태는 구매 가능한 색의 정보를 Collection Layout으로 표시하며, Item 선택시 상세 페이지로 이동 가능하다.
4. Event view의 형태는 List layout으로 표시하며, 해당 아이템에는 구매와 상세보기 버튼이 포함되어 있다.
5. Detail view의 형태는 단일 스크롤 뷰이며, 이전 선택한 색의 값이 배경 화면으로 설정되며 색의 톤에 따라 폰트의 색상이 달라진다. 상세 내용의 정보는 RGB값, 현재 색상의 가격이 있다.
6.