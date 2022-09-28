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

alphabet.removeLast() // 맨뒤의 요소를 삭제하고, 삭제된 요소를 리턴하는 함수. (옵셔널 아님)
alphabet.removeLast(2) // 맨 뒤 두기의 요소를 삭제하는 함수, 리턴 안함

alphabet.removeAll() // 배열의 모든 요소를 삭제하는 함수
alphabet.removeAll(keepingCapacity: true) // 배열의 모든 요소를 삭제하되, 일단 저장 공간은 그대로 놔두고 안의 데이터만 날리는 함수.
// 메모리 공간을 없애 버린 것이 아니기 때문에, 나중에 요소를 채울때 좀더 빠르게 작업수행 가능

// 중요한점 ! : 각 동작에 대한 키워드를 기억할것 ~ 관련 동작의 함수가 그 키워드를 포함하는 경우가 많으니까 (append, remove, replace 등...)

// -> removeFirst, removeLast 함수의 리턴값의 경우 옵셔널이 아니기 때문에, 배열이 비어있으면 에러가 뜬다. 이를 주의해야함.







// 2) Dictionary (딕셔너리) ~ 데이터를 키와 값으로 하나의 쌍으로 관리하는, 순서가 없는 컬렉션
    // 서버에 저장되어있는 데이터를 받아오는 형태


// 3) Set (집합) ~ 같은 타입의 데이터를 순서대로 저장하는 컬렉션
    // 사용하는 경우는 별로 없음


