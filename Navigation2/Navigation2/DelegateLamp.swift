//
//  Delegate.swift
//  Navigation2
//
//  Created by Hyeji on 2021/07/22.
//

// 파일이름과 프로토콜이름 같아야 함!
protocol DelegateLamp {
    
    // ViewController가 아닌 ChooseViewController 쓰는 이유는 self를 쓰기 위함
    //func didLampOnOffDone(_ controller: ChooseViewController, _ isOn: Bool)
    func didLampRedDone(_ controller: ChooseViewController, _ isRed: Bool, _ isOn: Bool)
    
}
