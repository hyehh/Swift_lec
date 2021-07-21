//
//  ViewController.swift
//  HybridPickerView
//
//  Created by Hyeji on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var sitePicker: UIPickerView!
    @IBOutlet weak var webSite: WKWebView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var siteList = ["www.naver.com", "www.nate.com", "www.google.com", "www.apple.com", "www.tistory.com", "www.cnn.com", "www.bbs.com"]
    var dataCount = 0
    let columCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataCount = siteList.count
        sitePicker.dataSource = self
        sitePicker.delegate = self
        webSite.navigationDelegate = self
        webLoad(siteList[0])
    }

    // 해당 웹사이트로 이동하는 함수
    func webLoad(_ url: String) {
        
        let myUrl = URL(string: "https://" + url)
        let myRequest = URLRequest(url: myUrl!)
        webSite.load(myRequest)
    }
}

extension ViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return columCount
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataCount
    }
    
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return siteList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        webLoad(siteList[row])
    }
    
}

// 웹이랑 indicator랑 연결시켜주기
extension ViewController: WKNavigationDelegate{
    
    // Indicator 시작
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
