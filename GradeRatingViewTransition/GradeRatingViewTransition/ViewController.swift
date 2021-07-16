//
//  ViewController.swift
//  GradeRatingViewTransition
//
//  Created by Hyeji on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var tfGrade: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    var gradeList: [Int] = []
    var gradeName = ["국어 점수", "수학 점수", "영어 점수", "요약"]
    var comparisonList : [String] = []
    var checkCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvResult.text?.removeAll()
        lblText.text = gradeName[checkCount]
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        self.view.endEditing(true)
        
//        if gradeCheck() == 0{
//            tvResult.text = "점수를 입력해주세요!"
//        }else{
            getScore()
//        }
        
        
//        checkCount += 1
//
//        guard let intGrade = Int(tfGrade.text!) else {
//            tvResult.text = "점수를 입력해주세요!"
//            return }
////        gradeList.append(intGrade)
////
////        tfGrade.text?.removeAll()
////        tvResult.text.removeAll()
//        gradeCheck(intGrade)
//
//        if checkCount == 2{
//            calc()
//            //tvResult.text = "여기"
//            tfGrade.isHidden = true
//            print(checkCount)
//            lblText.text = gradeName[checkCount+1]
//            checkCount = 0
//        }else if checkCount < gradeName.count-1{
//
//                tfGrade.isHidden = false
//
//                lblText.text = gradeName[checkCount]
//                print(checkCount)
//        }else{
////            // calc()
//            tvResult.text = "여기"
//            tfGrade.isHidden = true
//            checkCount = 0
//            lblText.text = gradeName[checkCount]
//            print(checkCount)
//        }
        //checkCount += 1
    }
    func getScore() {
        tvResult.text = ""
        tfGrade.isHidden = false
        
        if checkCount == 3{
            checkCount = 0
            gradeList.removeAll()
            lblText.text = gradeName[checkCount]
        }else{
            guard let intGrade = Int(tfGrade.text!) else {
                tvResult.text = "점수를 입력해주세요!"
                return }
            
            if intGrade > 100{
                tvResult.text = "점수는 100 이하의 숫자만 가능합니다!"
            }else{
                gradeList.append(Int(tfGrade.text!)!)
                
                if checkCount == 2{
                    calc()
                    tfGrade.isHidden = true
                }
                
                tfGrade.text?.removeAll()
                checkCount += 1
                lblText.text = gradeName[checkCount]
            }

        }
    }
    
    // 빈 값 체크 & 100 이상 체크
    func gradeCheck() -> Int{
        if tfGrade.text?.isEmpty == true || Int(tfGrade.text!)! > 100{
            return 0
        }else{
            return 1
        }
    }
    
    // 값 계산하는 view 함수
    func calc(){

        // 합계
        let totalValue = total()
        // 평균
        let avgValue = avg(totalValue)
        // 평균 비교하기
        
        var resultMessage = "총점은 \(totalValue) 입니다.\n평균은 \(String(format: "%.2f", avgValue)) 입니다."
        for i in 0..<gradeList.count{
            if Double(gradeList[i]) < avgValue{
                resultMessage.append("\n\(gradeName[i])는 \(gradeList[i])이므로 평균보다 낮습니다.")
            }else if Double(gradeList[i]) > avgValue{
                resultMessage.append("\n\(gradeName[i])는 \(gradeList[i])이므로 평균보다 높습니다.")
            }else{
                resultMessage.append("\n\(gradeName[i])는 \(gradeList[i])이므로 평균입니다.")
            }
        }
        tvResult.text = resultMessage
        
    }
    
    // 합계 구하는 함수
    func total() -> Int{

        var total: Int = 0
        for i in 0..<gradeList.count{
            total += gradeList[i]
        }
        
        return total

    }
    
    // 평균 구하는 함수
    func avg(_ totalValue: Int) -> Double{
        
        let avg = Double(totalValue) / 3
        // let roundAvg = (String(format: "%.2f", avg))
        return avg
        
    }

}

