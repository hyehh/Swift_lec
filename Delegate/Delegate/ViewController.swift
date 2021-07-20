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
        lblResult.text = tfInput.text
    }
    
} // ViewController

// return 눌렀을 때 button을 누른 것과 동일한 기능을 추가하고 싶은 경우
// UITextFieldDelegate -> delegate!!!
extension ViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // return 버튼 눌렀을 때 할 일
        lblResult.text = tfInput.text
        return true
    }
    
}
