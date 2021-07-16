//
//  ViewController.swift
//  EvenSum
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
    } // viewDidLoad

    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnCalc(_ sender: UIButton) {
        self.view.endEditing(true)
        
        // guard 문은 nil 체크해야 할 경우에만 사용하기!
        // 이 문제는 간단한 문제이기 때문에 guard 문 보다는 ! 가 코드 간결하게 해줌
        // ! 을 사용하려면 다 체크한 후에 체크할 게 더이상 없고 계산할 수 있는 상황이 된다면 그 때 ! 사용하기
        // guard let은 체크 처리를 해주기 때문에 상관없지만 ! 를 쓰려면 반드시 체크하고 사용하기!!
        guard let strFisrtNum = tfFirstNum.text else { return }
        guard let strSecondNum = tfSecondNum.text else { return }
        // 사용이 가능하긴 하지만, 비어있는 값 체크가 어려워짐!
        // guard let strFisrtNum = Int(tfFirstNum.text!) else { return }
        
        if strFisrtNum.isEmpty == true{
            lblResult.text = "1번 숫자에 짝수를 입력해주세요!"
        }else if strSecondNum.isEmpty == true{
            lblResult.text = "2번 숫자에 짝수를 입력해주세요!"
        }else{
            guard let intFirstNum = Int(strFisrtNum) else { return }
            guard let intSecondNum = Int(strSecondNum) else { return }
            
            let result = checkEven(intFirstNum, intSecondNum)
            
            if result == 1{
                lblResult.text = "1번 숫자에 짝수를 입력해주세요!"
            }else if result == 2{
                lblResult.text = "2번 숫자에 짝수를 입력해주세요!"
            }else{
                sum(intFirstNum, intSecondNum)
            }
        }
        
    } // btnCalc
    
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
    
} // ViewController

