//
//  EditDelegate.swift
//  Navigation
//
//  Created by Hyeji on 2021/07/22.
//

// Protocol : 자바의 Interface
// 메소드 이름은 있고 기능은 없는 것을 의미
// 앞으로 넘기는 건 무조건 protocol 사용
protocol  EditDelegate {
    // EditViewController가 바뀐 내용을 ViewController로 보낼 때 필요!
    func didMessageEditDone(_ controller: EditViewController, message: String)
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}
