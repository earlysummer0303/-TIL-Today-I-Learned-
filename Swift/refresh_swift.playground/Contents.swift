import UIKit

// 1. 상수와 변수
    // 상수 (변하지 않는 일정한 값) -> let 상수명 : 타입명 = 값
    // 변수 (변할수 있는 값을 담는 그릇) -> var 변수명 : 타입명 = 값

var a:Int = 1
let b:Int = 2
var c:UInt = 4
let d:UInt = 5

print(a+b) // print안에 들어갈 말은 C의 printf("");와는 다르게 문자형이 아닌 데이터형도 가능

    // 상수가 존재하는 이유? -> 언어의 안전성을 위해

// 2. 데이터 타입
    /*
     스위프트의 기본 데이터타입 //  앞에 대문자인 카멜케이스
     - Int : 64bit 정수형
     - UInt : 부호가 없는 64bit 정수형
     - Float : 32bit 부동소수점
     - Double : 64bit 부동소수점
     - Bool : true / false 값
     - Character : 문자
     - String : 문자열
     - Any : 모든 타입을 지칭하는 키워드
     
     */

    //Character 표현 vs String 표현

    var someCharater:Character = "r"
    someCharater = "a"

    var someStr:String = "가나다라마바사"
    someStr = "abc"

    var typeguessing = "3"
    print(type(of: typeguessing))

    var guess:Int = 3
    print(type(of:guess))

// 3. 컬렉션 타입
    /*
     Array : 같은 타입의 데이터를 순서대로 저장하는 컬렉션
     Set : 같은 타입의 데이터를 순서 없이 저장하는 컬렉션
     Dictionary : 순서 없이 key 값과 value 값을 한 쌍으로 데이터를 저장하는 컬렉션
     */

    // Array

    var someArray :Array<Int> = Array<Int>() // 빈 배열 만들기
    // append 하기
    someArray.append(1)
    someArray.append(2)

    // 요소를 중간에 insert 하기
    someArray.insert(3, at: 2)
    // 요소 중간 값 제거
    someArray.remove(at: 2)
    // 다른 방법으로 배열 만들기
    var newArray : [Int] = [] //이렇게도 만들수 있음 (주로 쓰는 방법) // c언어에서는 int arr[] = {}
    // c에서는 배열을 대괄호로 묶음!
    
    // Dictionary -> key-value
    var someDictionary : Dictionary<String,Int> = Dictionary<String,Int>()
    var newDictionary : [String:Int] = [:] // 주로 쓰는 방법 , [key type:value type]
    // 이 딕셔너리의 key는 String, value는 Int 형으로 설정해줌
    newDictionary["황지우"] = 25
    newDictionary["최명선"] = 27
    newDictionary["류현지"] = 26
    // 특정 키 값의 value를 제거하는 함수 -> Key 값도 딕셔너리에서 함께 사라짐
    newDictionary.removeValue(forKey: "황지우")
    

    // 테스트 해보기
    
    var anArr : [Int] = [1,2,3]
    var anDic : [String:Int] = ["Jiwoo":25 , "Myungsun":27, "Songa":25]

    // Set
    // 데이터의 정렬 순서가 없고, 중복 데이터를 허용하지 않는다는 차별성.
    // 축약형 선언 방법이 없음
    var someSet :Set<Int> = Set<Int>()
    // set에 원소를 삽입하는 법
    someSet.insert(1)
    someSet.insert(1)
    someSet.insert(2)
    someSet.insert(3)
    someSet

    // 테스트 해보기
    var aSet : Set<Int> = [1,2,3,5,6,5]
    print(aSet) // 순서 입력 상관없이 나오고, 중복 입력된값은 한개만 나옴

// 4. 함수
/*
 함수의 기본 타입
     func 함수명(파라미터명:파라미터 데이터 타입) -> 반환형 타입 {

     return 반환값
     
     }
 */
func sum(_ param_1:Int,_ param_2:Int)->Int{
    return param_1+param_2
}
// 위처럼, 함수를 외부에서 사용할때, 파라미터 명을 안붙이고 싶으면 함수 선언시 내부 파라미터 명 앞에 '_' 하고 띄어쓰기로 구분해주기!

