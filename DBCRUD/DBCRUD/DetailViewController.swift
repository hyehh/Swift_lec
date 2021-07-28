//
//  DetailViewController.swift
//  DBCRUD
//
//  Created by Hyeji on 2021/07/28.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var list = NSMutableArray()
    // var list = [DBModel]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let item: DBModel = list[0] as! DBModel
        tfCode.text = item.scode
        tfName.text = item.sname
        tfDept.text = item.sdept
        tfPhone.text = item.sphone
    }
    
    func receivedData(_ receivedData: DBModel) {
        list = [receivedData]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        let code = tfCode.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = tfPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let updateModel = UpdateModel()
        let result = updateModel.UpdateItems(code: code!, name: name!, dept: dept!, phone: phone!)
                
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "수정되었습니다!", preferredStyle: .alert)
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
    
    @IBAction func btnDelete(_ sender: UIButton) {
        let deleteModel = DeleteModel()
        let result = deleteModel.DeleteItems(code: (list[0] as! String))
                
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "삭제가 완료되었습니다!", preferredStyle: .alert)
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
