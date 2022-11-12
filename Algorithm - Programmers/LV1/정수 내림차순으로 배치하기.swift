func solution(_ n:Int64) -> Int64 {
    var input = n
    var arr : [Int64] = []
    var temp : Int64 = 0
    var stringSum = ""
    if n/10 == 0 {
        return n
    }
    // 배열에 추가 
    while input != 0 { 
        arr.append(input%10)  
        input = input/10 
    }
    //정렬
    for i in 0...arr.count-2 {
        for j in i+1...arr.count-1{
            if arr[i] < arr[j] {
                temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
    }
    // int64 -> string
    for i in 0...arr.count-1{
        stringSum = stringSum + String(arr[i])
    }
    
    return Int64(stringSum)!
}