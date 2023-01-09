import UIKit

// is 연산자, as 연산자

//is 연산자 - 타입에 대한 검사를 수행하는 연산자
/*
 - 인스턴스 is 타입 형태 (이항 연산자.)
  --> 참이면 true 리턴
  --> 거짓이면 false 리턴
 
 - 상속관계의 계층에서 포함관계를 생각하면 쉽다.
 */

// 상위 클래스 타입은, 하위 클래스 타입을 포함하지만, 반대로 하위 클래스 타입은 상위 클래스 타입을 포함하지 않는다.

class Person{
    var name: String = "Jiwoo"
    var age: Int = 24
}

class Student: Person {
    var studentid = 185993
}

class Undergraduate: Student {
    var grade = 4
}

// 각 계층의 인스턴스 생성
var person1 = Person()
var student1 = Student()
var undergraduate1 = Undergraduate()

// is연산자의 사용을 통한 검증
// Person이 Student와 Undergraduate를 포괄하는 관계이기 때문에, Person 객체가 항상 Student 타입 혹은 Undergraduate 타입 인 것은 아니다.
// 메모리 구조를 통해 살펴 보자면, Person 타입은 Student 타입과 Undergraduate 타입의 모든 저장속성을 가지지 않는다!


person1 is Person // true
person1 is Student // false
person1 is Undergraduate // false

// 반면, Student와 Undergraduate는 Person의 하위클래스 이므로 항상 Person 타입에 속한다.
// 메모리 구조를 통해 살펴 보자면, Student 타입과 Undergraduate 타입은 둘 다 Person 타입의 저장속성을 가지기 때문!
person1 is Person // true
student1 is Person // true
undergraduate1 is Person // true



// 예제를 통해 이해하기
var person2 = Person()
var student2 = Student()
var undergraduate2 = Undergraduate()

let people = [person1, person2, student1, student2, undergraduate1, undergraduate2]

// Student 인스턴스의 갯수를 세는 코드
var num = 0
for someone in people {
    if someone is Student {
        num += 1
    }
}
print(num)


// 타입캐스팅 = 클래스 계층 상의 타입을 변환 하는것.

// as 연산자 - 클래스 계층 상의 타입을 변환하는 연산자. (type cast operator)

/*
 1) 업캐스팅 : 하위 클래스를 상위 클래스 타입으로 변환하는것
 - ⭐️하위 클래스는 상위 클래스의 저장속성을 모두 가지기 때문에, 항상 타입캐스팅에 성공한다. => as 키워드 사용
 - 하위 클래스를, 상위 클래스의 메모리구조로 인식함.
 
 2) 다운캐스팅 : 상위 클래스를 하위 클래스 타입으로 변환하는것
 - ⭐️상위 클래스가 하위클래스의 저장 속성을 모두 가지는 것이 아니기 때문에, 타입 캐스팅의 실패 가능성을 가진다 => as? / as! 키워드 사용
 
    <as? 키워드 사용시>
    - 타입 캐스팅 성공시 => Optional 타입으로 해당 타입을 리턴한다.
    - 타입 캐스팅 실패시 => nil을 리턴한다.
    
    <as! 키워드 사용시>
    - 타입 캐스팅 성공시 => Optional 타입을 강재언래핑한 타입을 리턴한다.
    - 타입 캐스팅 실패시 => 런타임 오류 발생
 */


// 다운캐스팅 예제 => as? / as!

let perstudent : Person = Undergraduate() // 타입을 'Person'으로 명시적으로 선언하여, Person 타입이지만, Undergraduate 타입의 속성 메모리공간도 할당됨.

perstudent.name
perstudent.age
// perstudent.grade => 명시적 타입 선언으로 인해, Undergraduate 타입의 속성에는 접근 불가

// Person타입으로 선언된 perstudent를 Undergraduate 타입으로 다운캐스팅 해보자!

if let pperstudent = perstudent as? Undergraduate { // 옵셔널 바인딩을 통해, 옵셔널 값인 perstudent as? Undergraduate 값 추출
    pperstudent.grade // 타입캐스팅 성공시 Undergraduate의 저장속성 접근 가능
    pperstudent.studentid
}

let ppperstudent = perstudent as! Undergraduate // perstudent의 경우, 선언 당시부터 Undergraduate 저장속성의 메모리 공간을 갖고 있는 특수한 상황이므로, 강제 언래핑시에도 에러가 발생하지 않는다.
ppperstudent.grade
ppperstudent.studentid


// 업캐스팅 예제 => as

let u2s = Undergraduate()

let newu2s = u2s as Student
newu2s.studentid
newu2s.name
newu2s.age // 업캐스팅은 항상 성공하며, 상위클래스 타입으로 변환되어, 상위 클래스의 저장속성에만 접근 가능해짐.


// 참고 : Swift타입과 Objective-C 타입간의 호환
// iOS 관련 프레임워크 (Foundation)의 경우, 처음에는 모두 Object-C 언어로 개발되었기때문에, Swift와 Object-C를 완전히 분리시켜 생각 할 수 없다.
// 예를 들어, Swift의 String 타입은, Object-C의 NSString 타입과 완전히 상호호환(=Bridging) 가능하도록 내부적으로 설계되어 있기 때문에, as 키워드로 NSString으로 캐스팅 가능하다


// 타입과 다형성(Polymorphism)

