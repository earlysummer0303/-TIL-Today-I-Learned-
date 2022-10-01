
import UIKit

class ViewController: UIViewController {
    var comChoice = Int.random(in: 1...10)
    var myChoice : Numbers = .zzero
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    
    override func viewDidLoad() {
        myChoice = .zzero
        super.viewDidLoad()
        resultLabel.text = "선택하세요"
        inputLabel.text = "당신의 선택은?"
    }

    @IBAction func pressed_1(_ sender: UIButton) {
        myChoice = .oone
        inputLabel.text = String(myChoice.rawValue)
    }
    
    
    @IBAction func pressed_2(_ sender: UIButton) {
        myChoice = .two
        inputLabel.text = String(myChoice.rawValue)
    }
    
    
    @IBAction func pressed_3(_ sender: UIButton) {
        myChoice = .three
        inputLabel.text = String(myChoice.rawValue)
    }
    
    
    @IBAction func pressed_4(_ sender: UIButton) {
        myChoice = .four
        inputLabel.text = String(myChoice.rawValue)
    }
    
    @IBAction func pressed_5(_ sender: UIButton) {
        myChoice = .five
        inputLabel.text = String(myChoice.rawValue)
    }
    
    @IBAction func pressed_6(_ sender: UIButton) {
        myChoice = .six
        inputLabel.text = String(myChoice.rawValue)
    }
    
    
    @IBAction func pressed_7(_ sender: UIButton) {
        myChoice = .seven
        inputLabel.text = String(myChoice.rawValue)
    }
    
    @IBAction func pressed_8(_ sender: UIButton) {
        myChoice = .eight
        inputLabel.text = String(myChoice.rawValue)
    }
    
    @IBAction func pressed_9(_ sender: UIButton) {
        myChoice = .nine
        inputLabel.text = String(myChoice.rawValue)
    }
    
    @IBAction func pressed_10(_ sender: UIButton) {
        myChoice = .ten
        inputLabel.text = String(myChoice.rawValue)
    }
    
    
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        self.viewDidLoad()
    }
    
    @IBAction func selectButtonPressed(_ sender: Any) {
        // 본격적인 로직
        guard myChoice != .zzero else{
            resultLabel.text = "아직 선택하지 않았습니다"
            return
        }
        if myChoice.rawValue > comChoice {
            resultLabel.text = "DOWN"
        } else if myChoice.rawValue < comChoice {
            resultLabel.text = "UP"
        } else {
            //빙고일때
            resultLabel.text = "BINGO!!🥳"
            comChoice = Int.random(in: 1...10)// 한번 맞췄으니, 다른 랜덤 수 대입.
            myChoice = .zzero // 아무것도 누르지 않고 select 버튼 다시 누르는것 방지.
        }
    }
    
    
}

