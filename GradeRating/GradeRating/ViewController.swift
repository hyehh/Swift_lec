//
//  ViewController.swift
//  GradeRating
//
//  Created by Hyeji on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfKorean: UITextField!
    @IBOutlet weak var tfMath: UITextField!
    @IBOutlet weak var tfEnglish: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = "국어, 수학, 영어의 점수를 입력해주세요!"
    }
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func btnResult(_ sender: Any) {
        
        guard let intKorean = Int(tfKorean.text!) else {
            lblResult.text = "국어 점수를 입력해주세요!"
            tfKorean.becomeFirstResponder()
            return }
        
        guard let intMath = Int(tfMath.text!) else {
            lblResult.text = "수학 점수를 입력해주세요!"
            tfMath.becomeFirstResponder()
            return }
        
        guard let intEnglish = Int(tfEnglish.text!) else {
            lblResult.text = "영어 점수를 입력해주세요!"
            tfEnglish.becomeFirstResponder()
            return }
        
        let check = numberCheck(intKorean, intMath, intEnglish)
        
        if check == 1{
            lblResult.text = "국어 점수는 100점 이하로 입력해주세요!"
        }else if check == 2{
            lblResult.text = "수학 점수는 100점 이하로 입력해주세요!"
        }else if check == 3{
            lblResult.text = "영어 점수는 100점 이하로 입력해주세요!"
        }else{
            avg(intKorean, intMath, intEnglish)
        }
        
    }
    
    // 100점 초과 점수를 입력한 경우
    func numberCheck(_ intKorean: Int, _ intMath: Int, _ intEnglish: Int) -> Int{
        if intKorean > 100{
            return 1
        }else if intMath > 100{
            return 2
        }else if intEnglish > 100{
            return 3
        }else{
            return 0
        }
    }
    
    // 평균 구하기
    func avg(_ intKorean: Int, _ intMath: Int, _ intEnglish: Int){
        let avg = Double(intKorean + intMath + intEnglish) / 3
        var grade: String
        
        switch  avg {
        case 90...100:
            grade = "A"
        case 80..<90:
            grade = "B"
        case 70..<80:
            grade = "C"
        case 60..<70:
            grade = "D"
        case 50..<60:
            grade = "E"
        default:
            grade = "F"
        }
        
        let roundAvg = round(avg * 100) / 100
        
        lblResult.text = "평균운 \'\(roundAvg)\' 이고 등급은 \'\(grade)\' 입니다."
        lblResult.text = "평균운 \'\(String(format: "%.2f", avg))\' 이고 등급은 \'\(grade)\' 입니다."
        self.view.endEditing(true)
    }
}

