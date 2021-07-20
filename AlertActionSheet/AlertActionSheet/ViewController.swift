//
//  ViewController.swift
//  AlertActionSheet
//
//  Created by Hyeji on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAlert(_ sender: UIButton) {
        // Controller 초기화
        // title과 message 만들어준 것!
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        // AlertAction
        // style : .누르면 default, cancel, destructive 세 가지 존재!
        // handler : closure 모양으로 정의해야 함 {ACTION in }적기만 하면 됨
        // handler는 이 버튼을 누르면 뭐 할래?! 정의
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            // 필요한 코드 적기
            print("destructive action called.")
        })
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: {ACTION in
            print("cancel action called.")
        })
        
        // Controller와 Action 결합
        testAlert.addAction(actionDefault) // controller와 버튼이 붙어짐
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        // 화면 띄우기
        present(testAlert, animated: true, completion: nil)
    }
    
    @IBAction func btnActionSheet(_ sender: UIButton) {
        // Controller 초기화
        // title과 message 만들어준 것!
        let testAlert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        
        // style : .누르면 default, cancel, destructive 세 가지 존재!
        // handler : closure 모양으로 정의해야 함 {ACTION in }적기만 하면 됨
        // handler는 이 버튼을 누르면 뭐 할래?! 정의
        let actionDefault = UIAlertAction(title: "Action Default", style: .default, handler: nil)
        let actionDestructive = UIAlertAction(title: "Action Destructive", style: .destructive, handler: {ACTION in
            // 필요한 코드 적기
            print("destructive action called.")
        })
        let actionCancel = UIAlertAction(title: "Action Cancel", style: .cancel, handler: {ACTION in
            print("cancel action called.")
        })
        
        // Controller와 Action 결합
        testAlert.addAction(actionDefault) // controller와 버튼이 붙어짐
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionCancel)
        
        // 화면 띄우기
        present(testAlert, animated: true, completion: nil)
    }
}

