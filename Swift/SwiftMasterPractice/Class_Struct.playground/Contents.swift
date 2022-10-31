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
    var name: String?
    var age: Int
    init(age: Int){
        self.age = age
    }
}

var newOptInstance = OptClass(age: 2)
newOptInstance.name // nil
// 만약 생성자를 통해 value로 초기화 해준다면, Optional(value)이다.

// 생성자 파라미터에 기본 값 주기

class NewClass{
    var name: String
    var age: Int
    init(name: String = "Jiwoo", age: Int ){ // 기본값을 파라미터 옆에 대입해준다.
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




// 프로퍼티와 메서드

// 1) 저장 프로퍼티 : 값이 저장되는 일반적인 프로퍼티
// 값이 저장되는 프로퍼티이기 때문에, 해당 프로퍼티의 데이터타입 만큼의 메모리 공간을 독립적으로 갖는다.

/* 주의점)
 - 각 인스턴스가 공통적으로 가지는, 고유의 데이터 저장공간을 의미.
 - let(상수), var(변수)로 선언 가능 -> let으로 선언한 속성은 값 변경 불가.
 - 반드시 기본값을 가지고 있거나, 생성자 메서드를 통해 값을 반드시 초기화 해야 한다.
 */



// 1-2) 지연 저장 속성

// 지연 저장 속성은 처음부터 메모리 공간을 갖지 않는다.
// 인스턴스를 생성한 뒤, 해당 속성에 접근하는 시점에 메모리 공간을 할당받고, 데이터가 저장되는 것.
// 지연 저장 속성은 반드시 var로 선언하며, 선언시 기본값을 가져야 한다.
// 어차피 인스턴스 생성시에 지연 저장 속성은 메모리 할당이 되지 않기 때문에, 생성자 함수에서 파라미터로 받지 않는다.

struct Cosmetic {
    var name : String // (일반적인) 저장 속성 name
    var number : Int // 저장 속성 number
    lazy var weight :Double = 0.0// 지연 저장 속성 number
    init(name : String, number : Int){
        self.name = name
        self.number = number
    }
}

var cushionFoundation = Cosmetic(name: "Cushion", number: 5) // 인스턴스를 생성할때, 지연저장 속성의 메모리공간은 할당하지 않음
cushionFoundation.weight // 지연 저장 속성에 접근하면 비로소 지연저장속성의 메모리 공간이 할당되고, 데이터가 저장된다. (여기서는 기본값인 0.0로 초기화됨)



// 지연 저장 속성에서 지연(lazy)의 의미
/*
 - 해당 '저장 속성'의 초기화를 지연시키는 것.
 - 즉 인스턴스가 초기화되는 시점에, 해당 속성이 값을 가지고 초기화 되는것이 아닌, 해당 속성에 접근하는 순간, (해당 저장속성만) 개별적으로 초기화 되는것.
 - 이 속성은 반드시 변화를 겪는 속성이므로 (메모리 공간이 없다가 생기는 속성이기 때문에) 반드시 var 로만 선언 가능, (lazy var 만 있고, lazy let은 없음)
 */


// 지연 저장 속성을 사용하는 이유

/*
 1) 메모리공간을 많이 차지하지만, 필수적이지는 않은 데이터를 저장할 때 (ex) 이미지 등)
 - 반드시 메모리에 다 올릴 필요가 없을 경우, 메모리의 낭비를 막기 위해 지연 저장속성으로 선언한다.
 
 2) 다른 속성들을 이용해야 할 때
 - 지연저장속성을 사용하지 않는다면, 초기화 시점에 모든 속성들이 동시에 메모리 공간에 저장됨
 - 따라서, 어떤 한가지 속성이 다른 속성에 접근할 수 없음.
 - 하지만, 지연 저장 속성을 사용하면, 지연저장속성은, 먼저 초기화된 속성에 접근 가능.
 */

class AView {
    var a: Int
    lazy var view = UIImageView() // 1)
    lazy var b : Int = { // 2)
        return a * 10 // 클로져 표현식 -> a*10의 결과값을 리턴하는 함수(클로져)를 변수 b에 할당.
    }()
    init (a: Int){
        self.a = a
    }
}
// b는 a에 의존하는 속성임 -> 메모리 공간에 a가 있어야지 비로소 b 할당 가능한 구조 -> 지연저장속성으로 b를 선언해준다.

var aaview = AView(a: 4)
aaview.b // b의 메모리 할당. -> 4x10 값 저장.



// 메서드의 메모리 구조 -> 교재 참조



// 계산 속성 (Computed Property)
// 항상 다른 저장속성에 의한 결과로 나오는 메서드의 역할을 대신할 수 있는 속성.

// 계산속성 없이 저장속성, 메서드로만 이루어져 있다면?
class NewPerson {
    var birth : Int = 0 // 출생년도
    
    func getAge()->Int{ // Age를 계산해서 return 하는 함수
        return 2021 - birth
    }
    
    func setAge(_ age: Int){ //birth 값을 갱신하는 함수.
        self.birth = 2021 - age
    }
}

var newJiwoo = NewPerson()
newJiwoo.setAge(24)
newJiwoo.getAge()
newJiwoo.birth

// 계산 속성 도입 -> 'age'라는 계산속성을 만들어보자.

class NewNewPerson{
    var birth : Int = 0
    var age : Int { // get-set은 세트!, set은 구현하지 않아도 됨(선택적)
        get{ // getter 라고도 부름 (다른 언어에서)
            // get 안에는 return 형이 존재.
            return 2021 - birth
        }
        set(age){ // setter 라고도 부름.
                // age 값을 할당 받을때, 이를 input으로 다른 변수 값을 조작.
                 //  set 블록의 파라미터의 실질적인 의미는, 해당 인스턴스 속성에 접근하여 새롭게 저장한 값을 의미한다
            self.birth = 2021 - age
        }
    }
}

var p1 = NewNewPerson()
p1.birth = 2000
p1.age // get ~ age 속성의 값을 직접 가져오는 경우 -> 21리턴

p1.age = 20 // set ~ age 속성의 값을 직접 세팅해주는 경우. -> birth 속성값이 바뀜
p1.birth

// 그래서, 계산 속성을 사용하는 이유?
/*
 3. 계산속성의 기능은 메서드로도 구현 가능하지만, 메서드로 구현하기 위해서는 get,set에 대한 함수를 독립적으로 각각 만들어 주어야 한다.
 그래서 실질적인 메서드 기능을 하는 변수인 '계산 속성'을 도입해, 이처럼 관련이 있는 기능들을 하나로 묶어준다\
 
 2. 보다 직관적인 의미 전달을 위해. - 주로 동사로 네이밍 되는 메서드를 사용하는 것 보다. 명확하게 의미 전달을 하기 위해 명사 형태인 속성을 사용.
    ex) getAge라는 이름으로 함수를 만들기 보다, age 라는 이름으로 속성을 만들고, 그 안에 get, set 기능을 만드는 것이 직관적.
 */

// 계산 속성은 항상 값을 재계산 하기 때문에, 반드시 var 키워드로 선언해준다.

// 계산 속성은 겉모습만 속성일뿐, 실제로 메서드이며, 실제 메모리 공간을 가지지 않고, 해당 속성에 접근했을 경우, 그와 연관된 다른 속성에 접근해서 값을 계산하고, 그 결과값을 리턴하거나, 세팅하는 메서드이다.

// 계산속성의 set 파라미터 생략과 newValue

class NewValue{
    var a : Int = 0
    var b : Int{
        get{
            return a+2 // b = a+2
        }
        set{ // 이처럼 set 블록의 파라미터를 생략하고, 스코프 안에서 해당 파라미터를 'newValue' 라는 미리 약속된 파라미터로 쓸 수 있음.
            self.a = newValue - 2
        }
    }
}

// 예제 : 계산속성인 BMI 구현하기
// BMI = Weight / Height*Height * 10000
// 키가 변할수 없다 라는 전제조건 하에 get, set을 모두 가지는 bmi 구현

class Person_2{
    var height : Double = 160.0
    var weight : Double = 60.0
    var bmi : Double{
        get{
            let bmi = weight / height*height * 10000
            return bmi
        }
        set{
            self.weight = newValue * height*height / 10000
        }
    }
}

let p2 = Person_2()
p2.bmi // get
p2.bmi = 24

p2.weight


// 만약 get의 기능만 있는 read - only 계산속성의 경우, get 블럭 생략 가능

class Person_3{
    var height : Double = 160.0
    var weight : Double = 60.0
    var bmi : Double {
            let bmi = weight / height*height * 10000
            return bmi
    }
}



// 타입 속성 (Type Property)
// 타입 자체에 속해있는 속성 (-> 모든 인스턴스들이 같은 속성 값을 공유)
// static 키워드를 사용해서 선언


class Cat {
    static var species = "Cat"
    var name : String
    var age : Int
    init(name : String, age:Int){
        self.name = name
        self.age = age
    }
}

let cat1 = Cat(name:"지우", age:4)
Cat.species // 타입 속성은 이런식으로 인스턴스 명이 아닌, 타입 명을 사용해서 접근해주어야 한다.


// 저장 속성과, 계산 속성 모두가 타입 속성이 될 수 있다.

//1) 저장 타입속성

class Circle {
    static let pi : Double = 3.14
    static var count : Int = 0
    var radius : Double
    var diameter : Double {
        get{
            return radius*2
        }
        set{
            self.radius = newValue / 2
        }
    }
    init(radius : Double){
        self.radius = radius
        Circle.count += 1 // 생성자가 실행될때마다 Circle.count가 1씩 증가한다 ~> 같은 타입의 인스턴스들을 전체적으로 관리하는 역할.
    }
}

Circle.pi // -> 3.14

let a = Circle.pi // 저장속성이므로, 다른 변수에 그 값 자체를 저장 가능

Circle(radius: 3.0)
Circle(radius: 4.0) // 이렇게 생성자 두번 호출했다고 할때.
Circle.count // 2로 증가해있음.

// 이처럼 클래스의 인스턴스들을 전체적으로 관리하거나, 공유 자원을 관리할때, 또는 모든 인스턴스들이 사용하는 동일한 값을 표현할때 저장타입속성을 사용하면 좋다!


// 2) 계산 타입속성

class Circle1 {
    static let pi = 3.14
    static var count = 0
    var radius : Double
    static var multiPi: Double { // 계산타입속성, 타입속성이 다른 같은 타입의 타입속성에 접근할때는 앞에 타입 명을 생략할수 있다.
        return pi * 2
    }
   
    init(radius : Double){
        self.radius = radius
        Circle1.count += 1 // 같은 타입속성이 아닌 경우에는, 타입속성에 접근할 때 반드시 맨 앞에 타입 명을 붙여줘야한다.
    }
}


// 타입 속성 정리

/*
 - 클래스, 구조체, 열거형 모두에서 선언 가능하다.
 - let, var 모두 선언 가능하다.
 - 타입 이름으로만 접근 가능하고, 인스턴스 이름으로 접근할 수 없다.
 
 <저장 타입 속성>
 - 일반 저장속성 타입의 경우, 인스턴스를 생성할 때 생성자에서 모든 속성의 초기화를 완료한다.
    그리고, 해당 저장 속성은, 각 인스턴스가 가지는 고유한 값이다.
 - 하지만, 저장 타입속성의 경우, 생성자가 따로 없으며, 타입 자체에 속한 속성이기 때문에, 타입이 선언된 이후 값을 할당할 수 없다. 따라서 항상 기본값을 필요로 하고, 기본값을 생략 불가능하다.
 - 지연속성의 특징을 가진다 ~ 저장타입속성은 속성에 처음으로 접근하는 순간 초기화 되기 때문에, 지연저장속성에 해당하지만, lazy로 선언할 필요는 없다.(참고 : 여러 스레드에서 동시에 엑세스 해도 한번만 초기화되도록 보장된다 (thread - safe))
 */


// 어떤 경우에 타입속성을 사용해야 할까?
/*
 1) 해당 타입의 보편적인 속성을 만들고자 할때 -> 모든 인스턴스가 공유하는 성격에 가까운 속성
 
 2) 상속에서의 재정의(overriding)
    - 저장 타입 속성 -> 상속에서, 하위 클래스의 재정의 불가능
        저장 타입속성은, 한 타입의 고유의 틀이기 때문에 재정의 할 수 없다.
    - 계산 타입 속성 -> 상속에서, 상위클래스의 키워드를 앞에 붙인 경우 재정의 가능
        추후 상속에서 다시 공부 하겠지만, 상위 클래스의 계산타입 속성 선언시 static 키워드 대신 class 키워드를 사용하면 이 속성을
        하위클래스에서 재정의 가능하다.
 */




// 속성 감시자 (Property Observer) -> 속성관찰자 라고 표현하기도 한다.
// 저장 속성이 변하는 순간, 그 변화를 관찰하고 변화 시점에 실행되는 매서드
class Profile {
    var name: String = "이름"
    
    // 저장속성 + willSet 속성감시자
    var statusMessage: String = "기본상태 메세지" {
        willSet(message){
            print("메세지가 \(statusMessage)에서 \(message)로 변경될 예정입니다.")
            print("상태메세지 업데이트 준비")
        }
    }
}

let p = Profile()

p.statusMessage = "행복해" // 원래의 상태메시지가 "기본 상태 메세지" 였는데, 새롭게 "행복해" 로 변경해줌 -> 속성감시자(will)이 실행됨.

// 정리할때 교재 '속성' 부분 '시간의 흐름' 참고하기.
// 속성 감시자에는 두개가 있다
    // willSet 속성 감시자 : 메모리상의 변수에 저장된 값이 변경되기 '전'에 실행된다 -> 값이 바뀔 예정임을 감시한다.
    // didSet 속성 감시자 : 메모리상의 변수에 저장된 값이 변경된 '후'에 실행된다 -> 값이 바뀌었다는 것을 감시한다.
    // 주로 didSet을 많이 쓴다.

class Profile2 {
    var name: String = "이름"
    // 저장속성 + willSet 속성감시자
    var statusMessage: String {
        // 맨 처음 값이 할당될때 실행되는것이 아니라, 새로운 값이 할당될 때 (즉 변화가 발생할 때) 전후로 실행되는것이 속성감시자임.
        willSet(message){
            print("메세지가 \(statusMessage)에서 \(message)로 변경될 예정입니다.")
            print("상태메세지 업데이트 준비")
        }
        didSet(message){
            print("메세지가 \(message)에서 \(statusMessage)로 변경 완료되었습니다.")
            // '이전' 값이 didSet의 파라미터가 되는것임! -> 새로 바뀐 값은, 이미 'statusMessage'에 할당되었기 때문에, statusMessage가 새로운 값.
        }
    }
    init(message: String){
        self.statusMessage = message
    }
}

let profile2 = Profile2(message: "기본상태메세지입니다~")
profile2.statusMessage = "새 상태메세지 입니다~"

// 속성 감시자의 파라미터를 생략하기 (oldValue, newValue 이용)

class Profile3 {
    var name: String = "이름"
    // 저장속성 + willSet 속성감시자
    var statusMessage: String {
        willSet{
            print("메세지가 \(statusMessage)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet{
            print("메세지가 \(oldValue)에서 \(statusMessage)로 변경 완료되었습니다.")
        }
    }
    init(message: String){
        self.statusMessage = message
    }
}

let profile3 = Profile3(message: "처음 메세지")
profile3.statusMessage = "뉴뉴뉴메세지"


//주의점
/*
 속성 감시자를 추가 가능한 경우
 
 -1) 저장 속성 (원래의 경우와 상속한 경우 둘다 가능)
 -2) 계산 속성 (상속해서 재정의 하는 경우에만 가능) -> 단순 매서드 추가
 
 - 계산속성의 경우, 속성 관찰자를 만드는 대신, 계산속성의 set 블록에서 값 변경을 관찰 가능하기 때문에
 재정의(상속)이 아닌, 본래의 계산 속성에는 추가할 수 없다. (본래의 계산속성의 set 블록이 속성관찰자와 유사한 역할을 한다)
 - let(상수) 속성에는 당연히 추가될 수 없다 (값이 변할 가능성 자체가 없기 때문)
 - 지연저장속성에는 추가할 수 없다.
 
 */


// (참고만)~ 속성감시자의 동작의 매커니즘 (애플이 내부적으로 속성 감시자를 구현했겠져?)

var x = 0

func willSetting(newValue: Int) {
    print(newValue)
}
func didSetting(oldValue: Int) {
    print(oldValue)
}
func setX(newX: Int) {
    willSetting(newValue: newX)
    x = newX
    didSetting(oldValue: newX)
}

setX(newX: 2)


// 메서드

// 인스턴스 메서드
/*
 - 메서드이기 때문에 메모리공간이 할당되어있지 않음
 - 메서드 접근시, 인스턴스 이름으로 접근해야함.
 - 메서드 실행시, 스택프레임을 만들고, 인스턴스의 데이터를 사용. 메서드 종료시 스택프레임이 사라짐.
 */
// 클래스의 인스턴스 메서드
class CCat {
    var name: String
    var age: Int
    func changeName(newName: String){
        self.name = newName
    }
    func printName(){
        print(self.name)
    }
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

var cat11 = CCat(name: "Cat1", age: 2)
cat11.changeName(newName: "냐옹이")
cat11.printName()

// 구조체의 인스턴스 메서드

// ⭐️ 값타입(구조체, 열거형)의 인스턴스 메서드 내에서 자신의 속성값 수정은 원칙적으로 불가능
// 따라서, 자신의 속성 값을 수정하는 함수를 선얼할때는 mutating 키워드를 붙여줌
// 이유 - 클래스는 heap 영역에 인스턴스를 저장, 구조체는 stack 영역에 인스턴스 저장, stack 영역에 저장되는 데이터는 함수로 변경할 수 없다.
struct Rabbit {
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    mutating func changeName(newName: String){
        self.name = newName
    }
}

var newRabbit = Rabbit(name: "Judy", age: 24)
newRabbit.changeName(newName: "July")

// 오버로딩 ~ 각 클래스 / 구조체 / 열거형 내의 메서드들의 오버로딩 지원

class Legs {
    var number : Int = 4
    func printNumber(){
        print(number)
    }
    func printNumber(_ newNum: Int){
        print(newNum)
        number = newNum
    }
}

var newLeg = Legs()
newLeg.number = 7
newLeg.printNumber()
newLeg.printNumber(4)


// 타입매서드
/*
 타입 자체의 성격에 가까운 매서드
 */

class Pig{
    var name: String
    var age: Int
    static var species = "Pig"
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    static func remindMe(){
        print("종은 항상 \(species) 입니다.")
    }
}

Pig.remindMe()

// 실제 타입 매서드 예시
Int.random(in: 1...100)
Double.random(in: 1.0...10.0)


// 클래스 - 타입 메서드의 상속

// 타입매서드를 상속할때, 재정의(overriding)가능하게 하려면 해당 매서드의 func 키워드 앞에 static 키워드가 아닌 class 키워드를 적어줘야한다.
// 이때의 class 키워드는 '상속시 재정의 가능'의 의미



// 서브스크립트 (Subscirpts)
// 대괄호로 구현된, 특별한 형태의 매서드 호출 문법
// -> 따라서 메서드를 직접 구현하는것도 가능하다.
// ex) 배열에서 -> 대괄호 안에 인덱스 값을 넣으면, 해당 인덱스에 해당하는 배열 요소에 접근 가능.
// 딕셔너리에서 => 대괄호 안에 키 값을 넣으면 해당 키값에 해당하는 딕셔너리의 밸류에 접근 가능


var array = ["Jiwoo", "Jeongin", "Seohyeon"]
array[0]
array[1]

// 이렇게 사용할 수 있는것은, 내부적으로 대괄호(서브스크립트)를 사용하면, 어떤 값을 리턴하도록 구현되어있어서 가능

// 인스턴스 매서드로써의 서브스크립트 구현

// 클래스 내에서 직접 서브스크립트를 구현하면, 인스턴스 생성시 인스턴스[서브스크립트의 파라미터]로 접근 가능.
// 서브스크립트 선언시 func 대신 subscript 키워드 사용

class SomeData {
    var datas = ["Jiwoo", "Jeongin", "Seohyeon"]
    
    subscript(index: Int) -> String {
        get{
            return datas[index]
        }
        set{
            datas[index] = newValue
        }
    }
}

var aData = SomeData()
aData[0]
aData[1] = "BlackBean"
aData[1]

struct Matrix {
    var data = [["1","2","3"],["4","5","6"],["7","8","9"]]
    subscript(row: Int, column: Int)->String?{
        guard row < 3 || column < 3 else {
            return nil
        }
        return data[row][column]
    }
}

var mat = Matrix()
mat[0,1]


// 타입 서브스크립트

enum Planet : Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int)-> Planet{
        return Planet(rawValue: n)!
    }
}

let venus = Planet[2] // Planet.venus 대신 사용할 수 있는 방법


//참고) Int/String 등의 타입 이해

// 이런 기본 타입들은 구조체로 구현되어있음

/*
 struct Int {
    static func random(in range: Range<Int>)->Int{
    ~~~~~~
 }
 */


// 접근제어 (Access Control)

// private 키워드 사용 -> 인스턴스 외부에서 이 속성에 접근할 수 없음
// 외부에서 private로 선언된 속성 / 매서드에 접근 불가하므로, 코드 내부의 세부 구현 내용을 숨기는것이 가능하다
// 접근제어가 필요한 경우
/*
 - 애플이 자신이 원하는 코드를 감추는데 사용했음
 - 코드의 영역을 분리시켜, 효율적으로 관리 가능 (계층화)
 - 컴파일 시간이 줄어들게 할 수 있다 (컴파일러가 해당)
 */
class SomeClass{
    private var name = "이름"
    
    func nameChange(name: String){
        self.name = name
    }
}

var s = SomeClass()
// s.name ->접근 불가
s.nameChange(name: "지우")



// 싱글톤패턴 (Singleton Pattern)
// 메모리상에 유일하게 1개만 존재하는 객체를 설계하는 방식

// 싱글톤 패턴이 왜 필요한가?

/*
 - 앱 구현시, 유일하게 단 한개만 존재하는 객체가 필요한 경우가 생기는데, 이럴때 싱글톤 패턴을 사용
 - 즉 특정하고, 유일한 데이터 객체가 필요한 경우
 - 이 객체는 한번 생성된 이후에는 앱이 종료될때까지 유일한 객체로 메모리에 상주한다.
 */


class Singletone {
    static let shared = Singletone() // 자기 자신의 객체를 생성해 타입 변수에 할당. -> 참조타입이므로, 이 shared 변수는 Singletone 객체의 힙 영역 주소를 가짐.
    var userInfoId = 12345
}

// 이렇게 싱글톤 패턴의 클래스를 선언하고,

Singletone.shared // shared 속성 (shared 객체)에 접근하는 순간, lazy하게 동작해 메모리 영역에 올라감.

let object = Singletone.shared
object.userInfoId = 12346

Singletone.shared.userInfoId // 12346로 값 변경(힙 영역에 있는 유일한 객체의 userInfoId 값이 변경되는것이다.)

let newObject = Singletone.shared // Singletone.shared 객체를 가리키는 새로운 변수
newObject.userInfoId // 12346


// 싱글톤 패턴의 실제 사용 예시 (실제 프레임워크들에서 사용하는 싱글톤 패턴)

let screen = UIScreen.main // 화면 관련
let userDefaults = UserDefaults.standard // 유저 객체 관련
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default


// 싱글톤패턴 정리
/*
 - 클래스 내에서, static let 변수명 = 생성자() 로 생성, 즉 자기 자신을 초기화 해 static let 변수에 할당 (싱글톤 객체의 메모리 주소를 담고있는 변수, let이기 때문에 '메모리 주소' 값이 바뀔수 없다는 의미. )
 - 한번 생성되면 앱이 종료될때까지, 단 한개의 객체가 같은 메모리 공간에 상주
 - 만약 외부에서 또다른 새로운 해당 클래스 객체의 생성을 금지하고싶다면, 기본생성자를 private init 키워드로 선언.
 */
