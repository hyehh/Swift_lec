//
//  TableViewController.swift
//  SQLIte
//
//  Created by Hyeji on 2021/07/27.
//

import UIKit
import SQLite3 // 꼭 import 해오기!!!

class TableViewController: UITableViewController {

    // 여기에 있는 변수들은 앱 실행 시 계속 남아있음!
    @IBOutlet var tvListView: UITableView!
    
    var db: OpaquePointer?
    var studentsList: [Students] = [] // 여기에 4개의 항목이 0번, 1번 에 들어갈 것임!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        // sqlite는 database가 file name
        // SQLite 생성하기 (create 있는 거 선택!)
        // appropriateFor 필요없어서 nil, 나머지는 정해져있는 것!
        // "StudentsData.sqlite" -> file name
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            // 열 수 없는 문제가 있다면
            print("Error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS students(sid INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT, sdept TEXT, sphone TEXT)", nil, nil, nil) != SQLITE_OK {
            // 이미 create table 이 있는데 오타 있다면
            // 이건 pointer 방식
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error creating table: \(errmsg)")
            // return 여기는 viewDidLoad이기에 return 으로 빠져버리면 안됨!
        }
        
        // 제일 처음 화면에 떴을 때 (한 번 실행하고 소스에서 빠짐)
        // Temporary Insert
        // tempInsert()
        
        // DB 내용 불러오기
        readValues()
    }

    override func viewWillAppear(_ animated: Bool) {
        // 데이터 베이스를 새로 불러놓고 재구성해야 한다!
        readValues()
        // tvListView.reloadData()
    }
    
    func tempInsert() {
        var stmt: OpaquePointer?
        // 한글 깨짐 방지 위해 사용
        // -1 : 범위를 꼭 잡아줘야 함! (현재 있는 타입 빼고 이걸 포함시킨다는 의미)
        // 만약 영어만 쓴다면 아래 내용 적지 않아도 됨!
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error preparing insert: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        if sqlite3_bind_text(stmt, 1, "유비", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error binding name: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        if sqlite3_bind_text(stmt, 2, "컴퓨터공학과", -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error binding dept: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        if sqlite3_bind_text(stmt, 3, "010-2222-3333", -1, SQLITE_TRANSIENT) != SQLITE_OK {
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
        
        // 오류 걸리면 return에서 빠지므로 여기까지 안옴!
        print("Students saved successfully")
        
    }
    
    func readValues() {
        // 기존에 있는 거 지워주고 다시 추가 시켜야 함! (아니면 계속 기존 배열에 추가되버림)
        studentsList.removeAll()
        
        let queryString = "SELECT * FROM students"
        
        var stmt: OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error preparing select: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        
        while (sqlite3_step(stmt) == SQLITE_ROW) { // 한 줄씩 가져와라
            // int와 string 다르게 가져옴!
            let id = sqlite3_column_int(stmt, 0) // 0번째 (int 값임)
            // text 값을 cString으로 바꿔줌
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let dept = String(cString: sqlite3_column_text(stmt, 2))
            let phone = String(cString: sqlite3_column_text(stmt, 3))
            
            print(id, dept, phone)
            
            // 이상이 없다면 이제 배열에 집어넣어주기
            // 생성자를 통해서 집어넣을 것
            studentsList.append(Students(id: Int(id), name: String(describing: name), dept: String(describing: dept), phone: String(describing: phone)))
        }
        
        // 재구성 해야함
        self.tvListView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        let students: Students // 하나의 셀에 students 에 있는 4개를 다 적을 수 있다!
        students = studentsList[indexPath.row]
        cell.textLabel?.text = "학번 : \(students.id)"
        // 이 부분이 subTitle
        cell.detailTextLabel?.text = "성명 : \(students.name!)"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            // 순서!!!!!!( 먼저 dbData 삭제부터 진행하자!!!!)
            deleteData(indexPath.row)
            studentsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func deleteData(_ number: Int) {
        var stmt: OpaquePointer?

        let id = studentsList[number].id
        let queryString = "DELETE FROM students WHERE sid = \(id)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("error preparing update: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
        // sqlite 실행
        if sqlite3_step(stmt) != SQLITE_DONE {
            // 실행했는데 잘 끝나지 않았으면!
            let errmsg = String(cString: sqlite3_errmsg(db)!) // error 코드를 줌
            print("failure deleting student: \(errmsg)")
            // return 할 께 없는데 return 적으면 그냥 이 함수에서 빠져버리는 것!
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let dataToMove = studentsList[fromIndexPath.row]
        studentsList.remove(at: fromIndexPath.row)
        studentsList.insert(dataToMove, at: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.receivedData(studentsList[indexPath!.row])
        }
    }
    

}
