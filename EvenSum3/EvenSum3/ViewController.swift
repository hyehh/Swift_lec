//
//  ViewController.swift
//  EvenSum3
//
//  Created by Hyeji on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfFirstNum: UITextField!
    @IBOutlet weak var tfSecondNum: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = "1번 숫자와 2번 숫자에 짝수를 입력해주세요!"
        tfResult.isUserInteractionEnabled = false
        tfFirstNum.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        self.view.endEditing(true)
        let intFirstNum = Int(tfFirstNum.text!) ?? 0
        let intSecondNum = Int(tfSecondNum.text!) ?? 0
        
        let result = checkEven(intFirstNum, intSecondNum)
        
        if result == 1{
            lblResult.text = "1번 숫자에 짝수를 입력해주세요!"
        }else if result == 2{
            lblResult.text = "2번 숫자에 짝수를 입력해주세요!"
        }else{
            sum(intFirstNum, intSecondNum)
        }
        
    }
    
    // 1번 숫자와 2번 숫자의 짝수 홀수 판단
    func checkEven(_ intFirstNum: Int, _ intSecondNum: Int) -> Int{
        var result = 0
        
        if intFirstNum % 2 == 1{
            result = 1
        }else if intSecondNum % 2 == 1{
            result = 2
        }else{
            result = 0
        }
        
        return result
    }
    
    func sum(_ intFirstNum: Int, _ intSecondNum: Int){
        tfResult.text = String(intFirstNum + intSecondNum)
        lblResult.text = "계산이 완료 되었습니다."
    }
    
}

