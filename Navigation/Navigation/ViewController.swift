//
//  ViewController.swift
//  Navigation
//
//  Created by Hyeji on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn = true // 상태변수 사용
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Segue를 통해서 넘어감! -> Segue 정보만 알면됨
    // Segue 사용하는 function (prepare)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // EditViewController랑 연결된 segue라는 것을 알려줌!
        let editViewController = segue.destination as! EditViewController // for segue에서 받아온 segue (for 로 써도 되고 segue로 써도 됨)
        // -> view가 segue.destination
        
        // editViewController의 instance를 만들어 값을 줬다고 생각하기
        // editViewController도 class다!
        // segue.identifier 글자 비교
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "Segue : Use Button"
        } else {
            editViewController.textWayValue = "Segue : Use Bar Button"
        }
        // 메세지 editViewController로 보내주기!
        editViewController.textMessage = tfMessage.text!
        // editViewController 랑 신호 주고 받는게 prepare 밖에 없음! 그래서 segue 통해서 날라갈 때 연결시켜줘야 함!
        editViewController.isOn = isOn // editViewController의 isOn = ViewController의 isOn
        // 나의 isOn 상태를 editViewController에 전달시킴
        editViewController.delegate = self // 여기서 연결시켜줘야 함!
    }

}

extension ViewController: EditDelegate { // 여기에 변화가 생겨야 하기 때문에 여기에서 extension
    
    // 우리가 delegate에서 만든 것!
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message // message 가 넘겨 받은 message 임!
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        switch isOn { // 넘겨 받은 isOn
        case true:
            imgView.image = imgOn
            self.isOn = true // 내가 가진 isOn
        default:
            imgView.image = imgOff
            self.isOn = false
        }
    }
}
