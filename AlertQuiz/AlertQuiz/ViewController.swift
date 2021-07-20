//
//  ViewController.swift
//  AlertQuiz
//
//  Created by Hyeji on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblFirstNum: UILabel!
    @IBOutlet weak var lblSecondNum: UILabel!
    @IBOutlet weak var tfInput: UITextField!
    
    var answer = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setting()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnOK(_ sender: UIButton) {
        self.view.endEditing(true)
        guard let intInput = Int(tfInput.text!) else { return }

        check(intInput)
    }
    
    func random() -> String {
        return String(Int.random(in: 1...9))
    }
    
    func setting(){
        // 왼쪽에 옵셔널 값이 있는 건 상관 없다! 오른쪽에 옵셔널 값이 있을 때에만 옵셔널을 unwrapping하거나 옵셔널 바인딩 하는 과정이 필요한 것임!
        lblFirstNum.text = random()
        lblSecondNum.text = random()
                
        guard let firstNum = Int(lblFirstNum.text!) else { return }
        guard let secondNum = Int(lblSecondNum.text!) else { return }
        
        calc(firstNum, secondNum)
    }
    
    func calc(_ firstNum: Int, _ secondNum: Int){
        answer = firstNum * secondNum
        // print(answer)
    }
    
    func check(_ intInput: Int) {
        if answer == intInput{
            let alertPass = UIAlertController(title: "결과", message: "정답 입니다!", preferredStyle: .alert)
            let passAction = UIAlertAction(title: "다음 문제 진행", style: .default, handler: {ACTION in
                self.setting()
                self.tfInput.text = ""
                self.tfInput.becomeFirstResponder()
            })
            
            alertPass.addAction(passAction)
            present(alertPass, animated: true, completion: nil)
        }else{
            let alertFail = UIAlertController(title: "결과", message: "정답이 아닙니다!", preferredStyle: .alert)
            let failAction = UIAlertAction(title: "다시 풀기", style: .default, handler: {ACTION in
                self.tfInput.text = ""
                self.tfInput.becomeFirstResponder()
            })
            
            alertFail.addAction(failAction)
            present(alertFail, animated: true, completion: nil)
        }
    }
}

