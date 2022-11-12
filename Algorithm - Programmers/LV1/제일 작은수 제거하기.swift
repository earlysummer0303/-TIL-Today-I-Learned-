func solution(_ arr:[Int]) -> [Int] {
    var oldArr = arr
    var newArr = arr
    guard oldArr.count > 1 else {return [-1]}
    oldArr.sort()
    var min = oldArr.first!
    var idx = arr.firstIndex(of:min)!
    newArr.remove(at:idx)
    return newArrw
}