//
//  AddViewController.swift
//  CollectionView_Label
//
//  Created by Hyeji on 2021/07/26.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfHuman: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAppendHuman(_ sender: UIButton) {
        list.append(tfHuman.text!)
        navigationController?.popViewController(animated: true)
        // 화면 빠지면 어짜피 textfield 새롭게 만들어지기 때문에 굳이 여기에서 textfield 정리안해줘도 됨!
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
