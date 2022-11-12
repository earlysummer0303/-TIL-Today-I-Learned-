func solution(_ x:Int) -> Bool { 
    var input = x //12
    var sum = 0
    while input/10 != 0 { 
        sum = sum + input % 10 
        input = input / 10 
    }
    sum = sum + input % 10 
    if x % sum == 0 {
        return true
    }
    else {
        return false
    }
}