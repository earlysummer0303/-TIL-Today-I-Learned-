func solution(_ phone_number:String) -> String {
    var strArr : [String] = []
    var clearNum : String = ""
    var hiddenNum : String = ""
    for i in phone_number {
        strArr.append(String(i))
    }
    guard strArr.count > 4 else {return phone_number}
    for i in strArr.count-4...strArr.count-1 {
        clearNum = clearNum + strArr[i]
    }
    for i in 1...strArr.count-4 {
        hiddenNum = hiddenNum + "*"
    }
    
    return hiddenNum+clearNum
    
}