//
//  ViewController.swift
//  TextName
//
//  Created by Hyeji on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var tfText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        //lblText.text = tfText.text
        lblText.text?.append(" " + tfText.text!)
    }
    
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblText.text = "Welcome!"
    }
}

