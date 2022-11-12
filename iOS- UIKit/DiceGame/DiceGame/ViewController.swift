//
//  ViewController.swift
//  DiceGame
//
//  Created by 황지우 on 2022/10/01.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var leftDiceImage: UIImageView!
    
    @IBOutlet weak var rightDiceImage: UIImageView!
    
    var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    // 앱의 화면에 들어오면 가장 먼저 실행되는 함수.-> 재정의
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        // 첫번째 이미지뷰의 이미지를 랜덤으로 변경
        // 두번째 이미지뷰의 이미지를 랜덤으로 변경
        rightDiceImage.image = diceArray.randomElement()
        leftDiceImage.image = diceArray.randomElement()
    
    }

}