func printSurfyagers(
    name : String,
    role : String,
    age: Int){
    print(name + "!! 우리 서피져스 " +
          role + " \(age)살 생일 축하해!!")
}
printSurfyagers(name: "최명선",
                role: "iOS 개발자",
                age: 27)


//print(Eddy.realName + "우리 서피져스" + Eddy.role + "\(Eddy.age)살 생일 축하해!!")
//테스트 해보기

    func asum(p1:String , p2:String)->String{
        return p1+p2
    }

    print(asum(p1:"Jiwoo",p2:" Genius"))

sum(1,2)

// 만약 선언될때부터 파라미터의 값이 지정되어 있으면, 함수가 사용될때, 해당 파라미터의 값을 명시해줄 필요 없다.
func myName(firstName:String,lastName:String = "황")->Void{
    print("제 이름은 \(lastName)\(firstName) 입니다.")
}

myName(firstName: "유현")

// 가변 매개변수 : 하나의 매개변수의 개수가 몇개 들어올지 알 수 없을때 사용 가능, 함수당 각 한개의 가변 매개변수만 사용가능하다. -> 점 세개(...)로 표현
// 가변 매개변수는 배열처럼 사용됨.
func tooManyParams(me :String = "지우", friends : String... )-> Void{
    
    print("\(me)의 친구들은 \(friends) 입니다.")
    
}

tooManyParams(friends: "근훈", "주형", "지원")

// 5. 조건문
    // if
    /*
     if 조건 {
      조건식이 만족할 경우 실행할 구문
     }
     else {
     조건식이 만족하지 않을 경우 실행할 구문
     }
     */
    // 조건을 따로 괄호로 감쌀 필요 없음

    let animal :String = "cat"

    if animal=="dog"{
        print("강아지 사료주기")
    }
    else if animal=="cat"{
        print("고양이 사료주기")
    }
    else {
        print("다른동물")
    }

// if 테스트
let aha:Int = 5, bha:Int = 6

if aha == bha {
    print("same")
}
else {
    print("not same")
}
 
// switch
    /*
     switch 비교대상 {
     case 패턴1 :
        // 비교대상의 값이 패턴 1일 경우 실행 구문
     case 패턴 2 :
        //비교대상의 값이 패턴 2일 경우 실행 구문
     default :
        // 위의 패턴들에 해당하지 않을 경우, 디폴트 실행 구문
     }
     */

    // switch 문으로, 범위값을 가지는 패턴으로 비교도 가능하다. <- with ...
    
    let temperature = 30

    switch temperature{
        
    case -20...9 :
        print("겨울입니다.")
    
    case 10...14 :
        print("봄/가을 입니다.")
    
    default :
        print("여름입니다.")
    
    }

// 6. 반복문
    // for - in 구문
    /*
     for 루프상수 in 순회대상 {
     // 실행할 구문
     }
     */
    // 루프상수는 해당 루프 문 안에서만 쓰인다.
    for i in 1...5{
        print(i)
    }

    // 배열을 순회 대상으로 사용하기
    let array:[Int] = [6,7,8,9]

    for i in array {
        print(i)
    }
    // i는 array 안의 원소 값을 순회한다.

    // while 구문
    /* while 조건 {
     실행구문
     }
     */

    var number = 5
    while number < 10 {
        number+=1
    }
    // 조건이 참인 동안 실행

    for co in 1...5{
        print(co)
    }
    
    //repeat while 구문 - c언어 do-while 구문이랑 같음
    /*
     repeat {
     
     }while 조건
     */
    /*
    var num = 5
    repeat {
        num += 1
    } while num < 10
    */

    var nunu = 4
    repeat {
        print(nunu)
        nunu+=1
    }while nunu<=10
    // 선실행 후 조건검사






// *** 중요 ***
//옵셔널 - 변수의 값이 있을수도 있고 없을수도 있음을 표현하는 것!


