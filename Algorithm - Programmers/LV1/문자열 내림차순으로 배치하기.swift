func solution(_ s:String) -> String {
    var str = s
    var newArr : [Character] = []
    var newStr = ""
    for c in str {
        newArr.append(c)
    }
    for i in 0...newArr.count-2 { 
        for j in i+1...newArr.count-1 {
            if newArr[i] < newArr[j] {
                var temp = newArr[i]
                newArr[i] = newArr[j]
                newArr[j] = temp
            }
        }
    }
    for element in newArr {
        newStr = newStr + String(element)
    }
    return newStr
}
