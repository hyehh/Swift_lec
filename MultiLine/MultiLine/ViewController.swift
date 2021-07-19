//
//  ViewController.swift
//  MultiLine
//
//  Created by Hyeji on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    // 변수는 무조건 viewDidLoad 위에 선언하자!
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // isEditable은 Bool : true or false
        tvResult.isEditable = false // Read Only
    }

    @IBAction func btnAppend(_ sender: UIButton) {
        // 빈 칸 데이터 제외 - 스페이스랑 엔터 trimming
        let strInput = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !strInput.isEmpty{
            // tvResult.text += tfInput.text!  + "\n"
            tvResult.text.append(tfInput.text!  + "\n")
        }

    }
    
} // ViewController

