//
//  JsonModel.swift
//  ServerJson_01
//
//  Created by Hyeji on 2021/07/27.
//

// 불러오는 class (json data 넘겨주는 방법)
import Foundation

protocol JsonModelProtocol {
    // 프로토콜이니까 함수 이름만 있음
    func itemDownloaded(items: NSArray)
}

class JsonModel {
    // JsonModel이 JsonModelProtocol을 가지고 있음
    var delegate: JsonModelProtocol!
    let urlPath = "http://192.168.0.5:8080/ios/student.json"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil {
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                self.parseJSON(data!)
            }
        }
        // task 실행은 resume
        task.resume()
    }
    
    // parsing func 만들기
    func parseJSON(_ data: Data) {
        var jsonResult = NSArray()
        do {
            // swift에서 json 사용하는 방식
            // 변환이 쉬워서 NSArray 사용한 것! (여기서 변환시켜주려고!!!!)
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        } catch let error as NSError {
            print(error)
        }
        // 하나씩 뽑아오기
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        // NSMutableArray 가 java에서의 arraylist라고 생각하기
        // NSArray는 5개로 선언하면 5개만 사용할 수 있음

        for i in 0..<jsonResult.count {
            // jsonElement 가 NSDictionary 이기에 변환시켜줌
            // NSDictionary 사용하는 이유 - json 데이터는 변수이름 : 데이터 즉, dictionary이기 때문에 NSDictionary로 변환하여 사용함
            jsonElement = jsonResult[i] as! NSDictionary
            // code의 데이터 값 불러오기 (if let 사용)
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String{
                let query = DBModel(scode: scode, sname: sname, sdept: sdept, sphone: sphone)
                // append 아니고 add!
                locations.add(query)
            }
        }
        // asynic 방식은 DispatchQueue 를 적어줘야 함!
        // closure 함수 사용
        DispatchQueue.main.async(execute: {() -> Void in
            // itemDownloaded에게 parsing 한 내용 주는 것!
            self.delegate.itemDownloaded(items: locations)
    })
    }
}
