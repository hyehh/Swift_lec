//
//  TableViewController.swift
//  ServerJson_01
//
//  Created by Hyeji on 2021/07/27.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    // NSArray 사용하는 이유는 String과 Int를 같이 사용할 수 있기 때문
    // NSArray 배열 중에 가장 큰 배열임!
    var feedItem: NSArray = NSArray() // NSMutableArray 가능!

    override func viewDidLoad() {
        super.viewDidLoad()

        // instance 만들기 (new 글자만 없지 자바에서 했던 작업과 동일)
        let jsonModel = JsonModel()
        jsonModel.delegate = self
        // downloadItems - items 만들어줌!
        jsonModel.downloadItems() // JsonModel의 downloadItems 함수 실행
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UITableViewCell 안만들고 default 된 거 사용한 것임! UITableViewCell default 값이라 사용 가능!
        // 처음부터 recycler view임!! swift에서 list view는 recycler view다!
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        // DBModel로 바꿔줘야 item.sname 뽑아서 사용 가능
        let item: DBModel = feedItem[indexPath.row] as! DBModel
        
        cell.textLabel?.text = "성명 : \(item.sname!)"
        cell.detailTextLabel?.text = "학번 : \(item.scode!)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: JsonModelProtocol {
    func itemDownloaded(items: NSArray) {
        // NSArray를 쓴 이유? 사용하면 String과 Int같이 쓸 수 있기 때문!
        // 가져온 데이터를 넣어준 곳
        feedItem = items
        // feedItem 넣어주고 reload 시킴! (cell에 대한 부분이 한꺼번에 재구동됨)
        self.listTableView.reloadData()
    }
}
