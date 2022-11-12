// 내장함수 사용
func solution(_ seoul:[String]) -> String {
    var index = 0
    index = seoul.index(of: "Kim")!
    return "김서방은 \(index)에 있다"
}

// 내장함수 사용 x
func solution(_ seoul:[String]) -> String {
    var index = 0
    for i in 0...seoul.count-1 {
        if seoul[i] == "Kim"{
            index = i
            break
        }
    }
    return "김서방은 \(index)에 있다"
}