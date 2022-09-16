import UIKit

// 네가지 케이스
// 1. input 과 output이 모두 없는 케이스
// 2. input 이 있고 output이 없는 케이스
// 3. input 이 없고 output이 있는 케이스
// 4. input 과 output이 모두 있는 케이스

// case 1. input 과 output이 모두 없는 케이스

// 함수 선언
func caseOne(){
    print("no input no output")
}

//함수 호출
caseOne()


// case 2. input 이 있고 output이 없는 케이스

//함수 선언
func caseTwo(a:Int, b:Int){
    print(a+b, terminator: " ")
    print(a-b, terminator: " ")
    print(a/b, terminator: " ")
    print(a*b)
}

//함수 호출

caseTwo(a:5,b:6)


// case 3. input 이 없고 output이 있는 케이스

// 함수의 아웃풋은 (리턴값은) 반드시 한개 뿐이다.
//함수 선언
func caseThree () -> Int {
    let a = 5
    let b = 6
    return a*b
}

//함수 호출
print (caseThree())

// case 4. input 과 output이 모두 있는 케이스

//함수 선언
func caseFour (_ a : String, _ b : String) -> String {
    return a+b
}

//함수 호출
print (caseFour("고양이 ", "귀여워"))

// 참고 : output이 없는 함수 타입을 void 타입이라고 하는데, 다음과 같이 세가지 방식으로 표현가능

func voidType1(){
    print("hi")
} // C언어, 자바랑 유사한 형태의 선언 방식

func voidType2()->Void{
    print("hi")
}

func voidType3()->(){
    print("hi")
}

// 리턴값이 없는 함수 ~ 제어에 활용
// 리턴값이 있는 함수 ~ 제어 + 결과값도출에 활용



// Argument Label과 그 이점

//Argument Label
//  -> 함수 호출시, 함수 외부로부터 아규먼트를 표시하기 위해 사용하는 이름.

func whatIsAL(a b : Int, c d : Int)->Int{
    return b+d
} // a,c는 Argument Label, b,d는 Parameter Name
// 실제로 함수 내부에서 인자를 표현 / 연산 할때는 Parameter Name을 사용한다.

whatIsAL(a: 5, c: 4) // 함수 외부에서, 함수를 호출할때는 Argument Label을 사용.

// Argument Label 사용시 이점
// -> 가독성과 편리성을 모두 챙길 수 있음!

// 다른사람들이 내 코드를 읽을때, 가독성이 좋으려면 함수 인자가 정확히 무엇을 뜻하는지 잘 표현하는 네이밍을 채택해야함, 하지만 함수 내부에서 이 이름을 계속 사용하여 로직을 작성하는게 귀찮을 수도 있음 그럴때 아규먼트 레이블을 사용하면 좋음

func complicatedFunc(thisIsMyFirstName a : String,thisIsMyLastName b : String )->String{
    return a+b
}

complicatedFunc(thisIsMyFirstName: "Jiwoo", thisIsMyLastName: "Hwang")

// 이점 2. 아규먼트 레이블로 와일드카드패턴을 사용하면, 함수 호출시 파라미터 네임 생략 가능!

func anotherFunc(_ a : Int, _ b: Int) -> Void{
    print(a+b)
}

anotherFunc(4,5) // 파라미터 네임이 생략된 버전
// 주의 ~ 이렇게 파라미터 네임을 생략하려면, 함수 이름으로 부터 충분히 파라미터의 의미를 유추 가능해야 한다. ex) addTwoNum, printFullName 등




// 가변 파라미터 (Variadic Parameters)

// ~ 인풋값(아규먼트) 의 정확한 개수를 알 수 없을때 사용

/* ========================================================
 1) 하나의 파라미터로 2개 이상의 아규먼트를 전달 가능하다.
 2) 이때 아규먼트는 '배열' 의 형태로 전달된다.
 3) 가변 파라미터는, 각 함수마다 한개씩만 선언할 수 있다. (선언 순서는 상관없다.)
 4) 가변 파라미터는 기본 값을 가질 수 없다. (-> 선언시 초기화 할 수 없다.)
 ========================================================*/

func arithmeticAverage(_ numbers : Double...) -> Double{
    // 이때 numbers의 타입은 [Double]
    var sum = 0.0
    for i in numbers {
        sum += i
    }
    return sum / Double(numbers.count)
    // Double 형태의 sum은 Double 값으로만 나눠질 수 있음. 따라서 numbers.count 는 Int 형태이므로, Double타입으로 타입캐스팅 해줘야한다.
}

