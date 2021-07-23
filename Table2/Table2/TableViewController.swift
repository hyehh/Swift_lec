//
//  TableViewController.swift
//  Table2
//
//  Created by Hyeji on 2021/07/23.
//

import UIKit

var items = ["책 구매", "훈이와 약속", "스터디 준비하기"]
var itemsImageFiles = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }
    
    // MARK: - Table view data source

    // Selection을 몇 개 사용할 것인지 return
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // Selection 당 열의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // 테이블 내용 구성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        
        // 데이터 있는 만큼 화면에 넣어주기
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: itemsImageFiles[indexPath.row])
        
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
            
            items.remove(at: indexPath.row)
            itemsImageFiles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

        // 움직이고 싶은 기존 데이터 변수에 선언하기
        let itemToMove = items[fromIndexPath.row]
        let itemImageToMove = itemsImageFiles[fromIndexPath.row]
        
        // 움직이고 싶은 기존 데이터 삭제
        items.remove(at: fromIndexPath.row)
        itemsImageFiles.remove(at: fromIndexPath.row)
        
        // 변수에 있는 데이터 원하는 위치에 insert
        items.insert(itemToMove, at: to.row)
        itemsImageFiles.insert(itemImageToMove, at: to.row)
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
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            
            let detailViewController = segue.destination as? DetailViewController
            
//            detailViewController?.detail = items[indexPath!.row]
//            detailViewController?.img = itemsImageFiles[indexPath!.row]
            detailViewController?.receviedData(items[indexPath!.row], itemsImageFiles[indexPath!.row])
            
        }
        
    }
    

}
