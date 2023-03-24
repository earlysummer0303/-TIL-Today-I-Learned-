
import Foundation
// 상속의 한계점 및 단점

// 하나의 클래스는 한개의 클래스만 상속 할 수 있다 (오직 하나의 부모클래스, 다중상속 금지)
// 자식클래스는 본적인 상위클래스의 메모리 구조를 그대로 따라가기 때문에, 굳이 필요하지 않은 속성이나 매서드까지 상속한다.
// 상속은 클래스(래퍼런스 타입) 에서만 가능하다.

// 따라서 이러한 점들을 해소할 수 있는 새로운 패러다임인 '프로토콜'이 도입됨.


// 프로토콜

// 프로토콜은, 해당 프로토콜이 요구하는 요구사항을 충족하는 타입에 대해, 프로토콜을 채택해, 해당 요구사항의 기능을 사용 가능하다.


// 프로토콜 만들기

protocol SomeProtocol { // 매서드, 혹은 속성의 형태로 요구사항을 정의
    var num: Int {get} // let 저장속성에 대한 표현, get 키워드만 포함
    func doThis() // 함수 내부의 구현은 프로토콜 안에서 하지 않고, 함수를 표기만 해주며, 프로토콜을 채택한 타입 내에서 직접 구현한다.
}


// 단, 프로토콜의 확장 (extension)에서 구체적인 구현 내용의 정의도 가능하다.

// 프로토콜을 '채택' 하는 타입의 구현

struct ThisStruct: SomeProtocol { // 프로토콜의 채택
    var num: Int = 0 // 프로토콜을 채택한 타입은, 내부에서 요구사항의 함수를 구현해야 한다. 프로토콜을 채택하고, 요구사항을 구현하지 않으면 에러발생
    func doThis(){
        print("안녕 안녕")
    }
}


// 다른 클래스를 상속하는 클래스에서의 프로토콜 채택

class A {
    var a: Int = 0
}

class B: A, SomeProtocol { // 다른 클래스를 상속하는 클래스가 프로토콜을 채택할땐, 상속하는 클래스 명을 먼저 적어주고, 그 다음 채택할 프로토콜(들)을 ,로 나열한다.
    var b: Int = 0
    var num: Int = 0 // 프로토콜 요구사항 충족 - 1
    func doThis(){ // 프로토콜 요구사항 충족 - 2
        print("클래스의 프로토콜 채택")
    }
}


// 프로토콜은 하나의 타입처럼 사용 가능하다.
// 클래스처럼, 해당 프로토콜을 채택한 클래스 / 구조체 / 열거체는 해당 프로토콜 타입이다.

let someProtocolList : [SomeProtocol] = [ThisStruct(), B()]


// 프로토콜을 채택하기 위해 구현해야 함수 (= 요구사항)의 리턴타입이 있는 경우

protocol AnotherProtocol {
    func newFunc(a: Int)-> Int
}

struct AnotherStruct: AnotherProtocol{
    var c: Int
    func newFunc(a: Int) -> Int {
        return a+3
    }
}

// 프로토콜의 '요구사항'

// -> 프로토콜을 채택하려는 클래스, 구조체, 열거형 내부에서, 필수적으로 구현해야 하는 내용의 형식을 선언하는 부분

// 프로토콜의 요구사항의 종류
/*=====================================================================================
 - 1. 속성 요구사항
 - 2. 메서드 요구사항 (메서드 / 생성자 / 서브스크립트)
======================================================================================*/

// 1. 속성 요구사항 정의하기
/*
 - ⭐️ var로 선언하며, let으로 선언 할 수 없음
    - let 저장속성 요구사항을 선언하고 싶은 경우, 프로토콜 내에서 {get} 키워드를 이용해서 선언한다.
    - 단, 실제로 프로토콜을 채택하는 타입에서의 구현은 let 키워드를 사용해서 한다.
 */

