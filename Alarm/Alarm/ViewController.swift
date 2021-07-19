//
//  ViewController.swift
//  Alarm
//
//  Created by Hyeji on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let interval = 1.0 // 1초
    let timeSelector: Selector = #selector(ViewController.updateTime)
    var currentTime: String = "" // 선택 시간과 현재 시간 비교 위한 현재 시간
    var pickerTime: String = "" // 선택 시간과 현재 시간 비교 위한 선택 시간
    var boolState = true // 초마다 색 변경을 위한 상태변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblPickerTime.text = "시간을 선택하세요!"
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        pickerTime = formatter.string(from: datePickerView.date)
        lblPickerTime.text = "선택시간 : \(pickerTime)"
                
    }
    
    @objc func updateTime(){
        // 현재 시간
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        // 선택 시간과 현재 시간 비교 위한 현재 시간
        let formatter2 = DateFormatter()
        formatter2.locale = Locale(identifier: "ko")
        formatter2.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        currentTime = formatter2.string(from: date as Date)
        print(currentTime)
        

        
        // 선택 시간과 현재 시간 비교
        if pickerTime == currentTime{
//            let seco:Int = Int(formatter.string(from: date as Date).suffix(2)) ?? 0
//            switch seco%2 == 0 {
//            case true:
//                view.backgroundColor = UIColor.red
//            default:
//                view.backgroundColor = UIColor.blue
//            }
            switch boolState {
            case true:
                view.backgroundColor = UIColor.red
                boolState = !boolState
            default:
                view.backgroundColor = UIColor.blue
                boolState = !boolState
            }
            
        }else{
            view.backgroundColor =  UIColor.white
        }
    }
}

