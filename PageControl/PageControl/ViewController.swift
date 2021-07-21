//
//  ViewController.swift
//  PageControl
//
//  Created by Hyeji on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    // 데이터가 5개면 5개의 점이 생기도록 설정하기 위해 outlet 필요!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: images[0])
        
        // 데이터가 5개면 5개의 점이 생기도록 설정
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0 // 제일 첫 번째 동그라미로 초기 화면 설정
        pageControl.pageIndicatorTintColor = UIColor.green // 전체 동그라미 색상 설정
        pageControl.currentPageIndicatorTintColor = UIColor.red // 선택된 동그라미 색상 설정
    }

    // 클릭했을 때 이벤트
    @IBAction func pageChange(_ sender: UIPageControl) {
        // currentPage : 자기 위치 알고 있음 -> 이거 이용하면 편하다!
        imgView.image = UIImage(named: images[pageControl.currentPage])
        
    }
}