protocol RemoteMouse {
    var id: String { get } // let 저장속성 요구사항 선언 / var 저장속성 선언 / 읽기,쓰기 계산속성 요구사항 구현 가능하게 선언
    var name: String { get set } // var 저장속성 / 읽기,쓰기 계산속성 요구사항 구현 가능하게 선언
    static var type: String { get set } // 타입 저장속성 (static)
                                     // or 타입 계산속성 (class) -> 클래스 내에서 class 키워드로 구현 가능
}

/*
 정리
 프로토콜 내부에서 속성 요구사항 정의할 시
 - { get } 으로 정의하면, 실제 구현시 get을 포함하는, get set 형태의 속성도 선언 가능하다.
    -> 즉 var, let 저장속성, 읽기,쓰기 계산속성 모두 구현 가능하다.
 - { get set } 으로 정의하면, 실제 구현시 get과 set의 기능을 모두 포함하는 형태의 속성만이 선언 가능
    -> 따라서, 읽기 만 되는 let 형식으로 구현할 수 없다.
 
 즉, 프로토콜 내부의 요구사항은 '최소한 만족해야할' 조건이라고 보는 것이 타당하다.
 */


struct TV: RemoteMouse {
    let id: String = "465"
    var name: String = "Samsung"
    static var type: String = "텔레비전 리모콘"
}


class SmartPhone: RemoteMouse {
    var id: String {
        return "777"
    }
    var name: String {
        get{
            return "아이폰"
        }
        set{ }
    }
    static var type: String = "스마트폰 리모콘"
}

class TabletPC: RemoteMouse {
    let id: String = "6754"
    var name: String = "iPad"
    class var type: String {
        get{
            return "태블릿용 리모콘"
        }
        set{ } // 클래스에서, 계산 타입 속성을 나타낼 때 static 대신 class 키워드도 사용 가능
               // static 타입 속성은 상속은 가능하나, 재정의가 불가능 하지만, class 타입 속성은 실질적으로 매서드이기 때문에, 하위클래스에서 재정의 가능.
    }
    
    
}

// 2. 메서드 요구사항 정의하기
/*
 - ⭐️ 메서드의 헤드 부분 (input, output)의 형태만을 요구사항으로 정의한다.
 - mutating 키워드 : mutating 메서드를 필요로 하는 구조체가 해당 프로토콜을 채택 가능하도록 허락하는 키워드
    - 참고) 구조체의 메서드가 저장속성을 변경하는 경우, mutating 키워드가 필요하다.
    - 구조체와 마찬가지로, 열거형도 값 타입이기 때문에, case를 바꾸는 메서드 앞에 mutating 키워드 필요.
 - static 키워드 : 타입 메서드로 제한하는 키워드
    - 채택하는 타입 내에서 class 혹은 static 키워드를 사용해 구현한다.
   
 */

// 1) 프로토콜 정의

protocol RandomNumber {
    static func reset() // static, output이 없는 함수
    func random() -> Int // output이 있는 함수
    mutating func doSth() // mutating 함수 // but, 클래스에서 쓰이면 mutating 키워드를 붙일 필요가 없음. (아예 mutating하는 함수로 사용할 필요도 없음.)
}


//2) 채택 및 구현 - class

class Number: RandomNumber {
    static func reset() {
        print("reset")
    }
    
    func random() -> Int {
        return 0
    }
    
    func doSth() {
        print("doSth")
    } // 클래스이기 때문에 mutating 키워드 필요 x
    
    
}

//2) 채택 및 구현 - struct

struct SNumber: RandomNumber {
    
    var sNum: Int = 8
    
    static func reset() {
        print("reset")
    }
    
    func random() -> Int {
        return 0
    }
    
    mutating func doSth() {
        sNum = 7
    }
    
}

// enum 타입의 프로토콜 채택

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case on
    case off
    mutating func toggle(){
        switch self {
        case .on :
            self = .off
        case .off :
            self = .on
        }
    }
}

