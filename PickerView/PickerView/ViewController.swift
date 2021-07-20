//
//  ViewController.swift
//  PickerView
//
//  Created by Hyeji on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    // outlet으로 연결해줘야 글씨 넣을 수 있음 (picker view는 액션이 없음!)
    // picker view는 outlet 밖에 없기에 action은 extension 사용해 추가해줘야 함
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var imageFileName = ["w1.jpg", "w2.jpg", "w3.jpg", "w4.jpg", "w5.jpg", "w6.jpg", "w7.jpg", "w8.jpg", "w9.jpg", "w10.jpg"]
    // picker view 움직이면 바로바로 움직이게 하기 위해 이미지 파일 배열도 생성
    // 기본적으로 UI쓰는 건 다 옵셔널임!
    var imageArray = [UIImage?]()
    // 선언자에서는 못씀!!! -> 이건 viewDidLoad에서 사용!
    // let maxArrayNum = imageFileName.count
    var maxArrayNum = 0 // 전체 데이터 개수
    let viewColumn = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        maxArrayNum = imageFileName.count
        
        // 이미지가 들어있는 배열이 완성됨! 이제 imageArray[i] 로 사용하면 됨!
        for i in 0..<maxArrayNum{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imgView.image = imageArray[0]
        
        // pickerImage에 dataSource는 viewcontroller(self) 가 가지고 있어!
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }

} // ViewController

// UIPickerViewDataSource : picker view의 외형 담당
extension ViewController: UIPickerViewDataSource{
    
    // picker view의 컬럼 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    
    // 출력할 이미지 파일 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
    
}

// picker view에 데이터 넣기 & 출력
extension ViewController: UIPickerViewDelegate{
    
    // picker view에 title 입히기(데이터 넣기) - titleForRow 기억!!!
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFileName[row] // row 사용 시 for문 안돌려도 사용가능!
    }
    
    // picker view에 Image 선택한 경우 출력 - didSelectRow 기억!!!
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imgView.image = imageArray[row]
    }
}
