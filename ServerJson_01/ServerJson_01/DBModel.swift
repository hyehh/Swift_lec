//
//  DBModel.swift
//  ServerJson_01
//
//  Created by Hyeji on 2021/07/27.
//

// bean 만든다고 생각하기
import Foundation

// json이나 database 쓸 때는 type 주는 게 좋음
class DBModel: NSObject {
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    
    // Empty constructor
    override init() {
        // 비어있는 생성자 형성
    }
    
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
    
}
