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
        // 비어있는 생성자 형성 (필수적으로 생성하자! -> 버그 걸릴 수 있음)
    }
    
    init(scode: String, sname: String, sdept: String, sphone: String) {
        // 이걸 mutablearray에 집어 넣음
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
    
}
