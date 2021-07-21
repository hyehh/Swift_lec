//
//  ViewController.swift
//  SwipeGesturePageControl2
//
//  Created by Hyeji on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webSite: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var siteList = ["www.naver.com", "www.nate.com", "www.google.com", "www.apple.com", "www.tistory.com", "www.cnn.com", "www.bbs.com"]
    var siteCount = 0
    var siteLeft = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        siteCount = siteList.count
        pageControlSetting()
        webLoad(siteList[0])
        webSite.navigationDelegate = self
        makeSwipeGesture()
    }

    func pageControlSetting() {
        pageControl.numberOfPages = siteCount
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
    }
    
    func webLoad(_ url: String){
        let myUrl = URL(string: "https://" + url)
        let myRequest = URLRequest(url: myUrl!)
        webSite.load(myRequest)
    }
    
    @IBAction func btnPageControl(_ sender: UIPageControl) {
        webLoad(siteList[pageControl.currentPage])
    }
    
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
                switch pageControl.currentPage == siteCount-1 {
                case true:
                    pageControl.currentPage = 0
                    webLoad(siteList[pageControl.currentPage])
                default:
                    pageControl.currentPage += 1
                    webLoad(siteList[pageControl.currentPage])
                }
            case UISwipeGestureRecognizer.Direction.right:
                // 왼쪽으로 이동
                switch pageControl.currentPage == 0 {
                case true:
                    pageControl.currentPage = siteCount-1
                    webLoad(siteList[pageControl.currentPage])
                default:
                    pageControl.currentPage -= 1
                    webLoad(siteList[pageControl.currentPage])
                }
            default:
                break
            }
        }
    }
    
}

extension ViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
}