print(arithmeticAverage(1,2,3,4,5,6,7,8,9,10))



// 함수 파라미터의 디폴트(기본) 값을 정하는 것도 가능.

func newSum(_ a : Int ,b: Int = 5)->Int{
    return a+b
}

print(newSum(4))


// 아규먼트 값이 항상 필요한 것은 아님!
// 실제로, 애플이 만들어놓은 여러 내장함수는 디폴트값을 사용한다.
// 예시로 프린트 함수의 경우, seperator, terminator 등의 파라미터를 명시하지 않더라도 디폴트 값을 사용한다.
// print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)

print("jade","is","happy",separator: "🦋") // 프린트 하는 items의 경우 가변 파라미터 형식이다. seperator는 items가 여러개인 경우,이들을 구분하는 요소를 의미한다.

// print(1,2,3,4,5, separator: 4) -> (x) separator의 타입은 String 이다. (Int는 적용 안됨!)

print(1,2,3,4,5, separator: " ")

// (참고) print 함수의 separator의 default 값은 "", terminator의 default 값은 "\n"이다.


// 리턴(return) 에 대한 이해

/*===========================================
 1) 리턴타입(아웃풋)이 있는 경우 :
 리턴 키워드 다음의 표현식을 평가한 후, 그 결과를 반환하며 함수 실행을 중지하고, 함수를 벗어나, 호출된 곳으로 돌아간다
 2) 리턴타입 (아웃풋이 없는 경우) : 함수 실행을 중지하고, 함수를 벗어나 호출된 곳으로 돌아간다.
 
 ===========================================*/

func printIfOdd (_ number : Int) {
    if number % 2 == 0 {
        print("even!!")
        return // 함수 종료
    }
    else{
        print("odd!")
    }
    print("blahblah")
} // 위처럼, 함수를 특정 구간에서 바로 종료할 때 리턴을 사용하면 됨.

printIfOdd(2)
printIfOdd(3)





// 함수의 중첩 사용
// -> 중첩된 함수 (Nested Function)
// 함수 안에서 다른 함수가 정의되고, 사용되는 형태
// 함수를 제한적으로 사용하고 싶을때 쓴다.


// Step Backward, Step forward 함수 만들기

func chooseStepFunction(gobackward : Bool, value : Int) -> Int {
    
    func stepForward(_ input : Int) -> Int {
        return input+1
    }
    
    func stepBackward(_ input : Int) -> Int {
        return input-1
    }
    
    if gobackward {
        return stepBackward(value)
    }
    else {
        return stepForward(value)
    }
}

var aValue = 7
chooseStepFunction(gobackward: false, value: aValue) // stepForward
chooseStepFunction(gobackward: true, value: aValue) // stepBackward
// 함수 내부에서 정의되는 함수는 당연하게도, 외부 함수 스코프 밖에서 접근될 수 없다.


// ------------------------------------------------


// 함수의 표기법

// 함수의 정의문과 실행문

// 정의문

func addNums (_ nums : Int...)->Int{
    var sum = 0
    for i in nums {
        sum += i
    }
    return sum
}

// 실행문

addNums(1,2,3,4,5)

// 이와 별개로, '함수를 가리키는' 지칭하는 경우가 있음
// 1) 개발자 문서를 읽을때
// 2) 함수를 지칭할때(함수를 변수에 담거나 할때) 필요


// 함수 지칭시, 함수 표기법

//1) 파라미터가 없는 경우, ()을 삭제한다.

func doSth() -> Void{
    print("hello")
}
var some = doSth
// some 이라는 새로움 변수에 addNums 라는 함수를 할당한다. -> addNums 함수는 some 이라는 새로운 이름도 얻게 된다.
//(var some : (Int...)->Int)

// 그럼 some을 어떻게 실행할 수 있는가?
some()

// 2) 아규먼트 레이블이 있는 파라미터를 가지는 함수의 경우, 아규먼트 레이블 까지를 함수 이름으로 본다.

func isTrue(bool : Bool){
    if bool {
        print("true")
    }
    else {
        print("false")
    }
}

var some2 = isTrue(bool: ) // 함수 지칭, 이때 some2 변수는 타입추론된 것으로, ':(Bool)->()' 가 생략된 표기임.

