
import Foundation
//클래스 라는 타입에만 상속이라는 개념이 있음.
// 상속이란
//-> 본질적으로, 성격이 비슷한 다른 클래스 (자식클래스)을 하나 더 만들어 저장속성을 추가하거나 매서드를 변형시켜 사용하기 위해, 클래스(부모클래스)의 속성과 매서드를 자식클래스에게 그대로 물려주는 방식.

// 기본적인 형태의 상속 (저장 속성을 추가하는 형태)
// 자식클래스는 상속받은 저장 속성의 '주소'를 가진다. -> 교재 클래스 상속과 재정의 '메모리의 구조' 참고.

class Person {
    var name: String = "지우"
    var age: Int = 25
}

class Student : Person {
    var grade: Int = 0
}

class CollegeStudent : Student {
    var major: String = "Robotics"
}

let swimmer = CollegeStudent()
swimmer.name
swimmer.age

// Base Class(베이스 클래스) -> 아무 클래스도 상속하지 않은, 상속 구조의 가장 최상단에 있는 클래스

// Swift 에서의 '상속의 방향'
// (주교재 '클래스의 상속' ~ 상속의 방향 참고)
// -> 스위프트에서는 다중 상속(한 클래스가 여러개의 부모 클래스를 상속받는것) 불가능

// 상속 금지 키워드 final
// 해당 클래스를 상속할 수 없게 (해당 클래스가 자식 클래스를 만들 수 없게)함

final class StudentResearcher : CollegeStudent {
    var labatory: String = "Intelligent Robot Lab"
}

/*
에러 - 파이널 클래스는 상속 불가
class goodResearcher : StudentResearcher {
    var blahblah: Int = 0
}
*/


// 상속에서의 재정의
// 상위클래스로부터 상속받은 맴버를 변형, 즉 자식 클래스 내에서 다시 정의하는 것
// override 키워드를 사용해서 재정의한다.
// 단, 저장속성은 재정의할 수 없다. -> 계산속성, 메서드만 재정의 가능
// final 클래스를 class 앞이 아니라, 클래스 멤버 앞에 붙인 경우에는, 그 멤버의 재정의가 불가능하게 한다.

class A {
    var name: String = "지우"
    final var introduction : String { // 계산속성
            return "제 이름은" + self.name + "입니다."
    }
}

class B : A {
    var age: Int = 0
    /* -> introduction이 final 키워드가 붙은 멤버라서, 이런식으로 자식클래스에서 재정의가 불가능하다
    override var introduction : String {
        return "제 이름은" + self.name + "입니다. 나이는 \(age)살"
    }
     */
}

// UIKit에서의 상속 구조
// UIKit -> 화면 UI 구성과 관련된 CocoaTouch 프레임워크
// UIKit은 여러 클래스들의 복잡한 상속 구조로 이루어져있음.
// 참고 ) UIKit Hierarchy




// 재정의 (Overriding)

// Overloading VS Overriding

/*
 - 오버로딩 = '과적' : 하나의 함수명에 여러개의 함수를 대응시켜서 사용하는것.
 - 오버라이딩 = '재정의' : 상속을 통해 상위 클래스의 속성(계산속성) / 매서드 (일반 매서드, 서브스크립트, 생성자)를 재정의하는것 -> 속성과 매서드의 재정의 방식은 다름!
 */

// 만약 재정의를 했지만, 해당 멤버의 상위클래스 버전을 사용은 하고싶다면 -> super 키워드 사용

class P {
    func printSth(){
        print("1")
    }
}

class C : P {
    override func printSth(){
        super.printSth() // 상위 클래스 호출을 통해 상위 클래스 버전의 매서드 사용.
        print("2")
    }
}

let c = C()
c.printSth()


/* 속성, 메서드의 재정의
-> 교재 클래스 상속과 재정의 참고
 */



// 속성의 재정의 정리

/**===============================================================================================
 - (타입/인스턴스 속성을 구분해서 생각해야 하지만, 실질적으로 타입 속성을 재정의 하는 것은 드문 일이므로 배제하고 생각하면 됨)


 - (1) 저장 속성의 재정의
 - 원칙적으로 불가능(고유의 메모리 공간은 유지 해야함)
 -  ==> 저장 속성은 고유의 메모리 공간이 있으므로 하위클래스에서 고유의 메모리 공간을 바꾸는 방식으로의 재정의는 불가능

 - (메서드 형태로 추가하는 방식의 재정의는 가능)
 -  ==> 읽기/쓰기 가능한 계산속성으로 재정의 가능(메서드) (읽기만 가능한 계산 속성으로 정의 불가능 - 기능 축소는 불가능 X)
 -  ==> 속성 감시자를 추가는 가능(메서드) (실질적 단순 메서드를 추가해서 저장 속성이 변하는 시점을 관찰할뿐)


 - (2) 계산 속성(메서드)의 재정의
 - (실질적인 메서드이기 때문에 메서드 형태로의 재정의만 가능. 기능의 범위를 축소하는 형태로의 재정의는 불가능)
 
 - (상위)읽기전용 계산 속성을 ===> (하위)읽기/쓰기가 가능한 가능한 속성으로 재정의 가능(확장 O)
 -                      ===> 속성 감시자를 추가하는 재정의는 불가능 (읽기 전용 속성을 관찰 할 수 없음 - 논리에 안 맞음)
 - (상위)읽기/쓰기 계산 속성을 ===> (하위)읽기만 가능한 가능한 속성으로만 재정의 불가능(기능 제한 X)
 -                      ===> 속성 감시자를 추가하는 재정의 가능 (관찰은 가능)

   ===================================
   - 읽기 메서드 ===> 읽기 메서드
   - 쓰기 메서드 ===>    x      (불가능)

   - 읽기 메서드 ===> 읽기 메서드
   -    x     ===> 쓰기 메서드  (가능)   // 확장은 가능
   ===================================


 - ⭐️ 인스턴스 속성의 대원칙
 - 1) 저장 속성 재정의는 원칙적으로 불가능(하위 속성에서 상위 속성의 고유의 메모리 공간을 변형 불가).
      메서드 방식(계산 속성으로의 재정의 가능)으로 추가는 가능
 - 2) 계산 속성의 유지/확장은 가능, 축소는 불가능
 - 3) 속성 감시자(메서드)를 추가하는 재정의는 언제나 가능(실질적 단순 메서드 추가)
      (다만, 읽기전용 계산 속성을 관찰하는 것은 의미 없으므로 불가능)


 - (실질적으로 드뭄)
 - 타입 속성의 재정의 원칙
 - 1) 타입 저장 속성은 재정의 불가 - static키워드 (계산속성으로 재정의하거나, 속성 감시자를 추가하는 것도 불가능)
 - 2) 타입 계산 속성 - class 키워드인 경우 계산 속성 재정의 (확장방식) 가능.
 - 3) 재정의한 타입 저장/계산 속성에는 감시자 추가 원칙적으로 불가
===============================================================================================**/

