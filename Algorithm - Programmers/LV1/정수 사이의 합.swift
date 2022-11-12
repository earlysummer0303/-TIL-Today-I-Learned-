func solution(_ a:Int, _ b:Int) -> Int64 {
    var fir = a
    var sec = b
    var sum = 0
    if a == b {
        return Int64(a)
    }
    if a > b {
        fir = b
        sec = a
    }
    for i in fir...sec{
        sum = sum + i
    }
    return Int64(sum)
}