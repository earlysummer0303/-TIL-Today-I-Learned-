import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var arr = absolutes
    var sum = 0
    for i in 0...arr.count-1 {
        if signs[i] == false {
            arr[i] = -arr[i]
        }
    }
    for item in arr{
        sum = sum+item
    }
    
    return sum
}