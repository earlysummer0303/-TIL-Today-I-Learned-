import UIKit

// 튜플 연습

var newTuple = (5,4) // 변수 선언과 동시에 멤버의 추가, 삭제, 변경 불가, 타입 추론된 선언
var secondTuple : (Int, String) = (25,"Jiwoo") // 멤버를 명시한 선언

// 튜플 형태를 타입 애일리어스 하기
typealias GridPoint = (Int,Int) // typedef랑 비슷한 개념

var gridOne : GridPoint = (5,4) // 타입애일리어스 한 타입의 활용
type(of: gridOne) // GridPoint의 타입 확인

// 멤버 접근자 -> 멤버의 '인덱스'를 통해 접근
gridOne.0

// Named Tuple ~ 멤버 변수의 이름을 정하는 튜플
// 장점 : 코드의 가독성이 높아진다.
typealias StudentInfo = (name:String,studentId:Int)
var jiwoo : StudentInfo = (name: "황지우",studentId:185993)
jiwoo.name
jiwoo.studentId

// 튜플의 분해
// 변수 이름과 변수 값을 1:1 매칭시킨다.
// 튜플의 각 요소들을 상수 / 변수화 하는것임 (바인딩의 일종)

// 1.
var (one , two, three) = ("You", "and", "me")
one
two
three

//2.
var threeNums = ("one" , "two", "three")
var (hana , dool, sett ) = threeNums


// 튜플과 Switch문의 조합

// 튜플을 바인딩 해서 케이스 조건으로 사용한다.
var coordinate = (4,5)

switch coordinate{
case (let x,let y) where x == y , let (x,y) where x == -y :
    // (let , let) 으로 표현할 수도 있고, let (,) 으로 표현할 수도 있음.
    // 여러개의 조건에 대해 case를 표현할 때, && 안사용하고 , 사용해서 조건을 여러개 달 수 있다.
    print(" y = x 위에 있거나, y = -x 위에 있는 좌표")
case (let x, let y) :
    print("y = x 혹은 y = -x 위에 있지 않은 임의의 좌표, (\(x),\(y))")
} // 모든 경우를 다 커버 하기 때문에 디폴트는 필요 없다.


// 삼항연산자 (Ternary Operator)

// 형식 : [condition] ? [result for true] : [result for false]
// condition은 Boolean 표현식으로, condition이 true일 경우, result for true가 실행되고, false 일 경우, result for false 가 실행된다.

var a = 6
a > 0 ? print("참") : print("거짓")
