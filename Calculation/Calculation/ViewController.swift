//
//  ViewController.swift
//  Calculation
//
//  Created by TJ on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfFirst: UITextField!
    @IBOutlet weak var tfSecond: UITextField!
    @IBOutlet weak var tfAdd: UITextField!
    @IBOutlet weak var tfMinus: UITextField!
    @IBOutlet weak var tfMul: UITextField!
    @IBOutlet weak var tfDivision: UITextField!
    @IBOutlet weak var tfQuotient: UITextField!
    @IBOutlet weak var tfRemainder: UITextField!
    @IBOutlet weak var lblText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblText.text = "첫 번째 숫자와 두 번째 숫자를 입력해주세요!"
    }

    // keyboard 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // self -> 자바에서 this
        // view는 전체 , safearea는 view에서 시간 나오는 부분 제외된 것
        self.view.endEditing(true)
    }
    
    @IBAction func btnResult(_ sender: UIButton) {
        // 계산하기 버튼 클릭 시 결과 값 출력하기
        if tfFirst.text?.isEmpty == true || tfSecond.text?.isEmpty == true{
            lblText.text = "숫자를 입력해주세요!"
        }else{
            tfAdd.text = ""
            tfMinus.text = ""
            tfMul.text = ""
            tfDivision.text = ""
            tfQuotient.text = ""
            tfRemainder.text = ""
            
            let firstNum = Int(tfFirst.text!)
            let secondNum = Int(tfSecond.text!)
            let doubleFirstNum = Double(tfFirst.text!)
            let doubleSecondNum = Double(tfSecond.text!)
            
            tfAdd.text?.append(String(firstNum!+secondNum!))
            tfMinus.text?.append(String(firstNum!-secondNum!))
            tfMul.text?.append(String(firstNum!*secondNum!))
            tfDivision.text?.append(String(doubleFirstNum!/doubleSecondNum!))
            tfQuotient.text?.append(String(firstNum!/secondNum!))
            tfRemainder.text?.append(String(firstNum!%secondNum!))
            
            lblText.text = "결과가 출력되었습니다!"
        }
        
    }
}

