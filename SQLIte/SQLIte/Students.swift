//
//  Students.swift
//  SQLIte
//
//  Created by Hyeji on 2021/07/27.
//

import Foundation

class Students{ // 메소드 없는 클라스 (get set 기본적으로 있어서 안만들어줘도 됨!)
    // property
    var id: Int // nil 수용 안하게 만듬
    var name: String?
    var dept: String?
    var phone: String?
    
    // constructor
    init(id: Int, name: String?, dept: String?, phone: String?) {
        self.id = id // 앞에 있는 id는 property의 id이고, 뒤에 id는 parameter
        self.name = name
        self.dept = dept
        self.phone = phone
    }
}
