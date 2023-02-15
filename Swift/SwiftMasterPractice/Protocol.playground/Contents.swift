// 상속의 한계점 및 단점

// 하나의 클래스는 한개의 클래스만 상속 할 수 있다 (오직 하나의 부모클래스, 다중상속 금지)
// 자식클래스는 본적인 상위클래스의 메모리 구조를 그대로 따라가기 때문에, 굳이 필요하지 않은 속성이나 매서드까지 상속한다.
// 상속은 클래스(래퍼런스 타입) 에서만 가능하다.

// 따라서 이러한 점들을 해소할 수 있는 새로운 패러다임인 '프로토콜'이 도입됨.


// 프로토콜

// 프로토콜은, 해당 프로토콜이 요구하는 요구사항을 충족하는 타입에 대해, 프로토콜을 채택해, 해당 요구사항의 기능을 사용 가능하다.


// 프로토콜 만들기

protocol SomeProtocol { // 매서드, 혹은 속성의 형태로 요구사항을 정의
    var num: Int {get}
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
               // static 타입 속성은 상속은 가능하나, 재정의가 불가능 하지만, class 타입 속성은 실질적으로 매서드 이기 때문에, 하위클래스에서 재정의 가능.
    }
    
    
}

// 1. 속성 요구사항 정의하기
/*
 - ⭐️ var로 선언하며, let으로 선언 할 수 없음
    - let 저장속성 요구사항을 선언하고 싶은 경우, 프로토콜 내에서 {get} 키워드를 이용해서 선언한다.
    - 단, 실제로 프로토콜을 채택하는 타입에서의 구현은 let 키워드를 사용해서 한다.
 */
