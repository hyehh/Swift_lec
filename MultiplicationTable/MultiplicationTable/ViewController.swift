//
//  ViewController.swift
//  MultiplicationTable
//
//  Created by Hyeji on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNumber: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = "숫자를 입력해주세요!"
        tvResult.isEditable = false
    }

    @IBAction func btnClick(_ sender: UIButton) {
        guard let intNumber = Int(tfNumber.text!) else {
            lblResult.text = "숫자를 입력해주세요!"
            return }
        
        for i in 1...9{
            tvResult.text += "\(intNumber) X \(i) = \(intNumber * i) \n"
        }
        
        lblResult.text = "\(intNumber)단 계산이 완료되었습니다!"
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

