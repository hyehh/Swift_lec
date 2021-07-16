//
//  ViewController.swift
//  ImagePrint2
//
//  Created by Hyeji on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var numImage = 0
    var ImageName = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        lblName.text = ImageName[numImage]
//        imgView.image = UIImage(named: ImageName[numImage])
        displayImage(numImage)
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        if numImage < 0{
            // data가 늘어도 소스 바꾸지 않고 싶으면 최대한 프로그램 기능 활용하기
            // 여기서는 count 활용하기
            numImage = ImageName.count - 1
        }
//        lblName.text = ImageName[numImage]
//        imgView.image = UIImage(named: ImageName[numImage])
        displayImage(numImage)
    }

    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        // print(numImage)
        if numImage >= ImageName.count{
            numImage = 0
        }
//        lblName.text = ImageName[numImage]
//        imgView.image = UIImage(named: ImageName[numImage])
        displayImage(numImage)
    }
    
    func displayImage(_ numImage : Int){
        lblName.text = ImageName[numImage]
        imgView.image = UIImage(named: ImageName[numImage])
    }
}