//옵셔널은 변수 타입이다! -> 값이 없을 수도 있는 가능성이 있는 변수는 옵셔널 타입으로 선언한다.
    var op : String? = nil
    op = "Jiwoo"
    // 참고 - 옵셔널이 아닌 변수에는 옵셔널 변수의 값을 대입할 수 없다.
    // 옵셔널은 옵셔널 포장지로 감싸져 있다
    print(op) // -> 출력값 : Optional("Jiwoo")
    // 따라서, 옵셔널의 값은 다른 변수들과 연산 작업이 불가능 하다.
    // 연산 작업을 하게 해주려면, 옵셔널 값의 포장지를 벗기는 '옵셔널 바인딩' 작업을 해줘야 한다.

// 옵셔널 바인딩 - 옵셔널의 껍질 까주기!
    //옵셔널 해제의 방법에는 크게 두가지가 있다
        //1. 명시적 해제
            // - 강제 해제
            // - 비강제 해제 (옵셔널 바인딩)
        // 2. 묵시적 해제
            // - 컴파일러에 의한 자동 해제
            // - 옵셔널의 묵시적 해제
    
    // 강제 해제 => 옵셔널 변수 옆에  ! 붙여주는것
    var number_2 : Int? = 3
    
    print(number_2) // -> Optional(3)
    print(number_2!)// -> 3
    // 옵셔널변수! 는 해당 옵셔널의 강제 해제를 의미함, 강제 해제는 만약 nil값의 옵셔널을 해제 할 경우, 시스템이 강제 종료 될 수 있어, 옵셔널변수 값의 존재 여부가 확실하지 않을때에 위험한 방법임
    
    // 비강제 해제 (옵셔널 바인딩)
/*
    // 1) if-let 구문으로 옵셔널 바인딩 하기
    if let isNumberExist = number_2 {
        // isNumberExist 라는 변수로 옵셔널 number_2의 값 추출을 성공할 경우
        print(number_2!)//강제해제
    } else {
        print("옵셔널 값이 존재하지 않음")
    }

    //2) guard - let 구문으로 옵셔널 바인딩 하기

    func test() {
        let number_3 : Int? = nil
        guard let result = number_3 else {return}
        print(result)
    }

    test()
*/

// 비강제 해제 연습하기

    //1. if-let 구문으로 해제
    // 예외가 아닌 상황에 대한 부연설명을 먼저 해주는것
    var jop : Int? = 5
    if let isJopExist = jop {
        print("jop 값이 존재함 \(isJopExist)")
    }
    else{ print("jop의 값이 존재하지 않음") }
    
    //2. guard-let 구문으로 해제
    // 예외 상황에 대한 부연설명을 해주는 것
    // 함수 안에서 사용해준다.
    // guard문 : 함수의 시작에사 사용하는 구문으로, 함수의 시작에서 반드시 충족되어야 할
    func opBinding(){
        let jjop : Int? = nil
        guard let isJjopExist = jjop else {return} // isJjopExist == jjop를 만족할 경우에만 가드 하고 나머지는 내치기!(return)
        //이제 조건을 만족하는 경우만 걸러진다.
        print(isJjopExist)
    }
   
    
    
    // 컴파일러가 옵셔널을 자동으로 해제하는 경우 (묵시적 해제)
        // 아래와 같이 비교연산자를 사용해 옵셔널의 값을 비교할경우, 컴파일러가 자동으로 옵셔널을 해제한다.
    var opt : Int? = 3
    if opt == 3 {
        print("value가 3입니다")
    }
    else {
        print("value가 3이 아닙니다.")
    }
    
    // 옵셔널의 묵시적 해제
    let str = "12"
    let stringToInt : Int! = Int(str)
    print(stringToInt+1) //-> 사용할 때 옵셔널이 묵시적으로 해제된 상태임.

// 구조체와 클래스
    // 구조체
    /*
     struct 구조체 이름 {
     - 프로퍼티 (->변수)
     - 메소드 (->함수)
     }
     */
    // 프로퍼티와 메소드는 구조체의 멤버이기 때문에, 각각 멤버변수, 멤버 함수 라고 불린다.

    struct Member {
        var name : String
        var age : Int
        var id : Int
        func sayAge (){
            print(age)
        }
    }
    
    // 객체 인스턴스 생성
    var jade = Member(name : "Jiwoo", age :25, id:185993)

    // 인스턴스의 프로퍼티 값에 접근하기
    jade.name = "Geunhun"
    print(jade.name)

    // 인스턴스의 메소드에 접근하기
    jade.sayAge()

