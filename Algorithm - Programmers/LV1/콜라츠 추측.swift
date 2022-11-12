func solution(_ num:Int) -> Int {
    var count = 0
    var val = num
    if num == 1 {
        return 0
    }
    // count를 구하는 코드
    while val != 1 {
        if val % 2 == 0{
            val = val / 2
            count = count+1
        } else {
            val = val*3 + 1
            count = count+1
        }
    }
    guard count < 500 else {
        return -1
    }
    return count
}