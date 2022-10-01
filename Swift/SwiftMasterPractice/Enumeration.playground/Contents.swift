import Foundation
import Darwin
import Security

// Custom Type
// Enumeration, Struct, Class

// 열거형 (Enumeration)
// -> 특정 Type 자체를 한정된 사례 (case) 안에서 정의하는 타입.
// ex) String 타입을, 요일을 나타내는 "월"~"일"의 case로 정의한다.

// 열거형 사용의 장점
// 명확한 분기처리가 가능하다. (해당 케이스에 속하지 않으면 처리되지 않으므로)
// 코드의 가독성, 안정성 높아진다.


// 열거형은 새로운 사용자 정의 타입으로 정의되는 것이므로, 대문자로 선언한다.

enum School {
    case elementary
    case middle
    case high
    case university
}

var aSchool : School = School.elementary


enum Weekday { // case 명은 소문자로 시작
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case satureday
    case sunday
}

var today : Weekday = Weekday.friday // today의 타입은 Weekday 이며, 그중에서도 friday case이다.
today = .sunday // 다른 케이스의 enum값을 할당하는 방법

// 조건문을 활용한 열거형의 분기처리

// if문 -> 잘 안씀

if today == .monday {
    print("오늘은 월요일 입니다.")
}
else if today == .tuesday {
    print("오늘은 화요일 입니다.")
}
else if today == .wednesday {
    print("오늘은 수요일 입니다.")
}
else if today == .thursday {
    print("오늘은 목요일 입니다.")
} // 이하생략

// switch문 -> 자주 사용

switch today{
case .monday : print("오늘은 월요일 입니다.")
case .tuesday : print ("오늘은 화요일 입니다.")
case .wednesday : print("오늘은 수요일 입니다.")
case .thursday : print ("오늘은 목요일 입니다.")
case .friday : print("오늘은 금요일 입니다.")
case .satureday : print ("오늘은 토요일 입니다.")
case .sunday : print ("오늘은 일요일 입니다.")
} // enum타입의 경우, 모든 case들을 넣으면 switch문이 exhaustive



// 열거형의 원시값과 연관값


// 원시값(Raw Value) : 열거형의 모든 케이스가 매칭되는 기본 타입 (Hashable 한) ~ Int, String, Character, Double 등등등

enum Alignment : Int {
    case lleft
    case rright
    case ccenter
} // Int타입의 경우, 이렇게 각 케이스에 원시값을 입력 안하면, 0,1,2 이렇게 자동으로 원시값이 매칭됨
    // 1(설정시),2,3
    // 0,2(설정시),3

var align = Alignment(rawValue: 1) // -> rright, Alignment.rright와 완전히 동일한 표현
var num = Alignment.lleft.rawValue // 모든 case에 대해 원시값이 자동 할당 되므로, num은 옵셔널타입이 아니다.

enum Alignment1 : String {
    case lef
    case rig
    case cen = "C"
} // String 타입의 경우, 각 케이스에 대해 원시값을 입력하지 않으면, case의 변수명과 동일한 문자열이 자동으로 원시값으로 매칭된다.

print(Alignment1.lef.rawValue) // lef
// Alignment1.cen.rawValue = "CC" -> error, rawValue는 immutable 하다.

// Character / Double 등 일반적이지 않은 원시값 타입을 가지는 열거형의 경우, 직접 모든 케이스에 대해 원시값을 명시해 줘야한다. (대부분의 경우에 원시값으로 Int / String 사용)

enum RpsGame : Int {
    case rock
    case scissors
    case paper
}

// 객체 생성
// 두가지 방식 ~ 생성자에 rawValue 값을 input으로 받아서 생성하는 것과, 직접 case 명을 통해 생성하는 것은 차이가 있음
var game1 = RpsGame(rawValue: 0) // -> 옵셔널 타입. input 값이 실제로 없는 원시값일수도 있기때문
var game2 = RpsGame.rock // -> 실제로 있는 case 명으로 생성했기 때문에 nil 가능성 x -> 옵셔널 아님

print(game1!) // 출력은 되지만, 타입이 문자열이 아니라, 'RpsGame' 타입 인것임 (case 이름이 출력).

enum Planets : Int {
    case mercury = 1 , venus, earth, mars, jupiter, saturn, uranus, neptune
}

