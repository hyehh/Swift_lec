//
//  DetailViewController.swift
//  Table
//
//  Created by Hyeji on 2021/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblItem: UILabel!
    
    var receiveItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
    }
    
    // 함수를 통해서 받기 (변수를 통해서 받는 것도 할 수 있으나 함수를 통해서 받을 수도 있음!)
    func receiverItems(_ item: String) {
        receiveItem = item // item은 ViewController가 보내준 정보
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} // DetailViewController
