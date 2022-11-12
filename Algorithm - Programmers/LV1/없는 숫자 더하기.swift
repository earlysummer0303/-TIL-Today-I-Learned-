import Foundation

func solution(_ numbers:[Int]) -> Int {
    var newSet : Set<Int> = []
    var numSet: Set<Int> = [0,1,2,3,4,5,6,7,8,9]
    var sum = 0
    for item in numbers {
        newSet.update(with:item)
    }
    var subSet = numSet.subtracting(newSet)
    for item in subSet{
        sum = sum+item
    }
    return sum
}