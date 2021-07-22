//
//  ViewController.swift
//  DatePicker
//
//  Created by Hyeji on 2021/07/19.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let interval = 1.0 // 1초
    // selector 는 타입임! (object-c 불러오는 역할)
    // ViewController.updateTime 우리가 만든 함수
    // 타이머가 실행되면 뭘 실행시킬지 알려주는 것!
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblPickerTime.text = "시간을 선택하세요!"
        // Timer는 앱 떴을 때 구동 시키는 것! (시간 주는 역할 아님 - timer와 datetime 관련 없음!)
        // Timer가 asynic임! (Timer가 1초에 한 번이든, 5초에 한 번이든 계속 실행시켜주는 역할임)
        // 1초마다 timeSelector 구동시키는 걸 무한정 반복한다는 의미!
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) // repeats: true 무한정 반복
    } // viewDidLoad

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        // 사용자가 선택한 시간을 sender가 알고 있음
        let datePickerView = sender
        // sender가 주는 정보 중 date 정보만 print!
        // print(datePickerView.date)
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" // 24시간 HH (a는 지워야 함!)
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"
    } // changeDatePicker
    
    @objc func updateTime(){
        // 지금 class에서 Instance 만드는 것임! () 생성자임!
        
        // # 들어가면 #objc 필요함! -> compile시 objc 타입으로 compile됨!
        let date = NSDate() // Next Step Date 1초에 한 번씩 "2021-07-19 07:29:31 +0000" 1초에 한 번씩 찍어줌
        // print(date)
        let formatter = DateFormatter() // 년도월일 바꿔주는 것!
        // 한국시간으로 변경
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // EEE는 요일 a는 am,pm
        // date : NSDate 를 as Date : swift Date 로 바꿔주는 것!
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
    }
    
} // ViewController

