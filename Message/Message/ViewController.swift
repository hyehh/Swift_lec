//
//  ViewController.swift
//  Message
//
//  Created by Hyeji on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvMessage: UITextView!
    @IBOutlet weak var tfMessage: UITextField!
    let emoji: String = "😝"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvMessage.isEditable = false
    } // viewDidLoad

    @IBAction func btnSend(_ sender: UIButton) {
        tvMessage.text += tfMessage.text! + "\n"
        self.view.endEditing(true)
    } // btnSend
    
    @IBAction func btnEmoji(_ sender: UIButton) {
        tfMessage.text! += emoji
        self.view.endEditing(true)
    } // btnEmoji
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
} // ViewController

