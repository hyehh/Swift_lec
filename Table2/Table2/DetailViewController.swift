//
//  DetailViewController.swift
//  Table2
//
//  Created by 박성훈 on 2021/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblDetail: UILabel!
    
    var img = ""
    var detail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblDetail.text = detail
        imgView.image = UIImage(named: img)
    }
    
    func receviedData(_ receviedDetail: String, _ receivedImage: String) {
        detail = receviedDetail
        img = receivedImage
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
