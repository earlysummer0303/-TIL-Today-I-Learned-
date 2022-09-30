import Foundation

// 2) Dictionary (딕셔너리) ~ 데이터를 키와 값으로 하나의 쌍으로 관리하는, 순서가 없는 컬렉션
    // 서버에 저장되어있는 데이터를 받아오는 형태

// 정식 선언 문법
// 관습적으로,key와 콜론 사이는 붙이고, 콜론과 밸류 사이는 띄어준다.
let aDic : Dictionary<Int, Int> = [2: 4, 3: 6] // <Key의 Type, Value의 Type>
// 약식 선언 문법
let bDix : [String: Int] = ["Jiwoo": 25, "Genhun": 25]

// 빈 딕셔너리의 생성
var voidDic : [String: String] = [:]
var voidDic_2 = Dictionary<String,String>() // 생성자의 실행으로, 빈 딕셔너리 생성
var voidDic_3 = [String: String]()// 생성자의 실행으로, 빈 딕셔너리 생성


// Dictionary 규칙
// 1. 키 값은 유일, 밸류 값은 중복 가능
// 2. 밸류 값으로 딕셔너리, 배열 등을 사용할 수 있다 (컬렉션의 중첩 사용 가능)
// 3. 딕셔너리의 키는 Hashable 해야한다.

// Hashable? ~ Hash가 가능한, HashValue를 갖는
// -> 교재 Hash/HashValue/Hashable 참고

let dic = ["A": "apple", "B": "banana", "C": "Carrot"]

dic.count
dic.isEmpty

if let rand = dic.randomElement(){ // named tuple 형태로 랜덤한 요소를 리턴.(key:,value:)
    print(rand)
}

// 딕셔너리 각 요소의 접근
// 기본적으로 서브스크립트([])를 이용한 문법을 사용한다.

dic["A"] // 키 값으로 접근, 단 해당 키가 딕셔너리 없을수도 있기 때문에, 옵셔널값임 ==> String?
//딕셔너리는 key값을 input으로 value를 리턴하는 것이지, value 자체를 검색하는 방법은 제공하지 않는다.

if let a = dic["A"]{
    print(a)
} else{
    print("Not Found")
}

// 참고 ~ 자료가 없을 경우, 기본값을 리턴하는 문법 ==> 리턴 String

dic.keys // 딕셔너리의 키 들만 모아서 배열로 리턴
dic.values // 딕셔너리의 밸류들만 모아서 배열로 리턴

dic["S",default: "Empty"] // "S"를 Key로 하는 Value를 찾되, 없을 경우, 기본값은 "Empty"
// 이럴 경우 nil의 가능성이 아예 없기 때문에 옵셔널바인딩 x


// 딕셔너리의 업데이트 (update) - 삽입하기(=추가하기)/교체하기 기능 cover

    var words : [String: String] = [:]

    // 직접 대입
    // 삽입 (추가)
    words["A"] = "apple"
    words["B"] = "banana"

    // 교체
    words["B"] = "blue"

// (정식) updateValue 함수 사용해서 update
    words.updateValue("canada", forKey: "C") // 새로운 요소가 추가되면 리턴 nil
    // 기존에 해당 Key 값의 요소가 없기 때문에 '이전의 밸류값이 없다'는 의미의 nil 반환하는 것임
    
    words.updateValue("city", forKey: "C") // 이렇게 기존에 있는 key의 value를 업데이트 하면
    // 이전의 value를 딕셔너리에서 지우며 반환
    words


// (정식) removeValue 함수 사용해서 remove

words.removeValue(forKey: "C")


// 딕셔너리의 비교 (배열과 동일)

let a = ["A": "Apple", "B": "Banana", "C": "Corn"]
let b = ["A": "App", "B": "Bing", "C": "Cong"]

a == b // false

let c = ["A": "Apple", "C": "Corn", "B": "Banana"]

a == c // true


// 딕셔너리의 활용

var dict1 = [String: [String]]() // 딕셔너리 밸류에 "배열"이 들어갈 수도 있다.

dict1["arr1"] = ["A","B","C"]
dict1["arr2"] = ["D","E","F"]

// 반복문과의 결합
// dictionary도 Array와 동일하게 컬렉션 타입이므로, 반복문과 결합되어, 그 원소를 하나씩 꺼내서 전달 가능.

let loopDic = ["A": "apple", "B": "banana", "C": "canada"]


// 딕셔너리의 경우, 열거하지(Enumerated) 않아도, Named-tuple 형태로 하나씩 꺼내서 전달 가능하다.
for (key,value) in loopDic{
    print("key: \(key), Value: \(value)")
}

for (_,value) in loopDic{
    print("value: \(value)")
}

for (key,_) in loopDic{
    print("Key: \(key)")
}

for item in loopDic{
    print("Key: \(item.key),Value:\(item.value)")
}





