//
//  ViewController.swift
//  Delegate
//
//  Created by Hyeji on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfInput.delegate = self
    }

    @IBAction func btnAction(_ sender: UIButton) {
        lblResult.text = tfInput.text // 옵셔널 = 옵셔널
        // 옵셔널(값이 있을 수도 있고 없을 수도 있음) = 옵셔널!  + " " (값이 있다고 아예 못 박는 것)
    }
    
} // ViewController

// return 눌렀을 때 button을 누른 것과 동일한 기능을 추가하고 싶은 경우
// UITextFieldDelegate -> delegate!!!
extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // return 버튼 눌렀을 때 할 일
        lblResult.text = textField.text // tfInput.text로 특정 하지 말고 textField.text로 바꿔서 전체 textField에 대해 적용시켜주기
        // 만약, tfInput.text 특정한다면 이 안에서 switch문 돌려야 함!
        return true
    }
    
}
