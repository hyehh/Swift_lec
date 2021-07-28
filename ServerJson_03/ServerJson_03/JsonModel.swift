//
//  JsonModel.swift
//  ServerJson_03
//
//  Created by Hyeji on 2021/07/28.
//

import Foundation

protocol JsonModelProtocol {
    func itemDownloaded(items: NSArray)
}

class JsonModel {
    var delegate: JsonModelProtocol!
    let urlPath = "http://192.168.0.92:8080/ios/student.json"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            // task의 기능을 closure에 적어줌! (서버에서 신호주는 게 response
            // 브라우저에서 신호주는 게 request)
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
    
    func parseJSON(_ data: Data) {
        var jsonResult = NSArray()
        do {
            // swift에서 json 사용하는 방식
            // 변환이 쉬워서 NSArray 사용한 것! (여기서 변환시켜주려고!!!!)
            // JSON 파일은 대괄호로 시작하는데 배열안에 있다는 의미임!
            // JSONSerialization 순서대로 가져오는 방식을 의미!
            // 들어온 JSON을 배열로 바꿔줌!
            // NSArray 한 번 데이터가 들어가면 못바꿈! 못지움!
            // NSArray는 [{"code" : "S001", "name" : "aaa"},{}] 이런식으로 들어가있음!
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        } catch let error as NSError {
            print(error)
        }
        // 하나씩 뽑아오기
        var jsonElement = NSDictionary() // Dictionary 타입
        let locations = NSMutableArray() // 여기에 데이터 넣어줄 것임!
        // NSMutableArray 가 java에서의 arraylist라고 생각하기
        // NSMutableArray로 만든이유는 데이터를 넣다 뺐다 지웠다 하고 싶기 때문!
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
                // bean과 동일하다고 생각하기
                // json 데이터 가져와서 locations 에 넣어줌!
                locations.add(query)
            }
        }
        // async 방식은 DispatchQueue 를 적어줘야 함!
        // closure 함수 사용
        // tableviewcontroller가 일을 하고 있다면, 동시에 처리해줘야 하기 때문에 async 사용!
        DispatchQueue.main.async(execute: {() -> Void in
            // itemDownloaded에게 parsing 한 내용 주는 것!
            self.delegate.itemDownloaded(items: locations)
    })
    }
}
