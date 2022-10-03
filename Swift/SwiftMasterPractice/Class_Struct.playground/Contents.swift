import UIKit


// 클래스와 구조체

// -> 클래스와 구조체는, 스위프트에서 인스턴스(실제로 메모리에 할당되어 구체적인 실체를 갖춘 프로퍼티와 메서드를 가지는 정보 단위)를 생성하기 위한 틀(= 설계도) 역할을 하는 사용자 정의 타입이다.
// 인스턴스를 생성할 수 있는 타입은, 사용자 정의 타입인 총 세가지 타입 (클래스, 구조체, 열거형)이다.
// 스위프트에서는 클래스의 인스턴스 만을 특별히 '객체(Object)' 라고 한다. (구조체, 열거형은 인스턴스라고만 부름)
// 일반적으로 프로퍼티를 먼저 작성하고, 메서드를 그 다음에 작성한다.


// 클래스

// 클래스의 선언

class Dog{
    var name = "강아지"
    var weight = 0.0
}

// 클래스 인스턴스 (객체) 생성

var ssom = Dog() // 기본 생성자 -> 깊게 살펴보면, ssom 이라는 변수에, 새로 할당한 클래스 Dog() 의 메모리 주소를 담는것.
ssom.name = "쏨"
ssom.weight = 3.0

// 구조체

// 구조체의 선언

struct Bird {
    var name = "Bird"
    var wings = 2
}

//
var abird = Bird() // abird 라는 변수에, 실제 구조체 형식의 데이터를 담는것. -> bird 에는 Bird(name : "Bird", wings : 2) 가 담긴다.
abird.name = "참새"


// 클래스와 구조체의 차이
// ⭐️ 가장 큰 차이는 두개의 서로 다른 타입의 인스턴스의 메모리 저장 방식의 차이이다.

/*
1) 구조체 (Struct) -> 해당 인스턴스 자체를 저장하고 있는 메모리 공간(Stack)
 - 값 형식 (Value Type)
 - 인스턴스 데이터를 모두 메모리의 '스택'영역에 저장한다.
 - (복사시) 값을 전달 할 때 마다 복사본을 생성한다. (즉 서로 다른 메모리 공간을 생성한다.)
 - 스택의 공간에 저장되기에, 스택 프레임 종료시 메모리에서 자동 제거된다.
 
 2) 클래스 (Class) -> 해당 인스턴스 자체를 저장하고 있는 메모리공간 (Heap) + 그 메모리공간을 가리키는 변수(Stack)
 - 참조 형식 (Reference Type)
 - 인스턴스 데이터를 메모리의 '힙' 영역에 저장하고, 해당 힙 영역의 주소를 가리키는 변수를 스택에 저장한다
 - (복사시) 값을 전달하는 것이 아니라, 그 값이 저장된 주소를 전달한다.
 - ARC 시스템을 통해 메모리를 관리한다
*/

// 클래스와 구조체의 차이를 잘 확인할 수 있는 예제.

struct Animal {
    var name :String
    var age :Int
}

class Person {
    var name :String
    var age :Int
    init(name : String, age : Int) { // 클래스의 프로퍼티는 반드시 초기화해주어야 한다.
        self.name = name
        self.age = age
    }
}

// 클래스의 값을 복사할때

var aPerson = Person(name: "지우", age: 25) // aPerson에 새로 생성한 객체의 '메모리 주소'를 저장한다.
var bPerson = aPerson // bPerson 에 aPerson 변수에 담긴 데이터 - 즉 '객체 메모리 주소' 를 담는다.

aPerson.name = "외수" // aPerson이 가리키는 객체의 name 속성의 값을 변경한다.
print(bPerson.name) // 외수, aPerson과 bPerson이 가리키는 객체는 동일하므로, 당연히 bPerson이 가리키는 데이터의 name 속성도 변경된 것으로 나타난다.

// 구조체의 값을 복사할때

var aAnimal = Animal(name: "쏨이", age: 8) //aAnimal에 새로 생성한 인스턴스 값 자체를 저장한다.
var bAnimal = aAnimal// bAnimal에 aAnimal 변수에 담긴 데이터 - 즉, 인스턴스 자체가 복사되어, 동일한 값을 갖는 새 데이터가 할당된다.

aAnimal.name = "먹구"// aAnimal 이 가리키는 객체의 name 속성의 값을 변경한다.
print(bAnimal.name) // "쏨이",aAnimal과 bAnimal 변수에 할당된 데이터는 서로 독립적인 값이기 때문에, aAnimal의 값이 변경되었다고 해서, bAnimal 값이 변경되는 것은 아니다.

// 메모리 관점에서 보았을때, 보통 struct가 class 보다 가볍다 라고 간주된다. 왜냐하면 구조체는 데이터를 stack 영역에 쌓아, 함수가 종료되면 데이터가 금방금방 사라지는데 비해, 클래스의 데이터는, 데이터를 장기적으로 보관하는 힙 영역에 저장되기 때문이다.




// 클래스와 구조체의 let과 var 키워드
// 이것도 위 이야기와 마찬가지인 이야기 이지만, 클래스 인스턴스를 담는 변수는, 그 클래스 인스턴스의 주소를 담는 것이기 때문에, let 키워드로 선언하여도, 그 프로퍼티 값을 변경 가능하다.
// -> 참조하는 인스턴스의 프로퍼티 값이 변경된다고 해서, 그 변수가 실제로 담고 있는 값인 '인스턴스의 데이터 주소'가 변경되는 것이 아니기 때문이다.

