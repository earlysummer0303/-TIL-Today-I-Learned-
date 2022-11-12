func solution(_ n:Int) -> String {
    var sum = ""
    for i in 1...n{
        if i%2==1{
            sum = sum + "수"
        }
        else{
            sum = sum + "박"
        }
    }
    return sum
}
