//
//  AddViewController.swift
//  DBCRUD
//
//  Created by Hyeji on 2021/07/28.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        let code = tfCode.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = tfPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let insertModel = InsertModel()
        let result = insertModel.InsertItems(code: code!, name: name!, dept: dept!, phone: phone!)
                
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "입력되었습니다!", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }else{
            // 지역변수이기에 변수 이름 바꾸지 않아도 됨!
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생되었습니다!", preferredStyle: .alert)
            let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