// 다형성 (Polymorphism) 이란?
/*
 - 하나의 객체(인스턴스가) 여러가지 타입의 형태로 표현 될 수 있음을 의미 (상속관계로 인해)
 - 하나의 객체가 여러가지 타입의 형태로 저장 될 수 있음을 의미.
 - 또는, 하나의 타입으로 여러 종류의 객체를 해석 할 수 있는 성격을 의미
 
 - 다형성의 구현은 '클래스의 상속', '프로토콜' 등과 깊은 연관이 있음.
 */

class Plant {
    var name: String = "식물 이름"
    func thisIS(){
        print("식물입니다.")
    }
}

class Fruit: Plant {
    var isSweet: Bool = true
    override func thisIS() {
        print("과일입니다.")
    }
}

class Berry: Fruit {
    var color: String = "Red"
    override func thisIS() {
        print("베리입니다.")
    }
}

let plantList: [Plant] = [Plant(), Fruit(), Berry()]

plantList[0].thisIS()
plantList[1].thisIS() // 비록 Plant 타입으로 선언되었으나, Fruit 인스턴스의 매서드가 실행된다.
plantList[2].thisIS()

/*
 위의 사례처럼, 상속관계에서의 다형성은 매서드를 통해서 실행된다.
 ⭐️ 하나의 인스턴스는, 업캐스팅 된 타입으로 인식되고, 호출되더라도 실제 인스턴스 형태(Undergraduate)에 따라 재정의된 메서드가 호출되고 실행된다.
 */


// Any와 AnyObject를 위한 타입캐스팅

/*
 Swift 에서는, 불특정한 타입을 다룰 수 있는 타입을 제공함.
 
 1) Any 타입
 - 기본 타입 (Int, String, Bool, ...)을 포함하여, 커스텀 클래스, 구조체, 열거형, 함수타입 등등 어떠한 타입의 인스턴스도 표현 가능한 타입 (옵셔널 타입도 포함한다.)
 
 2) AnyObject 타입
 - 어떠한 '클래스' 타입 (객체, Object)의 인스턴스 도 표현 할 수 있는 타입.
 */


// 보통 변수를 묵시적으로 선언 할 경우에는, 선언 당시 할당된 값의 타입으로 해당 변수가 고정된다.

var some1 = "Swift" // 묵시적 선언 => some1은 String 타입.
//some1 = 2
//some1 = 6.0 //String 타입이 아닌 값 할당 불가

var some2: Any = "Swift"
some2 = 2
some2 = 3 // Any 타입으로 (명시적)선언 해준 변수에는 어떠한 타입의 값도 들어갈 수 있다.

// Any타입 사용의 단점 -> 저장한 인스턴스의 메모리 구조를 알 수 없기 때문에, Any타입으로 선언된 변수의 값에 해당하는 타입의 고유한 기능을 (메소드, 속성 등) 사용할 수 없다.

some2 = "Jiwoo"
// some2.count  => 실행 불가, Any타입 변수이므로 String 값이 할당되어있다고 한들, String의 고유한 기능을 사용 불가.

// 따라서, 필요할 경우, Any타입 인스턴스는 반드시 타입캐스팅 해서 사용해야한다.

(some2 as! String).count // Any => String 타입캐스팅 할 경우 count 사용 가능해짐.


// AnyObject 타입
// -> 오로지 클래스의 인스턴스 만을 담을 수 있는 변수 (모든 종류의 클래스)

class Cat {
    var sound: String = "Nyang!"
}

class SuperCat {
    var supersound: String = "Nyang! Nyang!"
}

var anyObjectList: [AnyObject] = [Cat(),SuperCat(),NSString()] // 어떠한 종류의 기본 구현된 클래스 + 커스텀 클래스 인스턴스던 할당 가능.

// 객체 타입 고유의 기능을 사용할 때 타입캐스팅 필요

(anyObjectList[0] as! Cat).sound



//⭐️ 타입캐스팅의 분기처리

let anyList: [Any] = [1, "냐하", 0.5, 100, "냥냥", NSString(),Cat()]

// 배열의 enumerated() 함수 사용
/*
 enumerated 함수 => array 데이터를 입력받아, (index,item)으로 구성된 리스트를 반환하는 함수
 */


// 다음처럼 switch문에서 is/as 패턴을 활용해 타입의 분기처리가 가능하다.

for (index, item) in anyList.enumerated(){
    switch item {
    case is Int: // item is Int
        print("index -\(index), \(item)은/는 정수 형태입니다.")
    case is Double: // item is Double
        print("index -\(index), \(item)은/는 소수 형태입니다.")
    case is String:
        print("index -\(index), \(item)은/는 문자열 형태입니다.")
    //타입캐스팅 분기처리
    case let cat as Cat: // let cat = item as? Cat, 이때 case문의 경우 타입캐스팅 성공할 경우에만 아래의 지시문이 수행되기 때문에, as?가 아닌 as 키워드 사용.
        print("index -\(index), \(item)은/는 Cat 형태입니다.")
        print("고양이는 \(cat.sound) 하고 웁니다.")
    default:
        print("index -\(index), \(item)은/는 정수/소수/문자열이 아닙니다.")

    }
}

//옵셔널 값의 Any 변환

/*
 의도적인 옵셔널 값의 사용
 - 의도적으로 옵셔널을 사용하려고 하는데, 컴파일러가 날려주는 경고창을 없애고 싶으면, 옵셔널을 Any로 타입캐스팅 하는 방법이 있다.
 */

let optionalInt : Int? = 3
print(optionalInt) // Expression inplicitly coerced from Int? to Any 라는 경고창 뜬다.
// 터미널창에 그 값을 입력하게 위해, optionalInt 가 Any타입으로 묵시적 형변환 된 케이스.
print(optionalInt as Any) // 경고 알림 없음.
