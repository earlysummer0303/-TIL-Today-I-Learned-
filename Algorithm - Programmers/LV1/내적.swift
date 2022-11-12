import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sum = 0
    for i in 0...a.count-1{
        sum = sum+a[i]*b[i]
    }
    return sum
}
