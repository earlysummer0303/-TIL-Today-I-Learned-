

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel! // IBOutlet 변수는 반드시 viewDidLoad() 함수 위에 기재.
    // 옵셔널을 강제추출한 타입
    
    
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        // 앱의 해당 화면에 처음 들어오면 실행되는 함수.
        super.viewDidLoad()
        
        mainLabel.text = "방가방가"
        
    }

    
    var pressedCount : Int = 0
    @IBAction func buttonPressed(_ sender: UIButton) {
        // 버튼을 viewDidLoad() 아래에 적어주면, 디폴트로 IBAction 으로 설정됨.
        // IBAction -> 함수 형태 (버튼을 누르면 sender로 그 액션을 input으로 받아 실행하는 액션의 함수.)
        // 파라미터 명은 관습적으로 sender라고 한다.
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1) //
        // 버튼을 누르는 인풋을 받으면, mainLabel의 text를 변경.
        pressedCount += 1
        if pressedCount % 2 == 1 {
            mainButton.backgroundColor = UIColor.blue
            mainButton.setTitleColor(.white, for: .normal)
        } else {
            mainButton.backgroundColor = UIColor.red
            mainButton.setTitleColor(.yellow, for: .normal)
        }
    }
    
    

}

