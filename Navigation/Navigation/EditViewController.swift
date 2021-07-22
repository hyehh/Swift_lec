//
//  EditViewController.swift
//  Navigation
//
//  Created by Hyeji on 2021/07/22.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    
    // 앞에 있는 ViewController가 여기에다 글씨를 써줄 것임!
    var textWayValue: String = "" // 이제 여기에 데이터가 들어올 것
    var textMessage: String = "" // textField가 여기에 정보를 넣어줌!
    // viewDidLoad 위에 추가!
    var delegate: EditDelegate? // 옵셔널임!
    var isOn: Bool = false // 상태변수 사용
    
    override func viewDidLoad() { // 뒤에 있는 viewDidLoad는 뷰가 새로 띄어질 때마다 계속 실행됨!
        // 화면이 없어졌다가 실행되면 다시 실행됨! (근데 ViewController의 viewDidLoad는 딱 한 번만 실행됨!)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue // 받은 데이터 띄워주기
        tfMessage.text = textMessage
        // switch 세팅
        swIsOn.isOn = isOn // 받은 데이터에 따라 스위치 켜짐 꺼짐 유무 달라짐
        switch isOn {
        case true:
            lblOnOff.text = "On"
        default:
            lblOnOff.text = "Off"
        }
    }

    @IBAction func btnDone(_ sender: UIButton) {
        self.view.endEditing(true)
        // 메인화면으로 값을 넘겨줌
        if delegate != nil {
            // nil 이 아니면 delegate를 통해서 메세지를 넘겨줄께! (이제 함수 실행시키는 것!)
            delegate?.didMessageEditDone(self, message: tfMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn) // 이미 ViewController에서 delegate 실행 완료된 상태
        }
        // 파이썬에서의 pop: 맨 뒤에 부터 차례대로 없앤다!
        // 즉, 위에 있는 view 죽이고 다시 원래 main view 등장!
        // true 하면 화면 전환 부드럽게 됨
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
            lblOnOff.text = "On"
        }else {
            isOn = false
            lblOnOff.text = "Off"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
