//
//  DBModel.swift
//  ServerJson_03
//
//  Created by Hyeji on 2021/07/28.
//

import Foundation

class DBModel: NSObject {
    // property
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    
    // override init() 은 NSObject에서 override한 init을 의미!
    override init() {
        
    }
    
    // Json data 는 어짜피 String임! 값이 없다면 null 이라는 글자가 들어오기 때문!! 그렇기에 String? 아닌 String 사용하면 됨!
    // 여기서는 override 시켜주면 절대 안됨!
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
        
    }
    
}
