import UIKit

// 3) Set (집합) ~ 같은 타입의 데이터를 순서대로 저장하는 컬렉션 (사용하는 경우는 별로 x)
    // 수학에서의 집합과 비슷한 연산을 제공하는 컬렉션

// Set의 문법 약속
// - 생김새가 배열과 동일하게 대괄호로 묶인 형태이기에, 생성시 반드시 타입 선언을 해야한다.
// - Set의 요소는 유일하다. (따라서 동일한 값의 요소를 여러번 넣어도, 한개만 존재하는것과 같다.)
// - 동일한 타입의 요소를 가지며, 요소간 순서가 없다.

var aSet : Set = [2,1,2,3,1,3] // 간식 선언
let bSet : Set<String> = ["Jade","Jade","Jiwoo","Swimmer"] // 정식 선언

// 빈 Set 생성
let cSet : Set<Int> = [] // 컬렉션 타입(Set)과 요소 타입(Int) 모두 알 수 있게 선언.
let dSet = Set<Int>() // 생성자 호출로 생성

print(aSet)// [1,3,2] (다른 순서도 가능)
print(bSet) // ["Jade","Jiwoo","Swimmer"] (다른 순서도 가능)

// Set은 언제 사용하는가

// Set의 요소 값과, Dictionary의 'Key'는 Hashable 하다.
// -> 따라서, 정렬속도 보다, 검색속도가 중요한 경우에 사용한다.
// -> 검색에 내부적으로 Hashing 알고리즘을 사용한다.

// Set의 기본 기능

aSet.count
aSet.isEmpty
aSet.contains(2)
aSet.randomElement()

// - Set에는 서브스크립트 관련 문법 없음


// Set의 update (추가, 삽입, 교체)
// 딕셔너리와 마찬가지로, Set도 순서가 없기 때문에 update로 추가, 교체, 삽입 전부 처리

aSet.update(with: 5) // aSet에 5 라는 새로운 요소를 추가 -> 이전의 5 값이 없으니 nil 반환
aSet.update(with: 1)
// aSet에 1 이라는 기존에 있는 요소를 추가 -> 이전에 1이 있었으니 1 반환


// Set의 remove (삭제)
var strRemove : Set = ["J","K","T"]

// 요소 삭제하기
strRemove.remove("J") // 삭제한 요소를 리턴
strRemove.remove("I")// 없는 요소를 삭제하려고 할 경우, 에러는 발생하지 않고 nil 반환

// 부분집합 / 상위집합 / 서로소

var a:Set = [1,2,3,4,5,6,7,8,9]
var b:Set = [1,3,5,7,9] // a는 b의 SuperSet, b는 a의 SubSet.
var c:Set = [2,4,6,8,10]
var d:Set = [1,7,5,9,3]

b.isSubset(of: a) // b가 a의 부분집합인지의 여부를 true / false 로 출력
b.isStrictSubset(of: a) // b가 a의 진부분집합인지의 여부를 true / false로 출력
// 참고) 진부분집합 : a가 b의 부분집합일때, a가 b와 동일한 집합이 아니면 진부분집합.

a.isSuperset(of: b) // a가 b의 상위집합인지의 여부를 ''
a.isStrictSuperset(of: b) // a가 b의 진상위집합인지 여부를 ''

// 서로소 인지 여부를 리턴하는 함수.
// 서로소 : 두 집합의 공통되는 원소가 한개도 없을때 두 집합은 서로소.

d.isDisjoint(with: c) //true

//합집합
var unuionSet = b.union(c)
var fUnionSet = b.formUnion(c) // c와의 합집합으로 b 원본을 변경
//교집합
var interSet = b.intersection(a)
//차집합
var subSet = a.subtracting(b)
//대칭차집합
var summetricSet = a.symmetricDifference(b)
