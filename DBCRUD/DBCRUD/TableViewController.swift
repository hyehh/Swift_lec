//
//  TableViewController.swift
//  DBCRUD
//
//  Created by Hyeji on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var feedItem: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // viewDidLoad -> viewWillAppear 실행 후 화면 등장!
        // 입력하면 여기서 이 세 줄이 실행되어야 새로운 데이터가 업데이트 된다!
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
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

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            deleteData(indexPath.row)
            feedItem.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func deleteData(_ number: Int) {
        let deleteModel = DeleteModel()
        let item: DBModel = feedItem[number] as! DBModel
        let scode = item.scode
        let result = deleteModel.DeleteItems(code: scode!)
                
        if result{
        }else{
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.listTableView.indexPath(for: cell)
            let detailViewController = segue.destination as! DetailViewController
            let item: DBModel = feedItem[indexPath!.row] as! DBModel
            detailViewController.receivedData(item)
            // detailViewController.receivedData(feedItem[indexPath!.row] as! DBModel)
        }
    }
    

}

extension TableViewController: QueryModelProtocol {
    func itemDownloaded(items: NSMutableArray) {
        // NSArray를 쓴 이유? 사용하면 String과 Int같이 쓸 수 있기 때문!
        // 가져온 데이터를 넣어준 곳
        feedItem = items
        // feedItem 넣어주고 reload 시킴! (cell에 대한 부분이 한꺼번에 재구동됨)
        self.listTableView.reloadData()
    }
}
