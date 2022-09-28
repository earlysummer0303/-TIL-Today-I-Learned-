import UIKit

// 실패 가능 생성자
// 인스턴스 생성에 실패할 수도 있는 가능성을 가진 생성자

// 만약 실패가 불가능하게 선언되었을 시, 아예 에러가 나고 앱이 꺼지게 되는데, 차라리 그런것 보다 실패 가능 생성자를 정의하고, 그에 따른 예외처리를 하는게 바람직.

struct Animal {
    let species : String
    init?(species : String){
        if species.isEmpty{
            return nil
        }
        self.species = species
    }
}
