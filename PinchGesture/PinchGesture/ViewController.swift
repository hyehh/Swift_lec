//
//  ViewController.swift
//  PinchGesture
//
//  Created by Hyeji on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Pinch Setup
        // (_ :) objc 의 모양
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :)))
        self.view.addGestureRecognizer(pinch)  // view로 만들어줘야 전체에 대한 범위 가능!
    }

   
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        
        // 크기 설정
        // UIPinchGestureRecognizer 이게 사용자가 얼만큼의 크기를 줬는지 알고 있음! pinch.scale
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        // 확대된 게 1크기 라고 알려줌
        pinch.scale = 1 // 기존 값을 설정해주기!
        // 확대된 게 원래 이미지야 하고 속이는 것! 그래야 다음 확대할 때 자연스럽게 넘어가짐
    }
}

