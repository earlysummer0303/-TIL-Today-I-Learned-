import UIKit

// 상속 (수직적 확장) vs 확장(수평적 확장)
/*
 상속
    본질적으로 성격이 비슷한 타입을 새로 만들어
    1)데이터(저장 속성)을 추가하거나,
    2) 기능(매서드)를 변형시켜서 사용하려는 것
 
 확장
    현재 존재하는 타입에 기능(매서드)을 추가하여 사용하는 것 (class / struct / enum 모두 확장 가능)
    (매서드 종류만 추가 가능하며, 추가적인 메모리 공간이 필요한 저장공간을 확장하는것은 불가능 하다.)
    기존 매서드 재정의 불가.
 */

class Cow {
    func cowSays(){
        print("MowMow")
    }
}

let aCow = Cow()

//extension <확장할 타입> 형태로 확장.

extension Cow {
    func cowAlsoSays(){
        print("I am a milk cow")
    }
}

aCow.cowAlsoSays() // 이처럼, 확장이 정의되기 전에 생성된 기존 인스턴스의 경우에도, 새 기능을 사용 가능하다.

// 당연한 얘기지만, extension을 통해 구현된 메서드도 자식클래스에게 상속 된다.

class Person {
    var name = "이름"
    func walk(){
        print("사람이 걷는다.")
    }
}

extension Person {
    func eat(){
        print("사람이 먹는다.")
    }
}

class Student: Person {
    var studentId = 185993
    override func walk(){
        super.walk()
        print("학생이 걷는다.")
    }
}

let aStudent = Student()
aStudent.eat() // aStudent에서 상위클래스의 eat()을 상속받아 사용 가능.


//⭐️ 확장을 통해 구현된 매서드는 상속시 재정의 할 수 없음
/*
 메모리 구조상, 한 클래스에서 정의된 메서드 들은 매서드테이블(배열형태로 각 매서드의 메모리 주소를 담고있는 변수들이 담긴 구조) 형태로 저장되는데,
 extension을 통해 구현된 매서드는 매서드테이블로 들어가는 구조가 아니고, 상속시에는, 매서드테이블에 있는 매서드들만이 재정의가 가능하기 때문에, 확장을 통해 구현된 매서드는 상속시 재정의는 원칙상 불가.
 
 굳이 굳이 재정의를 하고 싶다면 ~ override 키워드 대신, '@objc' 키워드 사용해서 재정의.
 
 @objc => Objective - C 의 약자. Objective-C 는 확장을 통해 구현된 매서드를 재정의 가능하게 구현되어있음.
 */


// 확장의 장점 => 기존에 구현되어 있는 타입에 대한 필요한 매서드를 그때그때 자유롭게 만들 수 있다! (= ⭐️소급 모델링, retroactive modeling)
// 소급 : 지나간 일까지 거슬러 올라가, 미치게 하다. retroactive = retrospective
// 즉, Int, String 등 애플이 미리 구현해 둔 타입에 대한 확장이 가능함을 이용할 수 있다.

// 리마인더) Int는 내부적으로 구조체로 구현되어있다!

extension Int {
    var squared : Int { // 저장속성이 아닌, 계산속성의 경우, 매서드와 동일하기 때문에 확장으로 구현 가능
        return self * self
    }
}

5.squared

/*
 클래스, 구조체, 열거형의 확장 가능한 멤버
 
 ⭐️ 대원칙 : 저장속성은 정의할 수 없다.
 
 -1) (타입) 계산속성, (인스턴스) 계산속성
 -2) (타입) 매서드, 인스턴스 매서드
 -3) 새로운 생성자 (⭐️ 다만, 클래스의 경우 편의생성자만 추가 가능 / 지정생성자 및 소멸자는 반드시 본체에 구현한다.)
    => 지정생성자는 본체에서 인스턴스를 찍어내는 중요 역할을 하므로, 확장에서 구현하지 못한다.
 -4) 서브스크립트
 -5) 새로운 중첩타입 정의 및 사용 (아직 안배움)
 -6) 프로토콜 채택 및 프로토콜 관련 매서드 (아직 안배움)
 
 참고로, 프로토콜에 대한 확장도 가능 (자세한 내용은 프로토콜 관련 내용에서 다룸.)
 */

// 예시 1 - 확장을 이용한, 새로운 타입 계산속성의 정의

extension Double {
    static var retZero : Double {
        return 0.0
    }
    static func printThings(){
        for i in 1...5{
            print(Double(i)+0.0)
        }
    }// 한번에 여러개의 항목 정의 가능.
}

Double.retZero
Double.printThings()

// 예시2 - mutating 인스턴스 매서드의 확장

// 리마인더 ) 구조체 / 열거형 에서, 자신의 속성을 변경하는 매서드는 mutating 키워드가 필요.

extension Int {
    mutating func squared2(){
        self = self * self
    }
    func squared3() -> Int {
        return self * self
    }
}

