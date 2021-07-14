//
//  ViewController.swift
//  ButtonClick
//
//  Created by Hyeji on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblEmoji: UILabel!
    var emoji: String = "😝"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblEmoji.text = ""
    }

    @IBAction func btnSmile(_ sender: UIButton) {
        lblEmoji.text?.append(emoji)
    }
}

