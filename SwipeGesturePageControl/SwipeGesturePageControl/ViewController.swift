//
//  ViewController.swift
//  SwipeGesturePageControl
//
//  Created by Hyeji on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var flowerNameList = [String]()
    var flowerImageList = [UIImage?]()
    var dataCount = 0
    var currentCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지 이름 배열 정의
        for i in 1...6{
            flowerNameList.append("flower_0\(i).png")
        }
        // 이미지 이름 배열의 개수
        dataCount = flowerNameList.count
        // 이미지 파일 배열 정의
        for i in 0..<dataCount{
            flowerImageList.append(UIImage(named: flowerNameList[i]))
        }
        // 첫 화면
        imgView.image = flowerImageList[0]
        // page control 초기 설정
        pageControlSetting()
        // Gesture 구성
        makeSwipeGesture()
    }
    
    // page control 초기 설정
    func pageControlSetting() {
        pageControl.numberOfPages = dataCount
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }

    // page control 버튼 클릭
    @IBAction func btnPageControl(_ sender: UIPageControl) {
        imgView.image = flowerImageList[pageControl.currentPage]
        currentCount = pageControl.currentPage
    }
    
    // Gesture 구성
    func makeSwipeGesture(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                // 오른쪽으로 이동
                switch pageControl.currentPage == dataCount-1 {
                case true:
                    pageControl.currentPage = 0
                    imgView.image = flowerImageList[pageControl.currentPage]
                default:
                    pageControl.currentPage += 1
                    imgView.image = flowerImageList[pageControl.currentPage]
                }
            case UISwipeGestureRecognizer.Direction.right:
                // 왼쪽으로 이동
                switch pageControl.currentPage == 0 {
                case true:
                    pageControl.currentPage = dataCount-1
                    imgView.image = flowerImageList[pageControl.currentPage]
                default:
                    pageControl.currentPage -= 1
                    imgView.image = flowerImageList[pageControl.currentPage]
                }
            default:
                break
            }
            
            
//            switch swipeGesture.direction {
//            case UISwipeGestureRecognizer.Direction.left:
//                // 오른쪽으로 이동
//                switch currentCount == 5 {
//                case true:
//                    currentCount = 0
//                    imgView.image = flowerImageList[currentCount]
//                default:
//                    currentCount += 1
//                    imgView.image = flowerImageList[currentCount]
//                }
//            case UISwipeGestureRecognizer.Direction.right:
//                // 왼쪽으로 이동
//                switch currentCount == 0 {
//                case true:
//                    currentCount = 5
//                    imgView.image = flowerImageList[currentCount]
//                default:
//                    currentCount -= 1
//                    imgView.image = flowerImageList[currentCount]
//                }
//            default:
//                break
//            }
        }
    }
    
}

