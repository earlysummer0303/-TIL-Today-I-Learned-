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
    print("이제서야 함수 종료 하지롱롱")
} // 위처럼, 함수를 특정 구간에서 바로 종료할 때 리턴을 사용하면 됨.

printIfOdd(2)
printIfOdd(3)

let str : String = " "
let opt = Int(str) // -> Int?