var s = OnOffSwitch.on
s.toggle()
s


// 3. 매서드 요구사항 - 생성자 요구사항
// 참고) 실제로 프로젝트에서 프로토콜의 요구사항으로 생성자를 사용하는 경우는 드물다.
/*
 [생성자의 요구사항]
 - 1. 클래스는 상속을 고려해야하기 때문에, 요구사항을 구현할 시 생성자 앞에 required를 붙여야 한다.
    - 구조체의 경우, 상속이 필요 없기 때문에 required 키워드를 사용할 필요 없음.
 - 2. final 클래스의 경우, 이후 상속되지 않기 때문에, required 키워드 사용할 필요 없음.
 - 3. 클래스에서는 반드시 지정생성자로 구현할 필요가 없다. (편의생성자로 구현해도 상관 없다!)
 */

protocol Someprotocol {
    init(num: Int) // 생성자 또한 프로토콜의 요구사항이 될 수 있음.
}
// 프로토콜의 요구사항은 '최소한의' 요구사항
// 즉, 지정 생성자로 요구사항을 선언 했지만 -> 편의 생성자로 구현도 가능함.

// 생성자 요구사항의 구현 1 - class

class SomeClass: Someprotocol {
    var num: Int
    required init(num: Int){
        self.num = num
    }
}

// 참고) 하위클래스에서 생성자의 구현을 하지 않을 경우, 상위클래스의 필수 생성자가 자동상속된다.
    // +) 만약 하위클래스에서 다른 생성자를 구현 했을 경우, 필수생성자 (상위클래스와 같은 형식의)도 반드시 구현해주어야 한다.

class SomeChildClass: SomeClass {

}

var someChildClass = SomeClass(num: 7)

final class AnotherClass: Someprotocol {
    var num: Int
    init(num: Int) { // final 클래스에서 생성자 요구사항을 구현할 때는, 이 클래스를 상속할 수 없으므로, required 키워드가 필요 없음.
        self.num = num
    }
}

// 만약 어떤 클래스가 프로토콜도 채택하고, 상속도 받는다고 할때, 프로토콜의 요구사항인 생성자와, 상위클래스의 생성자가 동일한 형태라면?

protocol BProtocol {
    init()
}

class BClass {
    init(){
        
    }
}

// 프로토콜 채택과 상속을 동시에 하는 Class

class CClass: BClass, BProtocol {
    override required init(){
        
    }
}

// 실패 가능 생성자의 요구사항 선언 및 구현
/*
 프로토콜 요구사항 선언시
 - init?()로 선언 -> init!(), init?(), init() 모두 다 구현 가능
 - init()로 선언 ( => 실패 가능성 배제) -> init() 로만 구현 가능
 */

protocol DProtocol {
    init?()
}

class DClass: DProtocol {
    required init(){
        
    }
}

// 4. 서브스크립트의 요구사항
/*
 - get, set 키워드를 통해 읽기 / 쓰기 여부를 설정. (최소한의 요구사항)
 - get 키워드 ==> 최소한 읽기 서브스크립트 구현 / 읽기, 쓰기 모두 구현도 가능
 - get/set 키워드 ==> 반드시 읽기, 쓰기 모두 구현해야한다.
 */

protocol DataList {
    subscript(idx: Int) -> Int { get } // get 혹은 get set으로 구현
}

struct DataStructure: DataList {
    subscript(idx: Int) -> Int {
        get {
            return 0
        }
        set {
            
        }
    }
}

// 관습적으로 사용하는 프로토콜의 채택과 구현

protocol NewProtocol {
    func doSth()
}

class NewClass {
    
}

extension NewClass: NewProtocol {
    func doSth() {
        print("hehehe")
    }
}// 깔끔한 코드를 위해, 주로 관습적으로 extension을 사용해 프로토콜을 채택 및 구현하는 것을 권장.

