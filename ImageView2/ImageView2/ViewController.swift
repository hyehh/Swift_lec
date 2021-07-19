//
//  ViewController.swift
//  ImageView2
//
//  Created by Hyeji on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblLight: UILabel!
    
    var lampOn: UIImage? // 이미지 켜진 상태
    var lampOff: UIImage? // 이미지 꺼진 상태
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이미지 파일 준비
        lampOn = UIImage(named: "lamp_on")
        lampOff = UIImage(named: "lamp_off")
        
        imgView.image = lampOn
        
    }

    @IBAction func switchSize(_ sender: UISwitch) {
        
        let scale: CGFloat = 2.0
        let newWidth: CGFloat
        let newHeight: CGFloat
        
        switch sender.isOn{
        case true:
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            lblSize.text = "전구 확대"
        default:
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            lblSize.text = "전구 축소"
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)

    }
    
    @IBAction func switchLight(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            imgView.image = lampOn
            lblLight.text = "전구 스위치 On"
        default:
            imgView.image = lampOff
            lblLight.text = "전구 스위치 Off"
        }
    }
}

