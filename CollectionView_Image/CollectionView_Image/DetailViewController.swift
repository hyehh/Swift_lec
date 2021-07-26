//
//  DetailViewController.swift
//  CollectionView_Image
//
//  Created by Hyeji on 2021/07/26.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImgView: UIImageView!
    var img: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImgView.image = img
    }
    
    func receivedDate(_ receivedImg: UIImage?) {
        img = receivedImg
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
