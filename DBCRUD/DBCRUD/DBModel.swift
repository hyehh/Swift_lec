//
//  DBModel.swift
//  DBCRUD
//
//  Created by Hyeji on 2021/07/28.
//

import Foundation

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
