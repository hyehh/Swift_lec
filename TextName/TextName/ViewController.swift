//
//  ViewController.swift
//  TextName
//
//  Created by Hyeji on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    // ?는 nil 가능, 값 있는 것도 가능! 근데, !는 nil이 있을 수 없음!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var tfText: UITextField!    
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "환영 합니다!"
    }

    @IBAction func btnSend(_ sender: UIButton) {
        //lblText.text = tfText.text
        // if tfText.text?.count == 0{ // count는 Int 타입!
        if tfText.text?.isEmpty == true{
            // 입력 안했으면!
            // is Empty 가 bool 타입이기 때문에 true false 적어줘야 함!
            lblMessage.text = "텍스트를 입력하세요!"
        }else{
            // @IBOutlet weak var tfText: UITextField!
            // 위에 UITextField! 이렇게 !가 적혀있기 때문에 tfText.text!에서도 ! 사용해서 풀어줘야 함!
            // text 클릭 후, option 버튼 클릭 시 var text: String? { get set } -> ?가 뜬다!
            // 즉, ?는 nil을 허용한다는 개념이기 때문에 그걸 허용하지 못하도록 ! 로 변경시켜야 함! 위에서 !로 선언해주었기 때문
            // textfield는 처음에 만들어졌을 때 nil이 아닌 값으로 만들어 진다! (즉, 값이 있는 상태로 만들어진다는 의미)
            lblText.text?.append(" " + tfText.text!)
            // lblText.text = "Welcome! \(tfText.text!)"
            lblMessage.text = "텍스트를 추가했습니다!"
        }

    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblText.text = "Welcome!"
        // lblText.text = "Welcome!"
        tfText.text?.removeAll()
        lblMessage.text = "화면 초기상태 입니다."
    }
}

