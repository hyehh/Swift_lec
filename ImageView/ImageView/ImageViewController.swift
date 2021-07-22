//
//  ViewController.swift
//  ImageView
//
//  Created by Hyeji on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    
    // 변수 만들면 commend 적기
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage? // 꺼진 전구 이미지
    var isZoom = false // 이미지 확대 여부
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이미지 파일 준비
        imgOn = UIImage(named: "lamp_on.png") // lamp_on만 적어도 됨!
        imgOff = UIImage(named: "lamp_off.png") // lamp_off만 적어도 됨!
        
        // 이미지 할당
        imgView.image = imgOn
    } // viewDidLoad

    @IBAction func btnResizeImage(_ sender: UIButton) {
        // 이미지 크기를 2배로 조절
        // CGFloat 그림에 대한 단위! CGFloat 사용하면 GPU가 움직임! (Double 쓰면 CPU 움직임)
        let scale: CGFloat = 2.0
        var newWidth: CGFloat
        var newHeight: CGFloat
        
        if isZoom{ // true이면!
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("이미지 확대", for: .normal)
        }else{ // false이면!
            // 현재 크기 : imgView.frame.width
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            // 버튼의 글자 바꿔주기
            btnResize.setTitle("이미지 축소", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        // 상태변수 isZoom 의 상태를 변경! (중요!!! 꼭 하기!!!)
        // true로 들어오면 false로 바뀌고, false로 들어오면 true로 바꿔준다!
        isZoom = !isZoom
    } // btnResizeImage
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        // 스위치 켰는지 껐는지 구분! 이는 sender만 알고 있음
        switch sender.isOn {
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
//        if sender.isOn{
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
        
    } //switchImageOnOff
    
} // ViewController

