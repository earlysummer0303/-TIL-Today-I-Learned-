import Foundation


 // Collection

    // 데이터의 집합을, 효율적으로 관리하기 위한 자료형

// 1) Array (배열) ~ 같은 타입의 데이터를 순서대로 저장하는 컬렉션


// 선언 및 초기화 형태

// 정식 문법
let intArray : Array<Int> = [1,2,3,4,5] // (자동 index(순번) 지정 from 0)
// 약식 문법
let strArray_1 :[Int]
let strArray = ["가","나","다","라"] // 타입 추론

// 빈 배열 생성
let emptyArray = Array<Int>()
let emptyArray_2 : [Int] = []

var numsArray = [1,2,3,4,5]

// 배열의 기본 기능 (프로퍼티 및 메서드)

numsArray.count // 배열 길이 도출
numsArray.isEmpty // 비어있는지 여부를 불리언값으로 도출

numsArray.contains(1) // 1을 포함하는지 여부를 불리언 값으로 도출 ~ true
numsArray.randomElement() // 배열의 Element 중 하나를 리턴하는 함수.

numsArray.swapAt(0, 1) // 배열의 두개의 Element의 위치를 바꾸는 함수 (인풋값은 인덱스임) -> [2,1,3,4,5]



// 배열의 요소 접근

// ~ 서브스크립트 문법 사용
// ~~~~~~> 서브스크립트 : 대괄호를 사용해 표현하는 특수한 함수

// 접근
numsArray[0] // 배열이름[인덱스]

// 대입
numsArray[2] = 4 // 2번 인덱스 자리에 4 대입

// 또다른 접근 방법
numsArray.first // 배열의 첫번째 요소 접근 ~ 옵셔널 형태 // Optional(Int) -> 해당 요소가 없을 경우 nil 리턴
numsArray.last // 배열의 마지막 요소 접근 ~ 옵셔널 형태
numsArray.startIndex // 배열의 첫번째 인덱스를 리턴 (즉, 무조건 0 리턴)
numsArray.endIndex // 배열의 마지막 요소의 인덱스값 + 1

var stringArray = ["iOS","BE","Android","iOS","FE","AI","BE"]


// 탐색
stringArray.firstIndex(of:"BE") //앞에서 부터 찾았을때, "BE"는 배열의 (앞에서부터) 몇번째 순서인가. 옵셔널 형태로 인덱스 리턴
stringArray.lastIndex(of: "iOS")// 뒤에서부터 찾았을 때, "iOS"는 배열의 (앞에서부터) 몇번째 순서인가. 옵셔널 형태로 인덱스 리턴

// 위의 결과값은 옵셔널이기 때문에, if-let 바인딩을 통해 판별 가능하다.

if let indx = stringArray.firstIndex(of: "BE"){
    print(indx)
    print(stringArray[indx])
}


// 삽입하기 (insert) -> 해당 요소를 배열의 맨 앞 또는 중간에 넣기

// insert 기능은 서브스크립트 문법으로 구현할 수 없다.

stringArray.insert("Game", at: 2) // "Game"이라는 단일 요소를 2번 index 자리에 insert
stringArray.insert(contentsOf: ["iOT","VR/AR"], at: 2) // ["iOT","VR/AR"] 이라는 컬렉션 요소를 2번 index 자리에 insert



// 교체하기 (replace)

var alphabet = ["A","B","C","D","E","F","G","H"]

// ~~ 단일 요소 교체하기
alphabet[0] = "a" // 첫번째 요소를 소문자로 교체

// ~~ 범위 요소 교체하기
alphabet[0...2] = ["A","b","c"]
alphabet.replaceSubrange(0...2, with: ["x","y","z"]) // 해당 범위의 요소를, 해당 컬렉션으로 변경하는 메서드



 
// 추가하기 (append) -> 배열의 마지막 요소로 해당 값을 넣는다.

alphabet.append("I")
alphabet += ["J"] // += 뒤에는 '컬렉션 형태'로 나타내줘야 한다. ~> 배열의 연산은 배열 끼리만 가능하므로! (대원칙 : 같은 타입끼리만 연산이 가능하다.)
alphabet.append(contentsOf: ["K","L"])


// 삭제하기 (remove)

alphabet[0...3] = [] // 해당 범위에 빈 배열을 대입함으로서 요소 삭제
alphabet.remove(at: 2) // 해당인덱스의 요소를 삭제하고 삭제한 요소를 리턴한다 (근데 옵셔널 값은 아니고, out of range일 경우 에러만 뜸)