// 스트럭트 연습하기

struct Astruct {
    var name : String
    var age : Int
    func sayHi(){
        print("hi")
    }
}

var swimmer = Astruct(name:"황지우",age: 25)
swimmer.name = "surfyagersHarry"
print(swimmer)// Astruct(name: "surfyagersHarry", age: 25)
print(swimmer.name)


// 클래스
    /* class 클래스 이름 {
        프로퍼티와 매서드
     }
     */
    
    class Person {
        var age : Int = 24
        var name : String = "Jiwoo"
        // init() 은 뒤에서 다루기
        func intruduce (){
            print("name :"+name+"age :\(age)") // 같은 string 타입인 name은 + 로 연산 가능하지만, 다른 변수타입(int) 인
        }
    }

    var jiwoo = Person()
    var geunhun = Person()
    geunhun.name = "Geunhun"
    geunhun.age = 23

    geunhun.intruduce()

// class 연장선 ~ 초기화 구문 init() -> java의 생성자 함수와 동일한 개념

    // 초기화란 ? - 클래스. 구조체, 혹은 열거형 인스턴스를 생성하기 위한 준비과정
    // 인스턴스의 프로퍼티 마다 초기값을 넣어 주고, 새로운 인스턴스를 사용하기 전에 필요한 설정을 해주기 위해 초기화 해줌.
    // 새 인스턴스가 생성될 때, init() 안의 구문이 호출되어 실행된다.

class Worker{
    var name :String
    var id : Int
    init(name :String, id : Int){
        self.id = id
        self.name = name
    }
}

var Harry = Worker(name : "Jade", id: 1) // 자바 -> Worker Harry = new Worker(name:"Jade", id:1)
    // deinit()
    // 메모리에서 해제할 때 수행하고 싶은 작업을 deinit 구문 안에 넣어준다
    // 클래스 안에만 사용 가능하다.


struct Surfyagers {
    var role : String
    var realName : String
    var age : Int
}
var Eddy = Surfyagers(role: "iOS 개발자",realName: "최명선",age: 27)
print(Eddy.realName + "우리 서피져스" + Eddy.role + "\(Eddy.age)살 생일 축하해!!")

// 프로퍼티
// 클래스 / 구조체 / 열거체에 속한 속성변수
// 프로퍼티의 종류에는 1.저장 프로퍼티, 2.연산 프로퍼티, 3.타입 프로퍼티 가 있다.

//1. 저장 프로퍼티

// 저장 프로퍼티는 클래스, 구조체에서 사용할 수 있다.

// 구조체에서의 저장 프로퍼티
// 구조체는 '값' 타입입니다
struct Dog {
    var name : String
    let gender : String
}

var dog = Dog(name:"hey",gender:"male")
print(dog)

dog.name = "jiwoo"
//Dog 인스턴스의 gender는 상수로 선언되었으므로,gender를 변경할수는 없다.

let dog2 = Dog(name:"geunun", gender: "male") // 인스턴스 자체가 상수로 선언되어서 프로퍼티 값을 변경할 수 없다.

// 클래스에서의 저장 프로퍼티
// 클래스는 '참조' 타입입니다.
class Cat {
    var name : String
    let gender : String
    init(name : String, gender : String){
        self.name = name
        self.gender = gender
    }
}

let cat = Cat(name : "cat" , gender : "name") // 상수로 선언된
cat.name = "another name"
print(cat.name)
// cat이 상수로 선언되면 cat이 참조하는 주소 값은 변할수 없는것이고, cat이 참조하는 변수의 내용물 자체는 변경될 수 있기 때문에,
// let으로 선언한 클래스 인스턴스의 프로퍼티 값이 변경될수 있다.


