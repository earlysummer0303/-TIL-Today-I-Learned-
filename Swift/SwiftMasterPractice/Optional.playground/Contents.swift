import Foundation

// 옵셔널

// cpu가 값이 없는 메모리 영역에 접근했을때 발생하는 에러를 방지하기 위해 생긴 새로운 타입.
// 기본 타입에 ? 을 붙인 형태로 표현.
// 기본 타입의 값과, '값이 없음'을 표현하는 키워드인 'nil'을 포괄하는 데이터를 한 겹으로 감싼 임시 데이터 형태의 타입.
// 엄밀히 말하면 enum 타입이다.(기본 데이터타입 + nil을 포괄하는)
// 실제로 옵셔널 안의 값을 사용하기 위해, 옵셔널 변수를 Unwrapping 하여 그 안의 값을 사용.


//1. optional 데이터를 묵시적으로 사용할 수 있나?

// var opt = nil -> 에러, 옵셔널 값 중 nil 은 묵시적으로 사용할 수 없다. (이유: 어떤 타입의 옵셔널 타입인지 알수 없는 표현)
var opt : Int? = nil // 이렇게 명시적으로 옵셔널데이터 타입을 밝히고 사용해야함.


//2. optional 데이터를 출력해보면?

var opt_1 : Int? = 3
print(opt_1) // Optional(3) , 값이 옵셔널 이라는 임시 데이터 형태로 싸져있다.

//3. optional을 초기화하지 않고 출력하면?

var optionalStr : String?
print(optionalStr) // nil, 초기화 되지 않은 옵셔널의 기본 값은 nil 이다.


//4. 옵셔널의 정식 표기법

var newOpt : Int? // 간편한 표기
var realOpt : Optional<Int> // 정식 표기


//5. 옵셔널타입은 반드시 변수로 선언한다.

let letOpt : Int? = nil // 이 경우 옵셔널변수에 값이 들어올 수 있는 가능성이 전혀없기 때문에 옵셔널을 상수로 선언하면 안됨.
var varOpt : Int? = nil // 옵셔널은 변수로 선언하는것이 바람직.


//6. 옵셔널 값을 복사해 새로운 변수에 담는다면?

var a : Int? = 3
var b = a
print(b) // Optional(3)
// +) 옵셔널 Int 변수에 Int 리터럴을 담는다면

var c = 5
b = c
print(b) // Optional(5)

// ⭐️ 옵셔널 타입끼리는 연산이 불가능 하다 ! 연산을 하고싶으면 값을 unwrapping 해서 연산해야함
// Int 값을 Int? 변수에 담을 수는 있지만, Int? 값을 Int 변수에 담을 수는 없다.




// Optional Unwrapping

// 옵셔널타입으로부터 값을 추출하는 방법.

//1) 강제 추출 (Forced Unwrapping)

//nil이 아닌 값이 있다는 것을 확신하고 강제로 값을 추출 -> 까놓고 봤는데 값이 없으면 에러남
// ! : 강제 추출 연산자
var fu : Int? = 5

print(fu!)


//2) nil이 아닌지 확인 후 강제 추출

//if문을 통해, nil이 아니라는것을 먼저 확인한 후 강제추출하는 방식.

if fu != nil {
    print(fu!)
}

//3) ⭐️⭐️⭐️⭐️ 옵셔널 바인딩 ⭐️⭐️⭐️⭐️ -> 값을 우아하게 벗기기~~

// 옵셔널이 특정 상수에 바인딩이 된다면, 특정 작업을 하겠다는 이야기

// if - let 구문을 통한 옵셔널 바인딩
if let bind = fu {
    // 옵셔널인 fu 가 bind 에 바인딩 된다면
    // nil이 아니라는 의미.
    print("바인딩 완료 , -> \(bind)")
}
// 참고 ~ nil이 아닌 옵셔널이, 옵셔널이 아닌 타입의 변수에 담기면 자동으로 언래핑 된 값이 담긴다. (nil일 경우 바인딩되지 않음)


// guard - let 구문을 통한 옵셔널 바인딩
// 실제로 앱을 만들때 guard-let 옵셔널 바인딩을 많이 활용.
// guard문은 함수에서 사용한다.


func guardLetBind (_ input : String?){
    
    guard let bind = input else {
        print("바인딩 실패")
        return}
    // ⭐️ 가드문에서 선언된 변수를 아래 코드에서도 사용 가능하다!(동일한 스코프로 취급)
    print ("바인딩 완료, -> \(bind)") // bind 상수 사용 가능
    
}

let opt1 : String? = nil
let opt2 : String? = "냐냐"

guardLetBind(opt1)
guardLetBind(opt2)


// 닐 코어래싱 (Nil - Coalescing) 연산자를 사용하는 방법
// Coalesce ~ '더 큰 덩어리로 합치다' 라는 뜻
// 옵셔널 표현식 뒤에 기본값을 제시해서, 옵셔널이 nil 값일 가능성을 없애는것 (즉 옵셔널 자체의 가능성을 없앰)

var oneOpt :String? = nil

var nilOpt = oneOpt ?? "내가디폴트다" // 이때, nilOpt의 경우, nil일 가능성이 전혀 없으면서도, 옵셔널형식으로 명시적 선언이 되어있지 않기 때문에 String 타입이다.

print(nilOpt) // oneOpt = nil 일 경우 -> 내가 디폴트다

// 닐 코어래싱은 삼항연산자와 비슷하다 -> 삼항연산으로 같은 로직을 구현할 수 있다. (그냥 참고용)

var justOpt : String? = nil
var coalOpt = justOpt != nil ? justOpt! : "아이엠 디폴트"

// coalOpt라는 변수에는, justOpt값이 nil이 아닐때 justOpt! 값이, nil일때 디폴트 문자열 값이 들어간다.



// 함수와 옵셔널 타입

// 많은 애플 내장 함수들이 옵셔널 타입의 파라미터를 가진다.

// 옵셔널 타입의 파라미터를 받는 함수가 있을때,

func doSomePrint(with label : String, name : String? = nil) {
    // 옵셔널 파라미터는 nil 로 초기화 하는 것이 일반적이다
    // 이유 ~ 굳이 값을 넣고 싶지 않을 때, 함수 호출시 해당 아규먼트까지 명시해주는것이 귀찮기 때문
    print("\(label): \(name ?? "없음")")
}

// 아래 두가지 방식으로 모두 실행 가능
doSomePrint(with : "지우")
doSomePrint(with : "지우", name : "Swimmer")






// 옵셔널 채이닝 (Optional Chaining)

// (Class, Struct와 관련된 내용) ~ 클래스, 구조체 정리 하고 다시 정리하기.


