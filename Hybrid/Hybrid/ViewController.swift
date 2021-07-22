//
//  ViewController.swift
//  Hybrid
//
//  Created by Hyeji on 2021/07/21.
//

import UIKit
import WebKit // import 해주기!!!

class ViewController: UIViewController {

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView! // import UIKit 이기 때문에 import 하나 더 해줘야 함!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tempSite = "https://www.naver.com" // String 상태임!
//        let myUrl = URL(string: tempSite) // String을 Url 타입으로 바꿔주기!
//        let myRequest = URLRequest(url: myUrl!) // myUrl은 옵셔널! 나한테 결과값을 줘라!하고 요청
//        myWebView.load(myRequest) // 화면에 띄우기 (myRequest를 load해라!)
        loadWebPage(url: tempSite)
        
        myWebView.navigationDelegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 웹사이트로 이동하는 함수
    func loadWebPage(url: String){
        let myUrl = URL(string: url) // String을 Url 타입으로 바꿔주기!
        let myRequest = URLRequest(url: myUrl!) // myUrl은 옵셔널! 나한테 결과값을 줘라!하고 요청
        myWebView.load(myRequest) // 화면에 띄우기 (myRequest를 load해라!)
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        let site1 = "https://www.google.com"
        loadWebPage(url: site1)
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
        let site2 = "https://www.daum.net"
        loadWebPage(url: site2)
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        // 서버에 있는 이미지를 가져오고 싶을 때 & 프로튼엔드와 연결해주고 싶을 때
        // 변수에 html 파일을 넣을것임!
        // .load 메소드 사용불가!
        let htmlString = """
            <html>
                <head>
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                </head>
                <body>
                    <h1>HTML String</h1>
                    <p>String 변수를 이용한 웹페이지</p>
                    <p><a href = "http://jtbc.joins.com">JDBC</a>로 이동<p>
                </body>
            </html>
            """
        // 변수만 넣은 것이기에 url 없음!
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        // .load 사용 가능!
        // 파일 가져오기
        // forResource : 파일 이름 적기(htmlView.html 적으면 절대 안됨!!!),  ofType : 확장자 이름 직기
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(tfUrl.text!)
        tfUrl.text = ""
        loadWebPage(url: myUrl)
    }
    
    // 사용자 입력값에 https:// 있는지 체크
    func checkUrl(_ url: String) -> String{
        
        var strUrl = url
        let strUrlSubString = strUrl.index(strUrl.startIndex, offsetBy: 7)
        let flag = String(strUrl[...strUrlSubString])
        print(flag)
        if flag != "https://" {
            strUrl = "https://" + strUrl
        }
        print(strUrl)
        return strUrl
        
//        var strUrl = url
//        let flag = strUrl.hasPrefix("http://") // Prefix : 앞글자 - Postfix : 뒷글자
//        if !flag{
//            strUrl = "http://" + strUrl
//        }
//        print(strUrl)
//        return strUrl
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
} // ViewController

// 웹이랑 activity indicator 연결시켜주는 extension
extension ViewController: WKNavigationDelegate{
    
    // Indicator 시작 (didcommit 기억) - webview가 시작된다는 걸 알고 있음
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating() // 이제 빙빙빙 돈다! (근데 화면에는 아직 안보임)
        myActivityIndicator.isHidden = false // 이제 화면에 보임
        print("didcommit")
    }
    
    // Indicator 종료 (didfinish 기억)
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
        print("didfinish")
    }
    
    // Error 발생 시 (didfail 기억)
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        // 에러 발생하면 indicator 안보여주면 됨
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
        print("didfail")
    }
    
}