// 타입으로서의 프로토콜

// 프로토콜은 일급 객체 (First Class Citizen)이기 때문에, 타입으로 사용할 수 있다.
// 그렇기 때문에
/*
 - 프로토콜을 변수에 할당 할 수 있다.
 - 함수를 호출할때, 프로토콜을 파라미터로 전달할 수 있다.
 - 함수에서 프로토콜을 반환할 수 있다.
 */

// 명시적으로 프로토콜 타입으로 선언하는 예시

protocol Remote {
    func turnOn()
    func turnOff()
}

class Television: Remote {
    func turnOn() {
        print("TV켜")
    }
    
    func turnOff() {
        print("TV꺼")
    }
    
}

struct SetTopBox: Remote {
    func turnOn() {
        print("셋톱박스 켜")
    }
    
    func turnOff() {
        print("셋톱박스 꺼")
    }
    
    func netflix() {
        print("넷플릭스 켜")
    }
}

let tv: Remote = Television() // 프로토콜을 채택한 타입의 인스턴스를 프로토콜 타입으로 명시적 선언 해줄 수 있음.
tv.turnOff()
tv.turnOn()

let sbox: Remote = SetTopBox()
sbox.turnOn()
sbox.turnOff() // 하지만 프로토콜 타입으로 선언하면, 프로토콜의 요구조건에 해당하는 멤버에만 접근 가능하다.
//sbox.netflix()

(sbox as! SetTopBox).netflix() // 강제 타입캐스팅 하면 비로소 원래 타입의 멤버 접근 가능.


// 그렇다면 프로토콜 타입 취급의 장점은?

// 1. 같은 프로토콜을 채택하는 인스턴스끼리 배열로 묶을 수 있음

let remotes: [Remote] = [tv,sbox]

//1. 같은 프로토콜을 채택하는 인스턴스를 아규먼트로 사용 가능

func useRemote(remote: Remote){
    remote.turnOn()
    remote.turnOff()
    guard let sbox = remote as? SetTopBox else {
        return
    }
    sbox.netflix()
}

useRemote(remote: tv)
useRemote(remote: sbox)


// 프로토콜의 준수성 확인 (with is / as 키워드)

// 1) is 연산자 - 타입 체크 연산자

// 특정 인스턴스가 프로토콜을 채택하고 있는지 확인

tv is Remote
sbox is Remote

// 프로토콜 타입으로 저장된 인스턴스가 특정 타입인지 확인

remotes[0] is Remote
remotes[1] is Remote

// 2) as 연산자 - 타입 체크 연산자

// 업캐스팅 (항상 가능)
let upcastedTV = tv as Remote

// 다운캐스팅
let sbox2: SetTopBox? = remotes[1] as? SetTopBox
sbox2?.netflix() // 다운캐스팅 성공.


// 프로토콜의 상속
/*
 프로토콜끼리도 서로 상속 관계에 놓일 수 있다.
 실제로 코딩을 할 때 잘 활용되는 기능은 아니지만, 애플이 만들어 둔 체계에서는 많이 쓰이고 있다.
 
 - 프로토콜은 '다중 상속' 이 가능하다. => 프로토콜은 그저 여러가지 요구사항의 나열일 뿐이기 때문.
 */


// -> 프로토콜의 다중 상속 예시

protocol RRemote {
    func turnOn()
    func turnOff()
}

protocol AirCon {
    func cool()
    func hot()
}

protocol AirConRemote: RRemote, AirCon { // 프로토콜끼리의 다중상속 구조를 만드는것이 가능함.
    // func turnOn()
    // func turnOff()
    // func cool()
    // func hot()
    func airconMode()
}


// 프로토콜을 Class 전용으로 만드려면? -> AnyObject 프로토콜을 상속하는 프로토콜 만들기.

protocol OneProtocol: AnyObject {
    func onePro()
}

