

import Foundation

// 메인함수와 동일한 시작점

// Debug Area에서 사용자 입력을 받아오는 함수 -> readLine()
// 사용자가 맞출때까지 up,down 반복
// 1~100 사이의 수 컴퓨터가 결정

let comChoice = Int.random(in: 1...100)
print("1~100 사이의 숫자를 골랐으니 맞춰보시지!")

while true {
    if let userChoice = readLine() {
        if let userInt = Int(userChoice){ // 유저 인풋이 Int값으로 잘 변환이 되었으면
            if userInt > comChoice{
                print("Down")
            }
            else if userInt < comChoice{
                print("Up")
            }
            else { break }
         }
    }
}

print("Bingo!!")


