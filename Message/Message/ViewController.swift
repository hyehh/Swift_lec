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
    } // btnSend
    
    @IBAction func btnEmoji(_ sender: UIButton) {
    } // btnEmoji
    
} // ViewController

