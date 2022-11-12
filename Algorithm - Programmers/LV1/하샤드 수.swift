import Foundation

func solution(_ n:Int) -> Int {
    var ans = 0
    for i in 1...n-1 {
        if n % i == 1{
            ans = i
            break
        }
    }
    return ans
}