let planet = Planets(rawValue: 1)! //mercury

// 원시값은, 결국 숫자, 또는 문자열을 각 케이스에 매칭시켜 자유롭게 활용하기 위해 사용하는 것이다. (거의 대부분의 경우 숫자나 문자열 사용)




// 연관값(Associated Value) : 열거형의 구체적인 추가정보를 저장하기 위해 사용하는 값.
// 각 케이스 별로 상이한 특징이 있고, 그것을 저장 / 활용할 필요가 있을때 사용한다.
// 원시값과는 다르게, 하나의 케이스에 서로 다른 연관값을 저장할 수 있으며, 따라서 선언 시점이 아니라 열거형 객체를 생성할 때 연관값을 저장하는것.
// 연관값이 있는 열거형에서, case는 카테고리의 역할을 할 뿐이고, 실제로 다양한 연관값을 가지는 객체 생성 가능

enum Computer {
    case cpu(core: Int, ghz: Double)// Computer의 case 중 하나인 cpu의 추가정보인 core, ghz 값을 명시
    case ram(Int,String)
    case hardDisk(gb:Int)
}

var newCom = Computer.cpu(core: 1, ghz: 0.0) // raw value는 없음
var newCom1 = Computer.cpu(core: 2, ghz: 1.1) // 같은 case 라도 다른 연관값 할당 가능


/*======================================================
 ⭐️ 원시값 VS 열거형
 - 자료형 선언 방식 : 선언하는 위치가 다르다.
   -> 원시값의 경우 ~ 타입을 선언할때 자료형 선언 (주로 Int/String)
   -> 연관값의 경우 ~ case를 선언할때 튜플의 형태로 타입 형식 제한 없이 선언
 - 값의 저장 시점
    -> 원시값의 경우 ~ 선언 시점에서 값이 저장 된다 (immutable)
    -> 연관값의 경우 ~ 새로운 열거형 객체를 생성하는 시점에서 값이 저장된다.
 - 서로 배타적이다 : 하나의 열거형에서 원시값과 연관값을 둘다 사용하는것은 불가능
    -> 한 열거형에서 둘중 하나만 사용 가능!
======================================================*/

var chip : Computer = Computer.cpu(core: 8, ghz: 3.1)

// switch문을 사용해 원하는 세부 케이스 별로 분기처리하기
switch chip {
case .cpu(core: 8, ghz: 3.1):
    print("CPU 8코어 3.1GHZ 입니다.")
case .cpu(core: 7, ghz: 3.7):
    print("CPU 7코어 3.7GHZ 입니다.")
case .ram(32,_):
    print("32기가 램 입니다.")
default :
    print("나머지 부품에는 관심 없습니다.")
}

//binding을 통해 연관값을 직접 매칭해주기.

switch chip {
case .cpu(let core, let ghz):
    print("Cpu \(core)코어, \(ghz)GHZ 입니다.")
default:
    print("cpu가 아닌 부품입니다.")
}




// 옵셔널 + 열거형 접목 => 옵셔널 타입의 정확한 이해

/*
 <옵셔널 타입의 내부 구현>
 
 enum Optional<Wrapped> {// 제네릭 문법
    case some(Wrapped) //연관값으로 Wrapped 가짐.
    case none // nil값과 동일한 의미의 case.
 }

 */

var o1 = Optional.some(7) // 이렇게 생성자를 사용해 옵셔널을 선언할 수 있음 (옵셔널이 열거형 타입이기 때문)
var o2 = Optional<Any>.none // nil

// 옵셔널 바인딩의 원리

switch o1 {
case let .some(a):
    print(a)
case .none:
    print("nil")
} // 열거형 case 패턴을 통해 내부 연관값을 꺼낸다.


// .none과 nil은 완전히 동일하다.
// -> .none은 명시적인 열거형의 case로 표현한 것이고, 일반적으로는 '값이 없다'라는 의미를 표현하기 위해 nil 키워드를 사용한다.




// 열거형의 Switch문 활용 예제 ~ 열거형은 거의 switch문과 함께 쓰인다.


enum LoginProvider : String { // 원시값을 가지는 열거형
    case email
    case facebook
    case kakaotalk
}

let userLogin1 = LoginProvider.email // email
let userLogin2 = LoginProvider(rawValue:"facebook")! // facebook, 옵셔널 강제추출

