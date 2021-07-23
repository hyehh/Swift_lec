//
//  AddViewController.swift
//  Table2
//
//  Created by Hyeji on 2021/07/23.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tfDetail: UITextField!
    
    var columnCount = 1
    var listCount = 1
    var imgList = [UIImage?]()
    var imageFileList = ["cart.png", "clock.png", "pencil.png"]
    var pickerImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listCount = imageFileList.count
        for i in 0..<listCount {
            imgList.append(UIImage(named: imageFileList[i]))
        }
        
        imgView.image = imgList[0]
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        self.view.endEditing(true)
        
        items.append(tfDetail.text!)
        if !pickerImage.isEmpty {
            itemsImageFiles.append(pickerImage)
        }else {
            itemsImageFiles.append(imageFileList[0])
        }
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return columnCount
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listCount
    }
    
}

extension AddViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imgList[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerImage = imageFileList[row]
        imgView.image = imgList[row]
    }
}
