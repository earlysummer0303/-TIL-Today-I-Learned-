import Foundation

// 초기화와 생성자

/*
 초기화는 클래스, 구조체, 열거형의 인스턴스를 생성하는 과정. 즉 각 저장속성에 대한 초기값을 설정하여 인스턴스를 사용 가능한 상태로 만드는 것.
 (열거형의 경우, 저장속성이 존재하지 않으므로, case 중 한가지를 선택 및 생성하는 과정)
 
 - 결국 생성자의 실행이 완료되었을 때, 인스턴스의 모든 저장속성이 초기값을 가지게된다. (모든 인스턴스 저장속성의 초기값을 지정하는 것이 생성자의 역할이다.)
 
 - 생성자와 반대 개념의 소멸자 (Deinitializer)도 존재한다.
 - 소멸자는 인스턴스가 메모리에서 해제되기 전, 해야할 기능을 정의하는 부분.
 */



// 생성자 구현의 기본

// 클래스, 구조체, 열거형 모두 동일하게 적용된다.
// 아래와 같이 다양한 형태를 가질 수 있음.
class Dog {
    var name: String
    var species: String
    
    // 생성자도 오버로딩을 지원하기 때문에, 한 클래스에 여러개의 생성자를 구현 가능하다. (아규먼트 레이블, 파라미터의 수, 리턴형으로 구분 )
    
    //1. 파라미터를 받지 않고, 직접 리터럴 값으로 초기화.
    init(){ // init() -> 기본 생성자 (Default Initializer), 클래스 안에서 기본 생성자를 따로 구현하지 않더라도, 저장 속성의 기본 값을 지정해주면 기본 생성자가 자동 구현된다.
        name = "쏨이"
        species = "포메라니안"
    }
    
    //2. 하나의 파라미터 값으로 모든 속성을 초기화.
    init(_ str: String){
        name = str
        species = str
    }
    
    // 3. 모든 멤버의 데이터를 파라미터 값으로 받아 속성을 초기화
    init(name: String, species: String){
        self.name = name
        self.species = species
    }
}

// 생성자의 호출

var ssomi = Dog() // 기본 생성자의 호출로 인스턴스 생성, Dog.init() 과 동일한 표현.
var meoggu = Dog.init(name: "먹구", species: "푸들") // 3번 생성자의 호출로 인스턴스 생성.
var dog = Dog("dog") // 2번 생성자의 호출로 인스턴스 생성.


// 참고 - 초기화의 방법
/*
 1) 직접 각 속성에 초기값을 지정해준다.
 2) 생성자를 통해 초기화 한다.
 3) 각 속성을 옵셔널로 선언한다 -> 초기값을 지정해주지않을 경우 nil을 가진다.
 
 -> 따라서 반드시 생성자를 직접 구현 해줘야 하는 것은 아니다.
 1,3번 방법을 사용하면, 생성자를 직접 구현해주지 않아도, 컴파일러가 기본 생성자를 자동구현함.
 ==> ⭐️ 만약, 클래스 내에 코드로 직접 생성자를 구현해 줄 경우에는 컴파일러가 기본 생성자를 자동 구현하지 않음!!!
 */



// 멤버와이즈 이니셜라이져 (Memberwise Initializer) => 구조체의 특별한 생성자.

struct Flower {
    var name: String
    var fetals: Int
    /*
     init(name: String, fetal: Int){
        self.name = name
        self.fetals = fetals
     }
     */
}

// 구조체에서는 모든 멤버를 파라미터로 받는 생성자의 자동 구현을 제공한다. 이 자동제공되는 생성자를 멤버와이즈 생성자라고 한다.
// 단, 구조체 내부에서 직접 생성자를 구현하는 경우, 멤버와이즈 생성자의 자동 구현이 제공되지 않는다.
// 즉, 구조체에서는 기본 생성자 + 멤버와이즈 생성자의 자동구현이 제공되는것.


// 다양한 형태의 멤버와이즈 이니셜라이저 자동 구현.
struct Plant {
    var name: String = ""
    var leafs: Int = 5
    var fetals: Int // 예를 들어서 이렇게 한개의 멤버만 초기값이 주어지지 않은 구조체의 경우.
}

var aPlant = Plant(fetals:0) // 초기값이 주어지지 않은 멤버만 파라미터로 받는 멤버와이즈 생성자 자동 구현 제공.



// 클래스의 생성자

// 지금까지 공부한 init() 으로 시작하는 생성자들은 지정 생성자 (Designated Initializer)
// 클래스에는 이 외에도 편의생성자, 필수생성자, 실패가능 생성자(->구조체에도 있음)가 있음.

