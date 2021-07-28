//
//  InsertModel.swift
//  DBCRUD
//
//  Created by Hyeji on 2021/07/28.
//

import Foundation

// protocol : 나한테 다시 데이터를 줄 때 필요함! 지금 insert에서는 필요없음!
// json으로 데이터 가져올 때만 필요한 게 protocol
class InsertModel {
    // JsonModel이 JsonModelProtocol을 가지고 있음
    var urlPath = "http://192.168.0.92:8080/ios/studentInsert_ios.jsp"
    
    func InsertItems(code: String, name: String, dept: String, phone: String) -> Bool { // 데이터를 달고 넘어와서 db 연결해야 함! (parameter 생성해주기!)
        // return은 잘 끝났는지 확인하기 위한 용도
        var result: Bool = true
        let urlAdd = "?code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)" // 시작은 물음표부터 시작!
        // 이게 진짜 url!
        urlPath = urlPath + urlAdd
        
        // 한글 url encoding
        // urlPath를 %가 있는 걸로 바꿔줘야 함! 한글 들어가면 안되고 그 자리에 %
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // URL 타입 생성
        let url: URL = URL(string: urlPath)!
        // Session 생성(url타고 들어감!)
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default)
        // Task : downloadItems에서 실행되는 부분 (여기에서 데이터 가져옴)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            // task의 기능을 closure에 적어줌! (서버에서 신호주는 게 response
            // 브라우저에서 신호주는 게 request)
            if error != nil {
                print("Failed to insert data")
                result = false
            }else{
                print("Data is inserted!")
                result = true
            }
        }
        // task 실행은 resume
        task.resume()
        return result
    }
    
}