//2. 연산 프로퍼티
// 연산 프로퍼티는 클래스, 구조체, 열거체에서 사용할 수 있다.
// 값을 저장하는 것이 아닌, 특정 조건에 따른 연산 결과값을 저장하는 프로퍼티
// 연산 프로퍼티는 값을 직접 지정 하지 않고, getter와 setter를 통해 다른 프로퍼티에 접근한다.

struct Stock{
    //저장프로퍼티 averagePrice, quantity
    var averagePrice : Int
    var quantity : Int
    //연산프로퍼티 purchasePrice
    var purchasePrice : Int {
        get {
            return averagePrice*quantity
        }
        set(newPrice){
            averagePrice = newPrice / quantity
            // purchasePrice로 새로운 값을 받으면(newPrice) averagePrice가 새 값에 맞게 갱신된다.
        }
    }
}
var stock = Stock(averagePrice : 2300, quantity:3)
print(stock)
stock.purchasePrice
stock.purchasePrice = 4600
stock.averagePrice

// -- 옵져버 (observer)
// willSet, didSet

class Account {
    var credit : Int = 0{
        
        willSet{
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet{
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

var account = Account()
account.credit = 1000

//3. 타입 프로퍼티
// 저장프로퍼티, 연산 프로퍼티에서 사용 가능, static 변수 사용 (클래스 / 구조체 당 하나만 생성, 해당 클래스 / 구조체의 모든 인스턴스가 공유함)
// 자바에서의 static 멤버와 동일한 개념.
// 같은 타입 (Struct/Class) 인스턴스 모두가 공유한다는 느낌! 인스턴스를 생성하지 않더라도, 타입. 으로 접근할 수 있다.
struct SomeStruct{
    static var storedTypeProperty = "~"
    static var computedTypeProperty : Int {
        return 5
    }
}
SomeStruct.storedTypeProperty = "changed"


//  class와 struct의 공통점과 차이점 - 노션 참조
    
class heyClass{
    var count : Int = 0
}

struct heyStruct{
    var count : Int = 0
}

// 클래스의 참조타입 성질 실습

var class_1 = heyClass()
var class_2 = class_1
class_1.count = 1
print(class_1.count)
print(class_2.count)
// class_1.count의 값을 변경해주면, 같은 값을 참조하는 class_2.count의 값 또한 바뀐다.

// 구조체의 값타입 성질 실습

var struct_1 = heyStruct()
var struct_2 = struct_1

struct_1.count = 1
print(struct_1.count)
print(struct_2.count)

// 상속 (Class)
//Superclass - Subclass


/*
 class 클래스 이름 : 슈퍼클래스 이름 {
  // 서브클래스 정의
 }
 */

class Vehicle {
    var wheels = 0
    var size = "big"
    var requiredPassengers : Int{ //computed property
        get {
            if size == "big"{ return 4}
            else if size == "middle"{ return 3}
            else { return 2}
        }
        set(newRequiredPassengers) {
            switch newRequiredPassengers{
            case 1...2 :
                size = "small"
            case 3...4 :
                size = "middle"
            default :
                size = "big"
            }
                
        }
    }
    
    func printKind(){
        print("I am a vehicle.")
    }
}

//상속하기, override와 super
class Bicycle : Vehicle{
    override func printKind() {
        super.printKind()
        print("I am also a bicycle")
    }
}

//프로퍼티 재정의
class Car :Vehicle{
    override func printKind() {
        super.printKind()
        print("I am also a car")
    }
    override var requiredPassengers: Int {
        get {
            if size == "big"{ return 6}
            else if size == "middle"{ return 4}
            else { return 1}
        }
        set(newRequiredPassengers) {
            switch newRequiredPassengers{
            case 1...3 :
                size = "small"
            case 4...5 :
                size = "middle"
            default :
                size = "big"
            }
    }
}

}

var newBicycle = Bicycle()
newBicycle.wheels = 2
newBicycle.size = "small"
newBicycle.printKind()

var newCar = Car()
newCar.wheels = 4
newCar.size = "big"
print(newCar.requiredPassengers)




// 타입캐스팅
// is, as
// 데이터의 타입을 확인하거나, 데이터의 타입을 다른 타입으로 변환하는것

class Food {
    var name :String
    func printKind(){
        print("I am food")
    }
    init(name:String){
        self.name = name
    }
}

class Pasta : Food {
    override func printKind() {
        super.printKind()
        print("also pasta")
    }
}
class Meat : Food {
    override func printKind() {
        super.printKind()
        print("also Meat")
    }
}

let foodLists : [Food] = [
   Pasta(name: "tomatoPasta"),
   Pasta(name: "potatoPasta"),
   Meat(name: "lambMeat"),
   Meat(name: "Pork"),
   Meat(name: "Chicken"),
   Meat(name: "Beef"),
    
]

// is - 타입 확인

var countPasta = 0
var countMeat = 0

for item in foodLists {
    if item is Meat{
        countMeat += 1
    }
    else if item is Pasta{
        countPasta += 1
    }
}
print ("리스트는 \(countPasta)개의 파스타와 \(countMeat)개의 고기메뉴를 가집니다.")

// as - 타입 변환
// Food 타입인 인스턴스를 Meat나 Pasta의 서브클래스 타입으로 타입캐스팅 할 수 있다.
// 단 서브클래스가 여러개일 경우, 한가지의 서브클래스에 대한 타입캐스팅은 실패할 수도 있기 때문에, 옵셔널로 표현한다.
// ex) Food의 리스트인 foodList에는 두가지 타입(Pasta,Meat)의 아이템들이 공존하기 때문에, 무작정 Pasta로 형변환 하면, Meat 형태로 선언한 아이템의 경우 타입캐스팅 실패


// 옵셔널(?)바인딩 사용 ~ 타입캐스팅이 반드시 성공한다는 보장이 없을 경우 사용
for i in foodLists{
    if let pastaItem = i as? Pasta{
        print("this is Pasta")
    } else if let MeatItem = i as? Meat{
        print("this is Meat")
    }
}

// 강제 캐스팅(!) 사용 ~ 타입캐스팅이 반드시 성공한다는 확신이 있을 경우 사용




// assert와 guard

// assert
    // - 특정 조건을 체크하고, 조건이 성립되지 않으면 메세지를 출력하게 할 수 있는 함수.
    // - assert 함수는 디버깅 모드에서만 동작하고, 주로 디버깅 중 조건의 검증을 위해서 사용.
// guard
    // - 조건을 검사하여, 그 다음에 오는 코드를 실행할지 말지 결정하는것 (필터 역할)
    // - guard문에 주어진 조건문이 거짓일 경우 구문이 실행됨 (guard를 통해 거를얘들을 막는 느낌)


// assert 사용

/*
var valuee = 0
assert(valuee == 0,"값이 0이 아닙니다1.") // 조건을 만족했으므로 뒤에 적은 에러메세지가 출력되지 않음

valuee = 2
assert(valuee == 0,"값이 0이 아닙니다2.") // 조건을 만족하지 않았으므로, 뒤에 적은 에러메세지가 출력됨.
*/

// guard 사용
// 함수 내에서 사용하는 구문
// 잘못된 값이 함수 내에 들어오는 것을 방지하는 역할

/*
 guard 조건 else {
    // 조건이 false일 경우 실행되는 구문
    // return / throw / break 중 하나를 통해 그 이후 코드를 실행하지 않도록 한다.
 }
 */

func guardTest(value:Int){
    guard value==0 else {
        return
    }
    print("error!")
}
guardTest(value: 0)
guardTest(value: 5)

//+) guard문을 사용한 옵셔널바인딩

func optionalBindingTest(value : Int?){
    guard let input = value else {
        // 옵셔널 바인딩 실패할 경우
        print("옵셔널 바인딩 실패")
        return // 함수가 호출된 곳으로 돌아감(함수 종료)
    }
   print("옵셔널바인딩 성공 ->\(input)")
}

optionalBindingTest(value: nil)
optionalBindingTest(value: 5)



// 프로토콜
// 특정 역할을 하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진
// 인터페이스와 유사한 개념이지만,인터페이스와는 다르다
/*
 구조체, 클래스, 열거형은 프로토콜을 채택(Adopted) 해서 특정 기능을 수행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있다.
 어떤 프로토콜의 요구사항을 모두 따르는 타입은 그 프로토콜을 준수한다(Conform) 고 표현한다.
 */

// 프로토콜의 정의

/*
 protocol 프로토콜이름 {
    프로토콜의 요구사항
 }
 */

protocol SomeProtocol{
    
}

protocol SomeProtocol2{
    
}

// 프로토콜을 채택하는 구조체 선언 형식
struct AdoptStruct : SomeProtocol, SomeProtocol2 {
    
}

// 프로토콜을 채택하는 클래스 선언 형식 -> 채택하는 클래스가 서브클래스일 경우, 슈퍼클래스를 가장 앞에 적어줘야 한다!
/*
 class AdoptClass : SuperClass , SomeProtocol, SomeProtocol2{
    ~
 }
 */

// 프로토콜의 요구사항 정의 - 1. 프로퍼티 요구사항 정의

protocol FirstProtocol{
    // 프로퍼티를 선언할때 프로퍼티 타입(stored or computed)는 표현하지 않아도 된다.
    // 프로퍼티는 반드시 var 형식으로 선언한다
    var name :Int {get set} // 읽기와 쓰기가 모두 가능한 프로퍼티
    var age : Int {get } // 읽기만 가능한 프로퍼티
    // 이 프로토콜을 채택하는 클래스/구조체/열거체 는 반드시 name과 age를 구현해야한다.
}

// 프로토콜의 요구사항 정의 - 2. 메서드 요구사항 정의
// 인스턴스 메서드와 타입 매서드 모두 가능하다.

protocol FullyNames{
    var fullName: String { get set }
    func printFullName()
}

struct PPerson : FullyNames{
    var fullName : String
    func printFullName(){
        // 프로토콜의 매서드 요구사항 충족(conform)
        // UITableViewDelegate 프로토콜을 채택한 뷰 컨트롤러에서 왜 override가 아니라 func tableview 함수를 통해 해당 함수를 재정의 했는지 알 수 있는 대목
        // func를 통해 구현되지 않고, 요구사항으로 선언만 된 함수를 구현해주는것이다.
        print(fullName)
    }
    
}

// 프로토콜의 요구사항 정의 - 3. 생성자 요구사항 정의

protocol SecondProtocol{
    init(someParameter:Int)
}

protocol ThirdProtocol{
    init()
}

class ConformClass2 : ThirdProtocol{
    // required 키워드를 이용해서 충족해준다
    required init(){
        
    }
}

// 하지만 상속하지 않는 final class의 경우 required 키워드를 사용하지 않아도 된다.

struct ConformStruct2 : ThirdProtocol {
    // 구조체에서는 생성자 요구사항을 충족하기 위해 required 키워드를 사용할 필요가 없다.
    init(){
        
    }
}


// 익스텐션
// 스위프트의 강력한 기능으로, 기존의 클래스, 구조체, 열거형, 프로토콜등의 타입에 새로운 기능을 추가하는 기능
/*
~익스텐션이 타입에 추가할 수 있는 기능~
 - 연산 타입프로퍼티 / 연산 인스턴스 프로퍼티
 - 타입 메서드 / 인스턴스 메서드
 - 생성자
 - 서브스크립트
 - 중첩타입
 - 특정 프로토콜을 준수할 수 있도록 기능 추가
 */

/* 선언 형식
 extension 확장할타입명{
    // 추가 기능
 }
 */

// 익스텐션은 추가는 할 수 있지만 오버라이드는 불가
// 익스텐션은 연산 프로퍼티만 추가 가능, 저장 프로터피는 추가할 수 없다.
// 또한 확장 이전 타입의 프로퍼티의 옵저버도 추가할 수 없다.

extension Int {
    var isEven:Bool {
        return self % 2 == 0
    }
    var isOdd:Bool {
        return self % 2 == 1
    }
}

// 이제 Int 형 타입의 모든 인스턴스에 적용 가능

var newNumber : Int = 3
number.isOdd
number.isEven

extension String {
    func convertToInt()->Int?{
        return Int(self)
    }
}

var string = "0"
string.convertToInt()
