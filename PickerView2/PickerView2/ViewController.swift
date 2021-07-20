//
//  ViewController.swift
//  PickerView2
//
//  Created Hyeji TJ on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var pickerNumber: UIPickerView!
    @IBOutlet weak var tvResult: UITextView!
    
    var numberList: [String] = []
    let columnCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 2...9{
            numberList.append("\(i)단")
        }
        
        calc(0)
        pickerNumber.dataSource = self
        pickerNumber.delegate = self
    }
    
    // 함수 선언 여기에다 해도 extension은 이 함수를 안다!
    // -> 왜냐하면 ViewController를 확장시켜준 것이기 때문!!! (ViewController 내부에 있는 모든 변수는 extension이 다 알고있다!)
    func calc(_ row: Int){
        lblName.text = numberList[row]
        tvResult.text = ""
        
        for i in 1...9{
            tvResult.text.append("\(row+2) X \(i) = \((row+2) * i) \n")
        }
    }
    
} // ViewController

extension ViewController: UIPickerViewDataSource{
    
    // pickerView 외형 만들기
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return columnCount
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numberList[row] // 외형을 이미 만들어줘서 데이터가 몇 개인지 알고 있기 때문에 데이터 개수만큼 반복해서 pickerView에 데이터 넣어줌!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        calc(row)
    }
    

}
