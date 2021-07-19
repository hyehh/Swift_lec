//
//  ViewController.swift
//  FlowerRepeat
//
//  Created by Hyeji on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var countImage = 0
    let flowerNameList = ["flower_01", "flower_02", "flower_03", "flower_04", "flower_05", "flower_06"]
    let interval = 3.0 // 3초
    let timeSelector: Selector = #selector(ViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblName.text = flowerNameList[0]
        imgView.image = UIImage(named: flowerNameList[0])
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @objc func updateTime(){
        countImage += 1
        print(countImage)
        lblName.text = flowerNameList[countImage]
        imgView.image = UIImage(named: flowerNameList[countImage])
        // 3초마다 변경될 때 이미지 이름 변경
        if countImage < 5{
        }else{
            countImage = -1
        }
    }
}

