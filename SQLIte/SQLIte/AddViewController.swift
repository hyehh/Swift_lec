//
//  AddViewController.swift
//  SQLIte
//
//  Created by Hyeji on 2021/07/27.
//

import UIKit
import SQLite3

class AddViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // sqlite 연결 잘되어있는지 확인
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            // 열 수 없는 문제가 있다면
            print("Error opening database")
        }
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        var stmt: OpaquePointer?
        // 한글 깨짐 방지 위해 사용
        // -1 : 범위를 꼭 잡아줘야 함! (현재 있는 타입 빼고 이걸 포함시킨다는 의미)
        // 만약 영어만 쓴다면 아래 내용 적지 않아도 됨!
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) // 이거 정말 중요!!!
        
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = tfPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error preparing insert: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        if sqlite3_bind_text(stmt, 1, name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error binding name: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        if sqlite3_bind_text(stmt, 2, dept, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error binding dept: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        if sqlite3_bind_text(stmt, 3, phone, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error binding phone: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        // sqlite 실행
        if sqlite3_step(stmt) != SQLITE_DONE {
            // 실행했는데 잘 끝나지 않았으면!
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("failure inserting student: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        let resultAlert = UIAlertController(title: "결과", message: "입력 되었습니다!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
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
