//
//  ViewController.swift
//  HybridPickerView2
//
//  Created by Hyeji on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var sitePicker: UIPickerView!
    @IBOutlet weak var myWeb: WKWebView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
//    var siteNameList = ["네이버", "네이트", "구글", "애플", "티스토리", "CNN", "BBS"]
//    var siteUrlList = ["www.naver.com", "www.nate.com", "www.google.com", "www.apple.com", "www.tistory.com", "www.cnn.com", "www.bbs.com"]


    var siteNameList = [("네이버", "www.naver.com"), ("네이트", "www.nate.com"), ("구글", "www.google.com"), ("애플", "www.apple.com"), ("티스토리", "www.tistory.com"), ("CNN", "www.cnn.com"), ("BBS", "www.bbs.com")]
    var dataCount = 0
    var columnCout = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataCount = siteNameList.count
        webLoad("https://" + siteNameList[0].1)
        sitePicker.dataSource = self
        sitePicker.delegate = self
        myWeb.navigationDelegate = self
    }

    // 웹사이트 이동시키는 함수
    func webLoad(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWeb.load(myRequest)
    }
    
}

extension ViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return columnCout
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataCount
    }
    
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return siteNameList[row].0
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        webLoad("https://" + siteNameList[row].1)
    }
}

extension ViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myIndicator.startAnimating()
        myIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
}