var someInt = 3
someInt.squared2() // someInt 자체를 mutate 함.
someInt // 9
someInt.squared3() // someInt를 mutate 하는것이 아닌, 제곱값을 리턴하는 함수. (원본 someInt의 값에는 변화가 없다.)
someInt // 9


// 생성자의 확장
/*
 대원칙 => 본체의 지정생성자를 호출하는 방식으로만 생성자의 구현이 가능하다.
 
 [클래스]
 - 확장을 통해, 편의생성자만 추가 가능
 - 지정생성자 추가 불가/ 소멸자 추가 불가 (항상 본래의 클래스에서 정의해야 함)
 
 [구조체]
 - 구조체는 원래 편의생성자가 존재하지 않는다.
 - (클래스 편의생성자와 비슷한 형태의) 새로운 생성자를 추가하여, 본래의 지정 생성자를 호출하는 방법으로만 구현할 수 있다.
    즉, 편의생성자와 같은 역할, 그리고 본체의 생성자를 호출 할 때 까지, self에 접근할 수 없다.
 
 - (구조체 본체) => 생성자를 작성할 경우
 => 기본 생성자 / 멤버와이즈 생성자의 제공이 안됨.
 - 확장을 통해 '본래 지정 생성자를 호출하는' 형태의 생성자만 구현 가능
 
 -(예외) ~ 본체에서 저장속성의 기본값을 제공하고, 지정생성자 정의를 안한 경우
 => 기본 생성자, 멤버와이즈 생성자가 자동 제공.
 - 이런 경우에는 확장을 통해 생성자의 구현이 가능하고, 물론 기본 생성자 및 멤버와이즈 생성자의 호출도 가능하다.
 */


// 클래스 생성자의 확장 예제

let aColor = UIColor(red: 0.2, green: 0.3, blue: 0.6, alpha: 1) // UIColor라는 Class의 지정생성자. 각 파라미터 타입은 CGFloat

//UIColor의 새로운 편의생성자를 구현해보자.

extension UIColor {
    convenience init(_ cgfloat: CGFloat){
        self.init(red: cgfloat/255, green: cgfloat/255, blue: cgfloat/255, alpha: 1 ) // 하나의 인자만 넣으면 임의의 컬러를 객체로 만드는 편의생성자
    }
}

let bColor = UIColor(144.8)


// 구조체 생성자의 확장 예제

// 실수하기 쉬운것!

struct Point {
    var x = 0.0, y = 0.0
    // 생성자 구현 안함 => 멤버와이즈 생성자, 기본생성자 제공됨.
}

/*
extension Point {
    init(x: Double, y: Double){
        self.x = x
        self.y = y
    }
}
*/ //=> 따라서, extension을 통해 멤버와이즈 생성자를 재정의 하려고 하면 에러.

struct Size {
    var width = 0.0, height = 0.0
    init(val: Double){
        self.width = val
        self.height = val
    } // 직접 구조체 본체에 생성자 구현 => 멤버와이즈 생성자, 기본 생성자가 제공되지 않음.
}

extension Size {
    init(){
        self.init(val: 5.0)
    } // 본체의 생성자를 호출하는 방식의 생성자를 extension을 통해 구현 가능.
}

// struct extension 예제 2 => CGRect와 유사한 구조체 만들어보기

struct Rect {
    var origin : Point
    var Size : Size // 특정 포인트를 원점으로, Size 만큼의 Rectangle 찍어냄
}

let aRect = Rect(origin: Point(x: 0.0, y: 2.0), Size: Size())

extension Rect {
    // 원점 기준으로 Rectangle을 생성하는것이 아닌, 특정 포인트를 중점으로 Rectangle을 만드는 생성자
    init(center: Point, size: Size){
        let originX: Double = center.x - (size.width/2) // 중점의 x좌표에서 넓이의 절반을 뺀 것이 원점의 x좌표
        let originY: Double = center.y - (size.height/2) // 중점의 y좌표에서 높이의 절반을 뺀 것이 원점의 x좌표
        self.init(origin: Point(x: originX, y: originY), Size: size)
    }
}

// 확장을 통한 서브스크립트의 구현

// 예제 - Int 타입에 서브스크립트를 추가하여, 해당 정수의 n번째자리(0부터 시작)의 십진수를 반환하도록 만들기.

extension Int {
    func countNums()-> Int {// Int의 각 자리를 구성하는 숫자의 총 개수를 count 하는 함수.
        var num = 0
        var this = self
        while(this != 0) {
            this /= 10
            num += 1
        }
        return num
    }
    subscript(num: Int) -> Int { // num은 해당정수(self)의 10^n승 자리의 수
        var decimalBase = 1 // 시작하는 수는 1의 자리수 (10^0)
        for _ in 0..<num { // 인덱스는 0부터 num-1까지.
            decimalBase *= 10
        }
        return (self/decimalBase) % 10 // 만약 num이 숫자 개수 이상일 경우, 0 반환 (self.decimalBase가 소수형태가 되므로)
    }
}

let num = 12345
let numCount = num.countNums()
for i in 0...numCount - 1 {
    print(num[i])
}
