//
//  ViewController.swift
//  ButtonClick2
//
//  Created by Hyeji on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    var clickCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblText.text = "Welcome!"
    }

    @IBAction func btnClick(_ sender: UIButton) {
//        if clickCount == 0{
//            lblText.text = "Welcome! 혜지"
//            clickCount = 1
//        }else{
//            lblText.text = "Welcome!"
//            clickCount = 0
//        }
        if clickCount % 2 == 0{
            lblText.text = "Welcome! 혜지"
            clickCount += 1
        }else{
            lblText.text = "Welcome!"
            clickCount += 1
        }
    }
    
}