// ~~ > 요소 범위 삭제
alphabet.removeSubrange(0...2) // 해당 인덱스 범위의 요소 삭제

alphabet.removeFirst() // 맨 앞의 요소를 삭제하고, 삭제된 요소를 리턴하는 함수. (옵셔널 아님)
alphabet.removeFirst(3) // 맨 앞의 세개의 요소를 삭제하는 함수, 리턴은 안함

/*
alphabet.removeLast() // 맨뒤의 요소를 삭제하고, 삭제된 요소를 리턴하는 함수. (옵셔널 아님)
alphabet.removeLast(2) // 맨 뒤 두기의 요소를 삭제하는 함수, 리턴 안함
*/

alphabet.removeAll() // 배열의 모든 요소를 삭제하는 함수
alphabet.removeAll(keepingCapacity: true) // 배열의 모든 요소를 삭제하되, 일단 저장 공간은 그대로 놔두고 안의 데이터만 날리는 함수.
// 메모리 공간을 없애 버린 것이 아니기 때문에, 나중에 요소를 채울때 좀더 빠르게 작업수행 가능

// 중요한점 ! : 각 동작에 대한 키워드를 기억할것 ~ 관련 동작의 함수가 그 키워드를 포함하는 경우가 많으니까 (append, remove, replace 등...)

// -> removeFirst, removeLast 함수의 리턴값의 경우 옵셔널이 아니기 때문에, 배열이 비어있으면 에러가 뜬다. 이를 주의해야함.



// 배열 기타 내장함수들

// 정렬
// sort -> 배열을 직접 정렬하는 함수 (오름차순 정렬)
// sorted -> 정렬한 배열을 리턴하는 함수 (오름차순 정렬)
// reverse -> 배열을 역순으로 직접 정렬하는 함수 (내림차순 정렬)
// reversed -> 내림차순 정렬한 배열을 리턴하는 함수
// shuffle -> 배열 요소의 순서를 임의로 섞는 함수.
//
var newArr = [1,5,4,2,6,7,8]
newArr.sort()
newArr
var anotherArr = [11,23,43,53,67]
print(anotherArr.sorted())

newArr.reverse()
print(newArr.reversed())

newArr.shuffle()
print(newArr.shuffled())



// 참고 ) Swift Naming Guide
// Mutating 함수 (컬렉션 자체를 변경하는 함수의 경우) -> 동사 원형 사용.
// Non-Mutating 함수 (컬렉션 자체를 변경하지 않고, 변경한 값을 리턴만 하는 함수의 경우) -> 분사 형태 사용 (-ing/-ed)



// 배열의 비교

let a = [1,2,3]
let b = [4,5,6]

let isTrue = a == b // 두 배열이 같은지를 Boolean 값으로 리턴, false
a != b // true

// 배열의 활용
// - 특정 요소 한개 삭제하기
// -> 직접 요소의 삭제는 불가능 하고, 인덱스를 찾아서 그 인덱스의 요소를 찾는 방식으로 삭제.

var animals = ["cat","cow","dog","dog","cat","chicken"]
if let indx = animals.lastIndex(of: "cat") { // lastIndex함수의 리턴값은 옵셔널.
    animals.remove(at: indx)
}

// - 배열의 배열 접근 (이중 배열)
let doubleArray = [[1,2,3],[4,5,6],[7,8,9]]
doubleArray[0][2]


// - ⭐️ 배열과 반복문의 결합
// 반복문에 배열이 접목되면, 필연적으로 배열의 첫순서부터, 각 요소에 접근한다.

let loopArray = ["a","b","c"]

for i in loopArray{ // loopArray의 첫 요소부터 하나씩 차례대로 i에 대입되는 것임
    print(i)
}



// enumerate : 하나씩 차례대로 열거하다
// - enumerated() : 열거된 것들을 named tuple(원소에 이름을 붙인 튜플)로 한개씩 전달하는 함수.
// (offset : , element : ) 형태임.

let enumArray = [1,2,3,4,5,6]

let enumEnum = enumArray.enumerated()
print(enumEnum)
//사용 예시들
for tup in enumArray.enumerated(){
    print(tup)
}

for (index,content) in enumArray.enumerated(){
    print("\(index) - \(content)")
}

for (index,content) in enumArray.enumerated().reversed(){
    print("\(index)~\(content)")
}



