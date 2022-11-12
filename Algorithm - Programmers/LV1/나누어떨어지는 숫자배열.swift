func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var sortedArr : [Int] = []
    for i in arr {
        if i%divisor == 0 {
            sortedArr.append(i)
        }
    }
    if sortedArr.count == 0 {
        sortedArr.append(-1)
        return sortedArr
    } 
    else if sortedArr.count == 1 {
        return sortedArr
    }
    
    for i in 0...sortedArr.count-2{
        for j in i+1...sortedArr.count-1{
            if sortedArr[i] > sortedArr[j]{
                var temp = 0
                temp = sortedArr[i]
                sortedArr[i] = sortedArr[j]
                sortedArr[j] = temp
            }
        }
    }
    return sortedArr
}