//
//  ViewController.swift
//  RPSGame
//
//  Created by 황지우 on 2022/10/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    
    @IBOutlet weak var comChoiceImg: UIImageView!
    @IBOutlet weak var myChoiceImg: UIImageView!
    
    let imgArr:[UIImage] = [UIImage(named: "scissors.png")!,UIImage(named: "rock.png")!,UIImage(named: "paper.png")!]
   
    let nameArr = ["가위","바위","보"]
    
    var userPick : Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "선택하세요"
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        comChoiceImg.image = UIImage(named: "ready.png")
        myChoiceImg.image = UIImage(named: "ready.png")
    }
    
    @IBAction func scissorButtonPressed(_ sender: UIButton) {
        userPick = 0
        resultLabel.text = "가위 선택, Select버튼을 누르세요"
    }
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        userPick = 1
        resultLabel.text = "바위 선택, Select버튼을 누르세요"
    }
    
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        userPick = 2
        resultLabel.text = "보 선택, Select버튼을 누르세요"
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        userPick = 4
        resultLabel.text = "선택하세요"
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        comChoiceImg.image = UIImage(named: "ready.png")
        myChoiceImg.image = UIImage(named: "ready.png")
    }
    
    @IBAction func selectButtonPressed(_ sender: UIButton) {
        let comPick = Int.random(in: 0...2)
        // 1. 컴퓨터의 랜덤한 선택지를 컴퓨터의 선택에 반영
        // 2. 나의 선택지를 당신의 선택에 반영
        if userPick == 4 {
            resultLabel.text = "선택하지 않았습니다."
        }else{
            comChoiceImg.image = imgArr[comPick]
            comChoiceLabel.text = nameArr[comPick]
            myChoiceImg.image = imgArr[userPick]
            myChoiceLabel.text = nameArr[userPick]
            
            //3. 누가 이겼는지 resultLabel에 표시
            // 0 - 가위, 1 - 바위, 2- 보
            
            switch (comPick,userPick){
            case (0,0),(1,1),(2,2):
                resultLabel.text = "비겼습니다"
            case (0,1),(1,2),(2,0):
                resultLabel.text = "내가이겼당"
            case (0,2),(1,0),(2,1):
                resultLabel.text = "내가졌소"
            default:
                break
            }
        }
       
        
    }
    
   
    
    
}

