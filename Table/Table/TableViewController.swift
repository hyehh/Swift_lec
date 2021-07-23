//
// TableViewController.swift
// Table
//
// Created by Hyeji on 2021/07/22.
//
import UIKit

// 클라스 위에서 데이터 만드는 것임!
// 변수 선언을 Class 정의 전에 해야 함!
// class 위에 선언해줬기 때문에 project 에서 모두 사용함!!! (project에서 이 변수 어떤 클래스든 사용이 가능함)
// 처음 뜨는 화면에 제일 위에서 선언해주기!!!
var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png","clock.png","pencil.png"]
class TableViewController: UITableViewController {
    
  //꼭 전체를 잡고 할것!
  // cell을 연결하는 게 아니고 table view 전체를 연결해야 함!
  @IBOutlet var tvListView: UITableView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    // Edit 버튼을 만들고 삭제 기능 추가하기, 왼쪽으로 배치 (오른쪽엔 이미 플러스 버튼 있기 때문!)
    self.navigationItem.leftBarButtonItem = self.editButtonItem
  }

  // 화면이 뒤에 숨었다가 다시 보였을 때 이게 실행됨! (앱이 제일 처음 뜰 때 viewDidLoad와 viewWillAppear 가 뜬다!)
  // viewDidLoad는 화면뜨기 전에 움직이고 viewWillAppear는 화면 뜨고 나서 움직인다
  // viewWillAppear은 화면 뜬 다음에 전면 나설 때마다 동작 됨!
  override func viewWillAppear(_ animated: Bool) {
    tvListView.reloadData() // 다시 화면 재구성 (numberOfSections, tableView, tableView를 재실행시킴)
  }
    
    
  // MARK: - Table view data source
    
  // Section 몇 개 쓸 것인지 return 해줌
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }

  // Section 당 열의 개수
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return items.count
  }
    
  //테이블 내용 구성
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    // Configure the cell...
    // 데이터 있는 만큼 화면에 셀 만들어주기
    cell.textLabel?.text = items[indexPath.row]
    cell.imageView?.image = UIImage(named:itemsImageFile[indexPath.row])
    return cell
  }
  /*
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  */
  // Table 셀 삭제
  // Override to support editing the table view.
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      print("Delete")
      // indexPath.row : 선택한 것의 데이터
      items.remove(at: indexPath.row)
      itemsImageFile.remove(at: indexPath.row)
      // 테이블 뷰에 보이는 것을 따로 지워줘야 함!
      tableView.deleteRows(at: [indexPath], with: .fade)
      // Delete the row from the data source
      // tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
  }
  // 삭제시 Delete를 글씨를 “삭제“로 보이기
  override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    return "삭제"
  }
  
  // 목록 순서 바꾸기 (cell 간 이동시키기)
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    // fromIndexPath, to 사용할 것
    // 이동할 item 의 위치 (이동할 cell 이 무엇인지 부터 파악 / 삭제하기 전에 다른 변수에 먼저 만들어 놓기!)
    let itemToMove = items[fromIndexPath.row]
    let itemImageToMove = itemsImageFile[fromIndexPath.row]
    
    // 이동할 item을 삭제 (이동할 cell을 아예 삭제 시켜버리고 다시 insert 해주는 게 이동의 개념!)
    items.remove(at: fromIndexPath.row)
    itemsImageFile.remove(at: fromIndexPath.row)
    
    // 해당 위치로 삽입 (이동하고자 하는 위치로 cell을 다시 insert)
    items.insert(itemToMove, at: to.row) // to 위치로 삽입시켜라!
    itemsImageFile.insert(itemImageToMove, at: to.row)
    
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
        // tableView는 cell들의 집함
        // sender를 통해서 cell 타입으로 변경시키고 몇 번째인지 indexPath 얻는 작업
        let cell = sender as! UITableViewCell // cell 정보를 얻는 것! (sender가 정보를 알고 있음 - sender를 통해서 cell타입으로 변경시킴!)
        let indexPath = self.tvListView.indexPath(for: cell) // 클릭한 cell의 Indexpath 가져오기 (prepare에는 indexPath가 없기 때문!)
        
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.receiverItems(items[indexPath!.row]) // 아까 만들어 놓은 함수가 실행됨
    }
  }
  
} //TableViewController
