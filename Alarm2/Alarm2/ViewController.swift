//
//  ViewController.swift
//  Alarm2
//
//  Created by Hyeji on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    var currentTime: String = ""
    var pickerTime: String = ""
    
    let interval = 1.0 // 1초
    let timeSelector: Selector = #selector(ViewController.updateTime)
    
    var isAlarm = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        lblPickerTime.text = "알람 시간을 설정해주세요!"
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        isAlarm = true
        let pickerDate = sender
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        pickerTime = "\(formatter.string(from: pickerDate.date))"
        lblPickerTime.text = "선택시간 : \(pickerTime)"
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        let formatter2 = DateFormatter()
        formatter2.locale = Locale(identifier: "ko")
        formatter2.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        currentTime = "\(formatter2.string(from: date as Date))"
        
        print(isAlarm)
        
        if (currentTime == pickerTime) && (isAlarm) {
            self.isAlarm = false

            let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!", preferredStyle: .alert)
            let alarmAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: {ACTION in
                // self.isAlarm = false
            })
            
            alarmAlert.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1) // Color 적으면 됨!
            //alarmAlert.view.backgroundColor = UIColor.yellow
            alarmAlert.view.layer.cornerRadius = 10
            alarmAlert.addAction(alarmAction)
            present(alarmAlert, animated: true, completion: nil)
        }
    }
    
}