switch userLogin1{ // 로그인의 경로에 따른 분기처리
case .email :
    print("이메일로 로그인")
case .facebook :
    print("페이스북으로 로그인")
case .kakaotalk :
    print("카카오톡으로 로그인")
}


// 특수한 경우 ~ 열거형에 연관값이 없고, 옵셔널 열거형인 경우

enum SomeEnum  {
    case left
    case right
}

let x:SomeEnum? = .left

/*
 SomeEnum?의 의미 -> 옵셔널 열거형
 - 값이 있는 경우 .some -> 내부에 다시 열거형이 들어 있어 .left/.right
 - 값이 없는 경우 .none -> nil
*/

// 원칙적으로는 옵셔널 enum 타입인 x를 처리할때, 다음과 같이 중첩된 switch문을 사용해줘야 함.
switch x { // x!를 switching 하는 것이 아닌 x 로표현해 줘도 된다(.none의 case 까지 다루기 때문에)
case .some(let value): // Optional.some(let value) = Optional.some(SomeEnum.left) (바인딩)
    switch value{
    case .left:
        print("값 있음, 왼쪽으로 가기")
    case .right:
        print("값 있음, 오른쪽으로 가기")
    }
case .none:
    print("값 없음, 계속 전진")
}

// 스위프트에서 제공하는 편의성

switch x {
case .some(.left):
    print("값 있음, 왼쪽으로 가기")
case .some(.right):
    print("값 있음, 오른쪽으로 가기")
case .none :
    print("값 없음, 계속 전진")
}

// 열거형에 연관값이 있는 경우

/*
 <연관값이 있는 열거형의 활용 -> 열거형 case 패턴 (Enumeration Case Pattern)⭐️>
 = 구체적 정보인 연관값을 'case' 키워드를 사용해, 주로 switch문을 통해 변수에 바인딩 (let or var)하는 패턴
 
 [열거형 case 패턴]
 - case Enum.case(let 변수이름) :
 - case let Enum.case(let 변수이름):
 
 -> switch문 뿐만 아니라 if / guard / for-in / while 등에도 필요하면 사용 가능
 
 -> 주로 연관값이 있는 열거형타입의 객체가 특정 case 에 속하는지를 판별하는데 자주 쓰임.
 */

// switch문이 아닌 곳에서 열거형 case 패턴을 사용하는 모습.

let chip2 = Computer.hardDisk(gb: 128)

if case let Computer.hardDisk(gb) = chip2 { //만약 chip2 라는 변수가 Computer.hardDisk(gb)라는 변수에 바인딩 될 수 있는 형태라면
    print("\(gb)기가바이트의 칩 입니다.")
}

// 이렇게도 표현 가능
if case Computer.hardDisk(gb: let GB) = chip2 {
    print("\(GB)기가바이트의 칩 입니다.")
}

if case Computer.hardDisk(gb: let GB) = chip2, GB == 128 { // 특정 연관값을 가지는 케이스만 분기.
    print("얘는 무조건 128 기가바이트임")
}

// 가장 일반적인 경우인, switch문에서의 열거형 case 패턴

switch chip2 {
case .hardDisk(gb:let GB):
    print("\(GB)기가바이트의 칩")
default :
    print("그 외")
}


// for문에서 열거형 case패턴을 사용하는 사례

let chipLists : [Computer] = [
    .hardDisk(gb: 500),
    .cpu(core: 4, ghz: 3.0),
    .cpu(core: 8, ghz: 3.5),
    .ram(16, "SRAM"),
    .ram(32, "DRAM"),
    .ram(16,"SRAM")
]

for case let .cpu(core: c, ghz: g) in chipLists { // 배열중, cpu case에 해당하는 멤버들에 대해서
    print("core -> \(c), ghz-> \(g)")
}

print ("============================================")

for chip in chipLists{ // 케이스 상관 없이 모든 경우에 대해
    print("chip -> \(chip)")
}

// 옵셔널 타입의 요소를 가지는 array 에서 nil이 아닌 요소만 프린트하기!

let optArr : [Optional<Int>] = [nil,1,4,nil,nil,7]

for case .some(let wrapped) in optArr{
    // 바인딩 성공시 프린트
    print("found number -> \(wrapped)")
}


// Devin님 질문 ~ 연관값이 있는 옵셔널 열거형은 두번 벗기기 단순화 불가?

