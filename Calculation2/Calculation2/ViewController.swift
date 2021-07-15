//
//  ViewController.swift
//  Calculation2
//
//  Created by Hyeji on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    // ! 는 nil 허용하겠다고 선언한 것임!
    @IBOutlet weak var tfFirstNum: UITextField!
    @IBOutlet weak var tfSecondNum: UITextField!
    @IBOutlet weak var tfAdd: UITextField!
    @IBOutlet weak var tfMinus: UITextField!
    @IBOutlet weak var tfMultiple: UITextField!
    @IBOutlet weak var tfQuotient: UITextField!
    @IBOutlet weak var tfRemainder: UITextField!
    @IBOutlet weak var lblText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblText.text = "숫자를 입력하세요!"
        
        // read only 로 tf 변경
//        tfAdd.isUserInteractionEnabled = false
//        tfMinus.isUserInteractionEnabled = false
//        tfMultiple.isUserInteractionEnabled = false
//        tfQuotient.isUserInteractionEnabled = false
//        tfRemainder.isUserInteractionEnabled = false
        
        readOnly()
        
    } // viewDidLoad

    // keyboard 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // self -> 자바에서 this
        // view는 전체 , safearea는 view에서 시간 나오는 부분 제외된 것
        self.view.endEditing(true)
    } // touchesBegan
    
    @IBAction func btnCalc(_ sender: UIButton) { // Any는 메모리가 너무 커서 사용 안하는 것이 좋음!
        
        // Optional 제거
        // if let 보다 guard let을 더 많이 사용
        // guard let 사용 시 optional 빠지게 됨! 즉, ! 와 같은 역할을 해줌
        guard let strNum1 = tfFirstNum.text else { return }
        guard let strNum2 = tfSecondNum.text else { return }
        
        // check 까지는 본인 함수에서 하는 게 좋음! 계산만 다른 함수로 보냄!
        if strNum1.isEmpty == true{
            tfFirstNum.becomeFirstResponder()
            lblText.text = "첫번째 숫자를 입력하세요!"
        }else if strNum2.isEmpty == true{
            tfSecondNum.becomeFirstResponder()
            lblText.text = "두 번째 숫자를 입력하세요!"
        }else{
            let num1 = Int(strNum1)!
            let num2 = Int(strNum2)!
            calculation(num1, num2)
            // func calculation(num1: Int, num2: Int) 이런 식으로 쓰려면 아래처럼 써야 함!
            // calculation(num1: num1, num2: num2) // 변수 이름이 보임
        }
        
////        if tfFirstNum.text?.count == 0 || tfSecondNum.text?.count == 0{
//        if tfFirstNum.text?.isEmpty == true{
//            // 커서 위치 지정
//            tfFirstNum.becomeFirstResponder()
//            lblText.text = "첫 번째 숫자를 입력하세요!"
//        }else if tfSecondNum.text?.isEmpty == true{
//            tfSecondNum.becomeFirstResponder()
//            lblText.text = "두 번째 숫자를 입력하세요!"
//        }else{
//            tfAdd.text = String(Int(tfFirstNum.text!)! + Int(tfSecondNum.text!)!)
//            tfMinus.text = String(Int(tfFirstNum.text!)! - Int(tfSecondNum.text!)!)
//            tfMultiple.text = String(Int(tfFirstNum.text!)! * Int(tfSecondNum.text!)!)
//
//            if tfSecondNum.text == "0"{
//                tfQuotient.text = "계산 불가"
//                tfRemainder.text = "계산 불가"
//            }else{
//                tfQuotient.text = String(Int(tfFirstNum.text!)! / Int(tfSecondNum.text!)!)
//                tfRemainder.text = String(Int(tfFirstNum.text!)! % Int(tfSecondNum.text!)!)
//            }
//            lblText.text = "계산이 완료되었습니다!"
//            // 계산 완료 시 키보드 없애기
//            self.view.endEditing(true)
//        }
        


    } // btnCalc
    
    // 계산 결과값 read only로 처리하는 함수
    func readOnly() {
        tfAdd.isUserInteractionEnabled = false
        tfMinus.isUserInteractionEnabled = false
        tfMultiple.isUserInteractionEnabled = false
        tfQuotient.isUserInteractionEnabled = false
        tfRemainder.isUserInteractionEnabled = false
    } // readOnly
    
    // 계산 함수
    // 변수 이름을 보여주고 싶지 않을 때 _ 사용하면 해결됨!
    func calculation(_ num1: Int, _ num2: Int){
        tfAdd.text = String(num1 + num2)
        tfMinus.text = String(num1 - num2)
        tfMultiple.text = String(num1 * num2)
        
        if num2 == 0{
            tfQuotient.text = "계산 불가"
            tfRemainder.text = "계산 불가"
        }else{
            tfQuotient.text = String(num1 / num2)
            tfRemainder.text = String(num1 % num2)
        }
        
        lblText.text = "계산이 완료되었습니다!"
        // 계산 완료 시 키보드 없애기
        self.view.endEditing(true)
    } // calculation
    
} // ViewController

