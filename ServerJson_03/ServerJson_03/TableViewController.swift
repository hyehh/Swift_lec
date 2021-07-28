//
//  TableViewController.swift
//  ServerJson_03
//
//  Created by Hyeji on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    var feedItem: NSArray = NSArray() // NSMutableArray 가능!
    var serverImage: UIImage? = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonModel = JsonModel()
        jsonModel.delegate = self
        // downloadItems - items 만들어줌!
        jsonModel.downloadItems() // JsonModel의 downloadItems 함수 실행
        listTableView.rowHeight = 130
        image()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        let item: DBModel = feedItem[indexPath.row] as! DBModel
                
        cell.imgView.image = serverImage
        //cell.imgView.frame.width =
        cell.imgView.layer.cornerRadius = cell.imgView.frame.height / 2
        cell.imgView.clipsToBounds = true
        cell.lblName.text = "성명 : \(item.sname!)"
        cell.lblPhone.text = "전화번호 : \(item.sphone!)"
        
        return cell
    }
    
    func image() {
        let url = URL(string: "http://192.168.0.92:8080/ios/pencil.png")
        let data = try? Data(contentsOf: url!)
        serverImage = UIImage(data: data!)
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
