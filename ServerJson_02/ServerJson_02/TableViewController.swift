//
//  TableViewController.swift
//  ServerJson_02
//
//  Created by Hyeji on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {

    // Storage : strong / weak
    // 종료하지 않고 다른 거 보면 없어지는 data - weak
    // 앱을 종료해야 없어지는 data - strong
    @IBOutlet var listTableView: UITableView!
    var feedItem: NSArray = NSArray() // NSMutableArray 가능!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonModel = JsonModel()
        jsonModel.delegate = self // 여기 self 통해서 데이터가 들어온다!
        // downloadItems - items 만들어줌!
        jsonModel.downloadItems() // JsonModel의 downloadItems 함수 실행
        
        // cell 크기 정의
        listTableView.rowHeight = 124
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    // reloadData 시 작동
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // reloadData 시 작동
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    // reloadData 시 작동
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        let item: DBModel = feedItem[indexPath.row] as! DBModel
        
        cell.lblCode.text = "학번 : \(item.scode!)"
        cell.lblName.text = "성명 : \(item.sname!)"
        cell.lblDept.text = "전공 : \(item.sdept!)"
        cell.lblPhone.text = "전화번호 : \(item.sphone!)"

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