// 3) 파라미터가 여러개인 경우, 콤마 없이 아규먼트 레이블과 콜론 표시

var some3 = chooseStepFunction(gobackward: value:)
some3(true,3) // 왜 아규먼트 레이블을 생략하는가? -> 이미 some에 chooseStepFunction(gobackward: value:)을 할당할때 형식과 아규먼트 레이블까지 다 같이 명시했으므로.

// 아규먼트 레이블이 생략된 경우, 와일드카드 패턴으로 표기

func printFullname(_ first : String, _ last : String)->Void{
    print(first+last)
}

var some4 = printFullname(_:_:) // some4는 이미 선언된 printFullname 함수 이다.


// 함수 타입의 표기
// 함수 자체를 변수 할당 할때, 이 변수의 타입을 정확하게 명시한다면 그때의 표기법은?

var fType1 : ()->() = doSth // ()->Void 도 가능

var fType2 :(Bool)->() = isTrue(bool: )

var fType3 : (Bool,Int)->Int = chooseStepFunction(gobackward:value:)

var fType4 : (String,String)->() = printFullname(_:_:)



// 오버로드

// -> 같은 함수 이름으로 여러개의 함수를 대응시키는것,
//(함수 이름의 재사용)

// 스위프트는 오버로딩을 지원하는 언어로,
// 비슷한 함수의 이름을 굳이 다르게 해서 다 외워야 하는 수고로움을 덜어준다.

//⭐️ 함수 이름, 파라미터 수 혹은 자료형, 아규먼트 레이블, 리턴형을 모두 포함해 함수 식별 (이들이 모두 일치하지 않는 이상 서로 다른 함수로 인식하고, 오버로드 가능.)
func doSomething (input : Int ){
    print(input)
}

func doSomething(val : Int){
    print(val)
}

func doSomething (_ input : Int){
    print(input)
}
// 위와 같이, 파라미터의 자료형과 수가 동일하더라도, 아규먼트 레이블이 다르기 때문에 식별 가능

func doSomething (input : Double ){
    print(input)
}


//Scope
// 코드에서 중괄호 {} 내에서 작성되는 코드 범위.

/*===========================================
 중요 원칙
 1. 변수는 코드에서 선언이 되어야지 접금 가능하다.(선언하기 이전에는 접근 불가) (전역변수는 예외.)
 - 코드는 순차적으로 실행되기 때문에, 코드상에서 변수 접근에 앞서, 변수 선언이 이루어져야한다.
 2. 상위 스코프에 선언한 변수 및 상수에 접근 가능하며, 하위스코프에는 접근이 불가능
 - 상위스코프{ 하위스코프 }
 3. 동일한 스코프에서 이름이 중복될수는 없지만, 서로 다른 스코프에서는 이름 중복이 가능
 4. 가장 인접한 스코프에 있는 변수 및 상수에 먼저 접근한다.
 ============================================*/


// 제어전송문 정리

// [1] break
// 1. switch 문에서 사용할때
    // -> 해당 케이스에서 아무런 동작도 하지 않을때 break 사용.
// 2. 반복문에서 사용할때
    // -> 가장 인접한 반복문을 아예 종결할때 사용.

//[2] fallthrough
// switch 문에서 사용.
// 바로 뒤의 case 까지 반드시 실행해 줄때 사용.

var i = 2

switch i {
case 0...3 :
    print ("small")
    fallthrough
case 4...5 :
    print ("medium")
case 6...8 :
    print ("Big")
default :
    break
}
// 이와 같이, 바로 인접한 다음 case 까지만 실행되고, 그 다음 case는 실행되지 않는다.
// 즉 fallthrough가 맨 마지막 case 까지 떨어지는게 아니라, 바로 다음 케이스로 떨어지는것임.

//[3] continue
// 반복문에서 사용
// 현재 사이클을 종료하고, 반복문을 바로 다음 사이클로 보냄
// 다음 사이클(주기) 에서 계속 반복문을 지속한다는 의미.

// return

// return 타입이 있는 함수의 경우 ~ 함수의 결과값 (return 키워드 다음의 표현식의 결과)을 반환
// return 타입이 없는 함수의 경우 ~ 함수 종결.

//⚠️ 교재의 제어전송문 비교 부분 보면서 정리하기.