// 구조체의 지정 생성자의 구현
// -> 구조체의 지정 생성자는 다른 생성자를 호출하는 방식으로도 가능하다.

struct Plant2 {
    var name: String
    var leafs: Int
    var fetals: Int
    init(){
        self.init(name: "", leafs: 0, fetals: 0)
    }
    init(name: String, leafs: Int, fetals: Int){
        self.name = name
        self.leafs = leafs
        self.fetals = fetals
    }
}

// 편의 생성자 (Convenience Initializer)
// -> 다른 생성자를 호출하는 생성자. (구조체에서는 편의생성자 라는 개념이 없음.)
// 앞에 convenience 키워드를 붙여준다.

class Puppy {
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    convenience init(name: String){ // 하나의 멤버의 초기값을 두고, 다른 멤버만 파라미터로 받고 싶을 때 편의 생성자를 사용하기.
        self.init(name: name, age: 0) // 더 간결(편리)하게 새로운 생성자 구현.
    }
}

var kkomi = Puppy(name: "kkomi")
kkomi.age // 자동으로 0

// 편의 생성자의 기능을 지정 생성자로도 구현 가능 하지만, 바람직한 구현이 아님 > 이유는 뒤에서 자세히


// 편의 생성자를 사용하는 이유
/*
 - 편의 생성자는 모든 속성을 초기화 할 필요가 없는 편의적인 성격을 지닌다.
 - 따라서, 초기화 과정을 간편하게 하고, 상속 관계에 있어, 개발자가 실수할 수 있는 여러가지 가능성을 배제하기 위해 도입된 생성자다.
 - 모든 속성자를 초기화 하지 않는다면, 편의생성자로 만드는 편이 복잡도나 실수를 줄이 수 있다.
 - 결국, 가능한 생성자간의 중복을 줄이고, 다른 지정 생성자를 호출하는 패턴으로 구현하는게 좋다.
 
 -> 모든 속성을 파라미터로 받는 지정 생성자를 구현하고, 기타 생성자들은 편의생성자로 구현하는 것을 권장.
 */

// 편의 생성자의 사용예2

class Parent {
    var name: String
    var age: Int
    var sex: String
    init(name: String, age: Int, sex: String){
        self.name = name
        self.age = age
        self.sex = sex
    }
    convenience init(name: String, age: Int){
        self.init(name: name, age: age, sex: "Female")
    } // 편의 생성자를 이용해, sex의 초기값을 "Female"로 지정.
    func doWhenInitiated_p(){
        print("지정생성자를 통한 초기화 완료! - 부모")
    }
}

var jiwooMom = Parent(name: "선주", age: 53)
jiwooMom.sex


// 상속이 일어날때, 지정 생성자는 어떻게 선언해줘야 할까

class Child : Parent {
    var grade: Int
    init(name: String, age: Int, sex: String, grade: Int){
        // 1. 먼저 자식클래스 고유의 속성 초기화.
        self.grade = grade
        // 2. 부모클래스의 생성자를 호출해서 상속받은 속성 초기화.
        //-> 상속받은 속성의 메모리공간을 할당하는 과정으로, 상속받은 속성에 접근하기 전 반드시 선행되어야 한다.
        super.init(name: name, age: age, sex: sex)
        self.sex = "Female" // 상위클래스의 생성자를 호출했기 때문에, 이제 접근 가능.
        super.doWhenInitiated_p()
        self.doWhenInitiated_c() // 이렇게 생성자 안에 부모 혹은 자신의 매서드도 호출 가능.
    }
    convenience init(name: String, age: Int){
        self.init(name: name, age: age, sex: "Female", grade: 4)
    }
    func doWhenInitiated_c(){
        print("지정생성자를 통한 초기화 완료! - 자식")
    }
}

// ⭐️ 중요!! -> 부모클래스의 편의생성자는 자식 클래스에서 재정의 할 수 없다.(자식클래스에서 호출 불가.)
var jiwoo = Child(name: "지우", age: 25)


// 상속관계에서의 생성자 위임 규칙 (교재 참고)
/*
 1) 델리게이트 업 (Delegate Up) -> 슈퍼-서브 간 위임규칙
 - 서브클래스의 지정생성자는 슈퍼클래스의 지정생성자를 반드시 호출해야 한다.
    (하위클래스 자신의 속성을 초기화 하고, 상속받은 슈퍼클래스의 저장속성을 초기화 하는 과정.)
 2) 델리게이트 어크로스 (Delegate Across) -> 같은 클래스 내 생성자들간 위임규칙
 - 편의생성자는 동일한 클래스의 다른 지정/편의 생성자를 호출해야하고, 궁극적으로는 반드시 지정생성자를 호출해야 한다.(지정생성자만이 모든 저장속성을 초기화 하므로.)
 */
