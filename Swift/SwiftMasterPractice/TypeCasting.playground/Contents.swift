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

