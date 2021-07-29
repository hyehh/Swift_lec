//
//  ViewController.swift
//  SystemLayout
//
//  Created by Hyeji on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUserId: UITextField!
    @IBOutlet weak var tfUserPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnOK(_ sender: UIButton) {
        // 버튼에 segue 이름 주지 말고 viewcontroller에 segue 이름 주기! (segue가 여러 개 있는 경우!)
        if tfUserId.text == "aaa" && tfUserPassword.text == "1111" {
            Share.userID = tfUserId.text!
            // 버튼 누를 때 특정 segue로 가게 하겠다!
            self.performSegue(withIdentifier: "afterChecking", sender: self)
        }else {
            let idAlert = UIAlertController(title: "경고", message: "ID나 암호가 불일치 합니다!", preferredStyle: .alert)
            let idAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
            idAlert.addAction(idAction)
            present(idAlert, animated: true, completion: nil)
        }
    }
    
}

