//
//  ViewController.swift
//  PageControl2
//
//  Created by Hyeji on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var numList = Array<Int>(1...10)
    //var numList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        for i in 1...10{
//            numList.append(i)
//        }
        
        lblNum.text = String(numList[0])
        lblNum.textColor = UIColor.red
        
        pageControlSetting()
    }
    
    func pageControlSetting(){
        pageControl.numberOfPages = numList.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
    }

    @IBAction func pageControlClick(_ sender: UIPageControl) {
        switch numList[pageControl.currentPage] % 2 == 0 {
        case true:
            lblNum.textColor = UIColor.blue
        default:
            lblNum.textColor = UIColor.red
        }
        lblNum.text = String(numList[pageControl.currentPage])
    }
    
}