// AnyObject 라는 프로토콜을 상속하는 프로토콜은 클래스에서만 채택할 수 있기 때문에, Struct에서는 상속 불가.

/*
 struct Struu: OneProtocol {
 
 } // => 에러
 */

class OneClass: OneProtocol {
    func onePro() {
        print("onePro onePro")
    }
}

/*
 AnyObject => 어떤 클래스 타입의 인스턴스도 표현 할 수 있는 타입으로, 프로토콜로 형태로 정의된 타입.
 - Any / AnyObjcet 등의 타입은 범용적 타입.
 - AnyObjcet가 프로토콜로 구현되어있기 때문에 범용성을 가질 수 있는 것이고, 다운캐스팅 (as? / as!) 해서 구체적인 실제 타입으로
    사용 가능했던 것임.
 */

// 프로토콜의 합성
// -> & (앰퍼센트) 기호를 활용해서 두개의 프로토콜을 모두 채택하는 타입을 표현 할 수 있다.

protocol Named {
    var name: String {get} // let, var 키워드로 모두 구현 가능
}

protocol Aged {
    var age: Int {get} // let, var 키워드로 모두 구현 가능
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

// 두개의 프로토콜 Named와 Aged를 모두 채택하는 타입의 경우, 당연히 name과 age 속성을 가지고 있다.
// Aged & Named : Aged 프로토콜과 Named 프로토콜을 모두 채택하는 모든 타입을 의미

func wishHappyBirthday (to celebrator: Aged & Named) { // 이때 Aged & Named는 임시적 타입으로 인식.
    print("축하해 \(celebrator.name)야, 이제 \(celebrator.age)살이 되었구나!")
}

let birthDayPerson = Person(name:"지우", age: 25)
wishHappyBirthday(to: birthDayPerson)

// 프로토콜의 선택적 요구사항 구현
// -> 프로토콜의 특정 요구사항만 구현해도 되게끔 하는 것.
// -> 어트리뷰트 키워드 (@) 사용

/* ------- 어트리뷰트 복습 ----------------
 * Attribute 란 : 컴파일러에게 알려주는 특별한 신호로, 다음과 같은 추가적인 정보를 제공
 - 1) 선언에 대한 추가 정보 제공
 - 2) 타입에 대한 추가 정보 제공
 
 * 사용 방법
    - @어트리뷰트이름 ====> (예시) @available
    - @어트리뷰트이름(아규먼트) ====> (예시) @available(iOS *)
 
 * 어트리뷰트 키워드 예시 : @available, @objc @escaping, @IBOutlet, @IBAction 등
 */

// (실제 예시)
// -> 코드가 지나치게 길고 어수선해 보이지 않도록 대부분의 경우, 어트리뷰트 키워드를 적은 후 줄을 바꿔서 나머지 코드를 작성함.

// 선언에 추가 정보를 제공하는 예시
@available(iOS 10.0, macOS 10.12, *)
class SomeType{ // 이 경우, "SomeType" 선언은 iOS 버전 10.0 이상에서만 읽을 수 있다.
    
}


// @objc 키워드를 사용해서, 프로토콜의 선택적인 (구현 해도 되고, 안해도 되고) 멤버를 선언하기
/*
 @objc -> 스위프트로 작성한 코드를 objective-C 코드에서도 사용할 수 있게 해주는 어트리뷰트
 - 프로토콜에서 요구사항 구현시 반드시 강제하는 멤버가 아니라 선택적인 요구사항으로 구현할 때 사용.
 - 프로토콜 앞에는 '@objc' 추가.
 - 선택적 구현으로 지정할 멤버 앞에는 @objc optional 추가
 */

@objc protocol RemoteController {
    @objc optional var isOn: Bool {get} // 해당 프로퍼티를 구현하지 않는 타입의 인스턴스는 isOn이 nil
    func turnOn()
    func turnOff()
    @objc optional func doNetflix()
}
/*
 @objc 키워드를 사용할 때 주의점 ~~~~~~~~~~~~~~~~~~~~~~~~~
 - objective-C는 구조체와 열거형에서 프로토콜의 채택을 지원하지 않음.
 - 따라서 @objc 키워드를 사용하는 프로토콜은 class 에서만 채택이 가능하고, struct나 enum에서는 채택 불가능.
 */

class TelevisionRC: RemoteController {
    var isOn = false // @objc optional이 붙은 멤버는 구현해도 되고 구현하지 않아도 됨.
    func turnOn(){}
    func turnOff(){}
}

let newTV: TelevisionRC = TelevisionRC()
print(newTV.isOn)

let newTV2: RemoteController = TelevisionRC() // RemoteController 타입으로 명시적 선언
//=> 이때 RemoteController 타입은 선택적 구현을 지원하는 프로토콜 이므로, 이 타입의 인스턴스는 특정 멤버를 가지고 있지 않을 수도 있다.
print(newTV2.isOn) // 프로퍼티인 선택적 구현사항의 경우, 해당 멤버가 없으면 nil을 반환한다.
newTV2.doNetflix?() // 하지만 매서드인 선택적 구현사항의 경우, 해당 함수가 아예 없을 수도 있기 때문에 옵셔널 체이닝이 필요.



// 프로토콜의 확장

// 하나의 프로토콜을 다양한 타입에서 채택 후 전부 구현해야 한다는 귀찮음이 존재.

protocol Food {
    func steam()
    func roast()
}

struct Pork: Food {
    func steam() {
        print("돼지고기 찌기")
    }
    func roast() {
        print("돼지고기 굽기")
    }
}

struct Beef: Food {
    func steam() {
        print("소고기 찌기")
    }
    func roast() {
        print("소고기 굽기")
    }
}

// 이러한 불편함을 해결하기 위해 프로토콜의 확장 제공

// 프로토콜의 확장이란? ==> 🌟기본 (디폴트) 구현 내용을 제공하는것.
/*
 "프로토콜이 확장은, 코드의 중복 구현을 피하기 위해 존재한다."
 프로토콜을 채택한 모든 타입들에서 실제 구현을 계속적으로 반복해야하는 불편함을 덜기 위해
 '프로토콜의 확장'을 제공해서 메서드의 디폴트 구현을 제공함.
 */

extension Food { // Food 프로토콜 채택시, 디폴트 구현 내용 제공.
    func steam(){
        print("고기 찌기")
    }
    func roast(){
        print("고기 굽기")
    } // 실제 Food 프로토콜의 요구사항은 steam(), roast() 두개 뿐이었음.
    func boil(){
        print("고기 삶기") // extension을 통해 새롭게 추가된 함수의 구현
    }
    
}


struct Chicken: Food {
    func steam() {
        print("닭고기 찌기")
    }
}

let chicken = Chicken()
chicken.steam() // 닭고기 찌기, 프로토콜 채택한 타입에서 직접 구현한 멤버의 인스턴스는 직접 구현한 대로의 함수를 가짐.
chicken.roast() // 고기 굽기, 직접 구현하지 않은 멤버의 경우, 기본값인 extension의 함수를 가짐.

let friedChicken: Food = Chicken()
friedChicken.boil()

// 이론적인 이야기
/*
 - 프로토콜은 선언시, 요구사항인 메서드에 대해서 메모리의 Data 영역에 목격자 테이블 (Witness Table)을 생성한다. -> 일종의 메서드 테이블, 클래스의 Virtual Table과 유사.
 - 이때 반드시 요구사항인 메서드에 대해서만 목격자 테이블을 생성 (extension을 통해 추가되거나 한 메서드 등은 Withness Table 생성 x)
 => 이 부분에 대해서는 교재 참조.
 */


// 프로토콜의 확장을 통한 다형성 제공 - 프로토콜 지향 프로그래밍
