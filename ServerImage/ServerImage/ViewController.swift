//
//  ViewController.swift
//  ServerImage
//
//  Created by Hyeji on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnImage1(_ sender: UIButton) {
        // android 와 동일한 방식 (옛날 방식)
        // 서버에 있는 이미지를 내 스마트폰에 저장해 불러와서 보여준다!
        let url: URL = URL(string: "http://192.168.0.5:8080/ios/flower_01.png")!
        // session 연결시키기
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        // closure 사용
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                // error 걸린 경우
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                // asynic
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data!)
                    if let image = UIImage(data: data!){
                        if let data = image.pngData(){ // 가져온 걸 내 스마트폰에 저장시킴
                            // 파일 이름 바꾸기
                            let filename = self.goDocumentDirectory().appendingPathComponent("copy.png")
                            // 저장하기
                            try? data.write(to: filename)
                        }
                    }
                }
            }
        }
        // asynic task 동작시킴
        task.resume()
    }
    
    // 어디에 저장했는지 return 해줌
    func goDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0] // 첫 번째꺼 return 해줌
    }
    
    @IBAction func btnImage2(_ sender: UIButton) {
        // jpg, png 방식 차이 없음
        // 저장하지 않고 보여주는 방식 (이 방식을 쓰는 게 가장 좋음)
        let url = URL(string: "http://192.168.0.5:8080/ios/flower_02.png")
        
        let data = try? Data(contentsOf: url!)
        // named는 파일 이름 알 때 사용, data는 정말 순수한 data 값임
        imgView.image = UIImage(data: data!)
    }
    
}

