import UIKit

// 1. 문자열 중 한 글자를 랜덤으로 뽑아내기!

// 내 코드

func selectOneChar (string:String) -> Character {
    let randNum = Int.random(in: 0...string.count)
    let randChar = Array(string)[randNum]
    return randChar
}



// 앨런 코드

// String의 randomElement() 함수 사용

func selectOneChar_Ellen(_ str : String) -> String {
   
    return String(str.randomElement()!)
}

// 응용하기
func selectOneChar_Advance(_ str : String) -> String.Element {
    let randElement = str.randomElement()
    // random한 String Element type 뽑기
    // randomElement() 함수는 Character? 형을 반환한다.
    return randElement!
}



// 2. 소수 판별하기

// 소수 : 1과 자기 자신으로만 나누어지는 정수
// 즉, 1을 제외한 약수가 없는 정수.

// 내 코드

func isPrime (input : Int)-> Bool {
    guard input >= 2 else {return false}
    if input == 2 {return true}
    for i in 2...input-1 {
        if input % i == 0 {
            return false
        } else {continue}
    }
    return true
}




isPrime(input: 9)


//앨런 코드

func isPrime_Ellen (_ input : Int){
    
    var isPrime = true
    
    for i in 2..<input {
        if input%i == 0{
            isPrime = false
            break
        }
    }
    
    if isPrime {
        print("소수입니다.")
    }
    else {
        print("소수가 아닙니다.")
    }
}

isPrime_Ellen(7)



//3. 팩토리얼 함수 만들기.

// 5! = 1*2*3*4*5 = 6 * 20 = 120

// 일반적인 구현!

func factorial(_ input : Int)->Int{
    var fac = 1
    for i in 1...input {
        fac *= i
    }
    return fac
}

factorial (5)


// ⭐️ 재귀함수로 팩토리얼 함수 구현하기!!!!

// 재귀함수 : 자기 자신을 반복해서 호출하는 함수!

// 내 예상 )

// 만약 i 가 1일 때 ~ 1
// 만약 i 가 1이 아닐때 ~ i * fac(i-1)

// 내 trial )

func factorial_r (_ input:Int)->Int {
    if input < 1 {return 0}
    else if input == 1 {
        return 1
    }
    else {
        return input * factorial_r(input-1)
    }
}

// 5 ~
// 5 * f_r(4)
// 5 * 4 * f_r(3) ...

factorial_r(5)

// 맞췄다!! 기쁘당

// 지우의 연습 ~ 1부터 자기 자신까지 모든 정수 더하기

func sumAll(_ input : Int)->Int{
    if input < 1 {return 0}
    else if input == 1 {
        return 1
    }
    else {
        return input + sumAll(input-1)
    }
    
}

sumAll(5) // 1+2+3+4+5

