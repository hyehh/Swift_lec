//
//  ViewController.swift
//  ServerImage2
//
//  Created by Hyeji on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    // var flowerList = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    var flowerList = [UIImage?]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgViewLoad(0)
        
        for i in 1..<6 {
            flowerList.append(UIImage(named: "flower_0\(i).png"))
        }
    }

    func imgViewLoad(_ number: Int) {
        
        let url = URL(string: "http://192.168.0.5:8080/ios/flower_0\(number+1).png")
        let data = try? Data(contentsOf: url!)
        imgView.image = UIImage(data: data!)
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        if count == 0 {
            count = 5
        }else {
            count -= 1
        }
        imgViewLoad(count)
        
    }
    
    
    @IBAction func btnNext(_ sender: UIButton) {
        if count == 5 {
            count = 0
        }else {
            count += 1
        }
        imgViewLoad(count)
    }
    
}

