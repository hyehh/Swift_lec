//
//  ViewController.swift
//  HybridPageControl
//
//  Created by Hyeji on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSite: UILabel!
    @IBOutlet weak var webSite: WKWebView!
    @IBOutlet weak var indicatior: UIActivityIndicatorView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var siteList = ["www.naver.com", "www.nate.com", "www.google.com", "www.apple.com", "www.tistory.com", "www.cnn.com", "www.bbs.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webLoad(siteList[0])
        pageControlSetting()
        webSite.navigationDelegate = self
    }
    
    // 이름 설정 및 웹페이지 로드
    func webLoad(_ url: String){
        lblSite.text = url
        
        let myUrl = URL(string: "https://" + url)
        let myRequest = URLRequest(url: myUrl!)
        webSite.load(myRequest)
    }
    
    // 페이지 컨트롤 초기 설정
    func pageControlSetting(){
        pageControl.numberOfPages = siteList.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.965210259, green: 0.8740667701, blue: 1, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8173944354, green: 0.3704140782, blue: 1, alpha: 1)
    }

    @IBAction func btnPageControl(_ sender: UIPageControl) {
        webLoad(siteList[pageControl.currentPage])
    }
}

extension ViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicatior.startAnimating()
        indicatior.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicatior.stopAnimating()
        indicatior.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicatior.stopAnimating()
        indicatior.isHidden = true
    }
    
}