// 1) 상위클래스의 저장속성을 하위클래스의 계산 속성 형태로 재정의하기

class Food {
    var color: String = "Yellow"
    var isSpicy: Bool = false
    var number: Int {
        get{
            switch self.size {
            case "S" :
                return 1
            case "M" :
                return 2
            case "L" :
                return 3
            default:
                return 0
            }
        }
        set{
            switch newValue {
            case 1 :
                self.size = "S"
            case 2 :
                self.size = "M"
            case 3 :
                self.size = "L"
            default:
                self.size = "X"
            }
        }
    }
    var size: String = "S" // L,M,S
}

class KoreanFood: Food {
    override var color: String { // read-only (get 만 있는 형태)로 구현불가. (기능 축소는 불가능.)
        get{
            return super.color
        }
        set{
            super.color = newValue
            if newValue == "Red"{
                super.isSpicy = true
            }
        }
    }
}

var kimchi = KoreanFood()
kimchi.color = "Red"
kimchi.isSpicy

// 2) 상위클래스의 저장속성을 하위클래스에서 속성 감시자 추가하기.

class WesternFood: Food {
    override var color: String{
        willSet{
            print("color가 \(super.color)에서 \(newValue)로 변경될 예정")
        }
        didSet{
            print("color가 \(oldValue)에서 \(super.color)로 변경되었습니다.")
        }
    }
}

var pasta = WesternFood()
pasta.color = "brown" // 속성 감시자에 의한 동작 실행.


// 3) 상위클래스의 계산속성을 하위클래스에서 속성 감시자 추가하기.

class ChineseFood: Food {
    override var number: Int {
        didSet{
            print("number가 \(oldValue)에서 \(super.number)로 변경되었다.")
        }
    }
}

var mara = ChineseFood()
mara.size = "L" // number -> 3으로 변경.
mara.number
mara.number = 2 // 속성 감시자 실행. size->"M"으로 변경.
mara.size
// 토막상식 - 기본적으로, 계산 속성은 새로운 값이 set 되었을때, 그 변화가 감지되기 때문에, 계산속성에 속성 감시자를 추가할 수 없지만, 특이하게 상속 과정에서는 속성감시자를 추가하는 방식의 재정의가 가능하다.


// 메서드의 재정의

/*
 속성에 비해, 메서드의 재정의는 자유로운 편이다.(서브스크립트도 자유롭게 재정의 가능하다. 다만, 생성자의 재정의는 메모리 생성 규칙이 따로 존재하기 때문에 별도의 방식을 따름)
 
 - 상위 클래스의 인스턴스 매서드 또는 타입 매서드 상관 없이 기능을 추가 혹은 상위 기능을 무시하고 새롭게 구현하는 것이 가능하다. (즉, 매서드의 이름만 같고, 완전히 새로운 기능을 작성하는것도 가능하다.)
 - super 키워드를 사용해, 상위 구현의 기능을 먼저 실행하고 - 새로운 기능을 추가하는 것도 가능하다.
 */

// 일반적인 매서드의 재정의
class Snack {
    func myName(){
        print("this is Snack")
    }
}

class Pepero :Snack {
    override func myName(){
        super.myName()
        print("this is Pepero")
        super.myName() // 이처럼, 상위클래스의 매서드 호출은 하위 클래스에서 재정의 되는 내용의 앞 뒤 어디에서든 가능하다.
    }
}

var almondPepero = Pepero()
almondPepero.myName()

// 참고 ) subscript의 재정의

class Vehicle {
    var datas = [1,2,3,4,5]
    subscript(index: Int)->Int {
        get {
            guard index < 5 else {return 0}
            return datas[index]
        }
        set {
            self.datas[index] = newValue
        }
    }
}

class Bicycle: Vehicle {
    override subscript(index: Int) -> Int {
        get{
            guard index < 5 else {return 999} // 코드 내용 변경
            return super[index] // 상위에서 구현된 서브스크립트 값을 그대로 리턴
        }
        set {
            super[index] = newValue // 상위에서 구현된 서브스크립트 값을 사용하면, 자동으로 datas 값도 변경되므로.
        }
    }
}



// 초기화(Initialization) 과정과 생성자


