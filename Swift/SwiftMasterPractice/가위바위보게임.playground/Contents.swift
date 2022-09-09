import UIKit

// 가위바위보 게임

var randNum = Int.random(in: 0...2)
print(randNum)

switch randNum {
case 0:
    print("컴퓨터는 가위를 냈습니다 \n")
case 1:
    print("컴퓨터는 바위를 냈습니다 \n")
case 2:
    print("컴퓨터는 보를 냈습니다 \n")
default:
    break
}

var myNum : Int = 1

/*

switch myNum {
    case 0:
        print("당신은 가위를 냈습니다.\n")
        if randNum == 1{
            print("당신의 패배")
        }
        else if randNum == 2{
            print("당신의 승리")
        }
        else {
            print("비겼습니다.")
        }
    case 1:
        print("당신은 바위를 냈습니다.\n")
        if randNum == 1{
            print("비겼습니다.")
        }
        else if randNum == 2{
            print("당신의 패배")
        }
        else {
            print("당신의 승리")
        }
    case 2:
        print("당신은 보를 냈습니다.\n")
        if randNum == 1{
            print("당신의 승리")
        }
        else if randNum == 2{
            print("비겼습니다.")
        }
        else {
            print("당신의 패배")
        }
        default :
            print("0부터 2 사이의 수만을 입력해주세요")
}

 */

// 더 짧은 코드로 바꿔보기
// 내가 비기는 경우 -> 이기는 경우 -> else 로 접근

// 비기는 경우 ~ 내 숫자와 컴퓨터의 숫자가 같은 경우
switch myNum{
case 0:
    print("당신은 가위를 냈습니다.")
case 1:
    print("당신은 바위를 냈습니다.")
case 2:
    print("당신은 보를 냈습니다.")
default:
    break
}

if myNum == randNum {
    print("비겼습니다.")
}
// 이기는 경우
else if (myNum == 0 && randNum == 1)||(myNum == 1 && randNum == 0)||(myNum == 2 && randNum == 1){
    print("당신의 승리")
}
// 그 외의 경우 => 지는 경우
else {
    print("당신의 패배")
}



//랜덤 빙고 게임

var comNum = Int.random(in: 1...10)
print("컴퓨터의 숫자는 \(comNum) 입니다.")
var myPickNum = Int.random(in: 1...10)
print("당신의 숫자는 \(myPickNum) 입니다.")

switch myPickNum{
case let pick where pick < comNum :
    print("Down")
case let pick where pick > comNum :
    print("Up")
default:
    print("Bingo!")
}

