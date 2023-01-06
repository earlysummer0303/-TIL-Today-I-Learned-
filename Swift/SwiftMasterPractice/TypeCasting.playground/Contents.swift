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

