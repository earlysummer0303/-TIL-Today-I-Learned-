import UIKit

//--- for 문


for index in 1...10 {
    print(index)
}
// 이때 index 는 임시 상수이다. (반복상수 라고 말함)

//와일드카드 패턴 (wild card pattern)
// -> 언더바 (_)를 사용해서 변수 이름 (식별자) 를 생략하는것
// 주로 데이터를 임시적으로 담아놓고, 사라져도 상관 없을 경우에 와일드카드패턴을 사용한다.
for _ in 1...5 {
    print("this is wildcardpattern")
}

// 참고
// 범위 연산자는 내림차순으로 쓸 수 없다
//-> ex) 10...1 (x)
// 내림차순으로 사용하는법
(1...10).reversed()

for item in (1...10).reversed(){
    print(item)
} // 10 9 8 7 6 5 4 3 2 1 (줄바꾸기로)

// 특정간격대로 정수 범위를 생성하는 함수
stride(from:1, to:10, by:2)
// 이때, to 뒤의 숫자는 범위에서 포함하지 않는다. 1부터 시작해서 10을 향해 가는 느낌
// stride : 성큼성큼 걷다 라는 뜻

// 만약 뒷 숫자까지 범위에 포함하고 싶다면
stride (from:1, through:11, by:2)

for item in stride(from: 1, to: 10, by: 2){
    print(item)
} // 1 3 5 7 9 (줄바꾸기로)


// 컬렉션 타입 (배열 / 딕셔너리 / Set)을 범위로 사용하는 경우

let newArr : [String] = ["a","bc","def"]

for str in newArr {
    // let str = "a" -> let str = "bc" -> let str = "def"
    print(str)
 }

// Swift에서 print를 할때, 기본적으로 terminal 에서 줄바꾸기가 됨
// 즉, default terminator 가 줄바꾸기.
// 다른 끝맺음 옵션을 선택하려면 print 함수에 terminator을 추가해주면됨.

for i in 1...5{
    print(i,terminator: " ")
} // 한칸 띄는것으로 프린트를 끝마친다.
//1 2 3 4 5


//--- while 문

//while 문과 repeat- while 문의 차이

var num = 3

print("---while 문의 경우~")
while num < 3 {
    print(num)
    num+=1
} // while문의 경우, 먼저 조건을 검사하기 때문에, 처음부터 조건이 성립하지 않으면 반복문이 한번도 실행되지 않는다.

print("---repeat - while 문의 경우~")
repeat {
    print(num)
    num+=1
}while num<3
// repeat-while의 경우, 일단 한번 반복 하고, 조건을 검사하기 때문에, 처음부터 조건이 성립하지 않더라도 최초 한번은 실행된다.



// 반복문의 제어전송문(흐름 제어) - Control Transfer Statement


// -> 반복문 내에서 쓰이는 명령의 흐름 제어
print("--------------- 제어전송문------------------")
// continue
// 반복문에서 continue를 만날 경우, 아래의 문장을 무시하고, 바로 다음 주기로 넘어간다.

print("--------------- continue------------------")
for i in 1...10 {
    if i%2 == 0{
        continue
    }
    
    print(i, terminator: " ")
}

// break
// 반복문에서 break를 만날 경우, 아래의 문장을 무시하고, 아예 반복문 밖으로 나간다. (반복문 자체가 종결됨.)
print("--------------- break------------------")
for i in 1...10{
    if i%2 == 0 {
        break
    }
    print(i, terminator:" ")
}

print("\n")
// 중첩 반복문을 사용할때 기본적으로, 제어 전송문은 가장 인접한 반복문을 컨트롤한다.

for i in 0...3 {
    print("OUTER \(i)")
    for j in 1...3{
        if i > 1{
            print(" j : \(j)")
            continue
        }
        print(" INNER \(j)")
    }
}

// 만약 인접하지 않은 반복문을 컨트롤 하고 싶을 경우 Labeled Statement 사용.

// Labeled Statement
    // -> 레이블이 붙여진 문장.
    // Label은 관습적으로 전부 대문자로 쓴다. (가시성을 위해)
print ("---------Labeled Statement-------------")

OUTER:for i in 0...3{
    print("OUTER : \(i)")
INNER:for j in 0...3{
    if i>1 {
        print(" j : \(j)")
        continue OUTER
    }
    print(" INNER : \(j)")
}
} // let i = 2 ~ let i = 3에서, j:0 만 프린트됨.

OUTER:for i in 0...3{
    print("OUTER : \(i)")
INNER:for j in 0...3{
    if i>1 {
        print(" j : \(j)")
        break OUTER
    }
    print(" INNER : \(j)")
}
} // let i = 2에서, j:0 만 프린트되고, let i = 3인 경우는 아예 실행되지 않는다.
