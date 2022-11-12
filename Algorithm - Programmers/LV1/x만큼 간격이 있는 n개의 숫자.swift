func solution(_ x:Int, _ n:Int) -> [Int64] {
    var arr : [Int64] = []
    for i in 0...n-1 {
        arr.append(Int64(x*(i+1)))
    }
    return arr
}