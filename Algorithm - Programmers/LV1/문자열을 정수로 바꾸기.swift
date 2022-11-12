func solution(_ s:String) -> Int {
    let conv : Int? = Int(s)
    if let val = conv {
       return val
    }
    else { return 0 }
}