enum InSchool {
    case students(name : String, id: Int)
    case classes(classNumber : Int)
    case teacher(name: String, subject: String)
}

let schoolOpt : InSchool? = .students(name: "Swimmer", id: 1)

switch schoolOpt {
    
case let .some(wrapped):
    switch wrapped{
    case .students(let name, let id):
        print("Student -> \(name),\(id)")
    case .classes(let classNumber):
        print("Classe -> \(classNumber)")
    case .teacher(let name, let subject):
        print("Teacher -> \(name),\(subject)")
    }
case .none:
    print("Nil!!")
    
}

// 간략화

switch schoolOpt {
    
case .some(.students(let name, let id)):
   print("Student -> \(name),\(id)")
case .some(.teacher(let name, let subject)):
    print("Teacher -> \(name),\(subject)")
case .some(.classes(let classNumber)):
    print("Class -> \(classNumber)")
case .none:
    print("Nil!!")
    
}


// 옵셔널 패턴 (Optional Pattern)
// 옵셔널 타입에서, 열거형 케이스 패턴을 더 간소화 한 패턴

let a : Int? = 1

// 기존의 방식 (열거형 case 패턴)

switch a {
case .some(let z):
    print(z)
case .none:
    print("옵셔널 바인딩 실패")
}

//옵셔널 패턴 적용

switch a{
case let z?: // let z = a를 간소화 한 표현
    print(z)
case nil:
    print("옵셔널 바인딩 실패")
}


// if문의 열거형 case 패턴을 옵셔널 패턴으로 간략화해보기

if case .some(let z) = a {
    print("값 있음! 옵셔널 바인딩 가능 -> \(z)")
}

// 간략화

if case let z? = a { // case 키워드를 사용하기는 한다.
    print("값 있음! 옵셔널 바인딩 가능 -> \(z)")
}


// 옵셔널 패턴의 for 문 적용

let newOptArr : [Int?] = [nil,2,5,nil,7,9,10,nil,32]

// for 문을 통해 nil이 아닌 값만 프린트 해주기

//열거형 case 패턴
for case .some(let x) in newOptArr {
    print("enum_case_pattern value -> \(x)")
}

// 옵셔널 패턴
for case let x? in newOptArr{
    print("optional_pattern value -> \(x)")
}

// 열거형의 unknown 키워드

//@unknown

// 만약 열거형에서 케이스가 아주 많아지면 항상 올바른 처리를 하고 있다고 말할 수 있을까?

enum IntroducedRoute{
    case instagram
    case acquaintance
    case facebook
}

let aUserIR :IntroducedRoute = .instagram

switch aUserIR {
case .instagram :
    print("인스타그램을 통해 유입된 유저")
case .acquaintance :
    print("지인 소개를 통해 유입된 유저")
/*
case .facebook :
    print("페이스북을 통해 유입된 유저")
*/
default :
    print("페이스북을 통해 유입된 유저")
}

// 이때, 만약 enum에 case youtube 라는 케이스가 추가된다고 생각해보자, 그러면 스위치문을 수정하지 않는 한, 분기처리 할때 디폴트로 떨어져 '페이스북을 통해 유입된 유저'로 간주될 것임 (실제로 현업에서 코드가 매우 길고 복잡해서, 일일히 소스코드를 수정하기 힘들때 자주 발생할 수 있는 문제.) -> default 블럭만을 추가한다고 해결할 수 없는 문제임.

// -> 그래서 unknown 키워드 사용

switch aUserIR {
case .instagram :
    print("인스타그램을 통해 유입된 유저")
case .acquaintance :
    print("지인 소개를 통해 유입된 유저")
/*
case .facebook :
    print("페이스북을 통해 유입된 유저")
*/
@unknown default :
    print("페이스북을 통해 유입된 유저")
}

//@unknown -> Swift 5.0 부터 등장한 키워드!
// unknown 키워드를 default 옆에 붙여주면, switch문이, enum의 모든 case를 커버하지 않고 있다고 warning을 해주어, 코드를 고칠수 있게끔 알림을 해준다. (고쳐야 할 코드의 이정표 역할), 이는 개발자의 실수 가능성을 컴파일 시점에 알려주는 것으로 나중에 발생할 수 있는 오류를 방지.