let cPerson = Person(name: "근훈", age: 25)
cPerson.age = 26 // 에러 나지 않음, 변경 가능
print(cPerson.age)// 26

// 하지만, 구조체 인스턴스를 담는 변수는, 그 구조체 인스턴스값 자체를 담는것이기 때문에, let 키워드로 선언하면, 그 프로퍼티 값을 변경할 수 없다.
// -> let을 사용하면 그 변수가 실제로 담고 있는 값을 변경할수 없게 되는 것이고, 변수가 실제로 담고 있는 값이 인스턴스 값 자체이기 때문이다.
let cAnimal = Animal(name: "모모", age: 6)
// cAnimal.age = 7// 에러, 변경 불가능
print(cAnimal.age)

// 클래스, 구조체 변수를 let으로 선언하는 것의 의미
// -> 클래스 : 다른 인스턴스(객체)를 참조할 수 없다.
// -> 구조체 : 이 변수가 가지고 있는 인스턴스 값을 변경할 수 없다.



// 접문법 / 명시적 멤버 표현식 (Explicit Member Expression)의 정확한 의미

// 인스턴스의 멤버에 접근한다.
// 멤버는 속성, 메서드를 포함한다.
// 점(.)을 찍어서 표현




// 초기화 (클래스 중점적으로)

// 이렇게 모든 프로퍼티에 기본 값을 할당할 경우,
class Student {
    var name = "지우"
    var id = 185993
    var major = "Robotics"
    func greeting() {
        print("안녕하세요,\(major)을 공부하는 \(name) 입니다.")
    }
}

// Student 객체를 찍어낼때마다
var geunhun = Student()
geunhun.name = "근훈" // 그때그때 프로퍼티 값을 일일히 변경해주어야한다.

// String 타입의 데이터 생성을 보면 두가지 방법이 있다.

//1) 먼저 메모리공간을 할당하고 데이터 저장.
var aString : String
aString = "안녕"

//2) 메모리 할당과 동시에 데이터 저장.
var bString : String = "안녕"

// 따라서 String 타입의 예시와 같이, 객체를 생성할때, 위의 Student 클래스의 방식처럼 먼저 메모리 공간을 할당 및 기본값을 대입 하고, 그 후에 새로운 프로퍼티 데이터를 저장(변경) 하지 않고,
// 객체의 메모리 할당과 동시에 데이터 저장이 이루어지게 하기 위해 초기화를 해주는 생성자 가 필요하다.

class Employee {
    var id : Int
    var name : String
    var company : String
    init(id: Int, name: String, company: String){ // 생성자 함수, initializer의 약자.
        self.id = id // self 키워드 -> 클래스 구조체 내에서, 해당 인스턴스 자기 자신을 가리키는 키워드.
        self.name = name
        self.company = company
    }
} // 이렇게 초기화 함수를 넣어서 class를 선언해주면

var milly = Employee(id: 1, name: "Milly", company: "Kakao")
var frog = Employee(id: 2, name: "Frog", company: "Naver")
// 위와 같이 생성자의 파라미터를 사용해서 초기화가 가능하다.


// 초기화 정리
/*
 - 모든 저장속성들은 초기화 해주어야 한다 (구조체, 클래스 둘 다)
 - 생성자 실행 종료시점에는 모든 속성의 초기값이 저장되어 있어야 한다.(초기화가 완료되지 않으면 컴파일 에러)
 - 생성자의 목적은, 결국 저장 프로퍼티의 초기화이다.
 - 생성자는, 인스턴스를 생성하는 특별한 메서드 이다.
 - 인스턴스의 초기화가 완료되면, 메모리에 정상적으로 인스턴스가 생성된다.
 */

// 속성이 옵셔널 타입인 경우
// 클래스의 속성으로 옵셔널 타입을 넣을 수 있다.
// 옵셔널 타입의 속성의 경우, 생성자의 파라미터로 넣어주지 않아도 된다.(반드시 초기값이 있을 필요는 없다.)
// 옵셔널 타입의 속성을 초기화 해주지 않는다면 그 인스턴스 값은 nil 이다.

class OptClass {
    var name : String?
    var age : Int
    init(age:Int){
        self.age = age
    }
}

var newOptInstance = OptClass(age: 2)
newOptInstance.name // nil
// 만약 생성자를 통해 value로 초기화 해준다면, Optional(value)이다.

// 생성자 파라미터에 기본 값 주기

class NewClass{
    var name : String
    var age : Int
    init(name:String = "Jiwoo", age:Int ){ // 기본값을 파라미터 옆에 대입해준다.
        self.name = name
        self.age = age
    }
}

var newClassInstance1 = NewClass(name: "지우", age: 25)
var newClassInstance2 = NewClass(age: 25)

// 이처럼, 생성자 파라미터에 기본 값이 있는 경우, 객체를 생성할 때 기본값이 있는 속성의 값을 input으로 받는 생성자 / 받지 않는 생성자 두개 다 사용할 수 있으며
// 속성값을 받지 않는 생성자의 경우, 기본값이 그 속성으로 저장된다.

//⭐️ 생성자 함수는 오버로딩을 지원함
// -> 다양한 파라미터의 조합으로 한 클래스 내에 여러개의 생성자 구현 가능
// 여러가지 방식으로 인스턴스를 생성하는 방법 제공

// Identy Operators (식별 연산자) - 참조의 비교연산

// 두개의 참조가 같은 인스턴스를 가리키고 있는지 비교하기

print(newClassInstance1 === newClassInstance2) // false
print(newClassInstance1 !== newClassInstance2) // true
