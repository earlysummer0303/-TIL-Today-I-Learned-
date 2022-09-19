import Foundation


// if - let binding

var hello : Double? = 5.5

if let h = hello {
    print("바인딩 성공 -> \(h)")
}
else {print("바인딩 실패")}


// guard - let binding

func guardLetBinding (_ input : Double?) {
    guard let i = input else {
        print("바인딩 실패")
        return}
    print("바인딩 성공 -> \(i)")
}

guardLetBinding(hello)
