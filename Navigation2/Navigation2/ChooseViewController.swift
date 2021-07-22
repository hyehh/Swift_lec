//
//  ChooseViewController.swift
//  Navigation2
//
//  Created by Hyeji on 2021/07/22.
//

import UIKit

class ChooseViewController: UIViewController {

    @IBOutlet weak var swOn: UISwitch!
    @IBOutlet weak var swRed: UISwitch!
    
    var isOn: Bool = true
    var isRed: Bool = false
    
    var delegate: DelegateLamp?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchState()
        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//    }
    
    func switchState() {
        swOn.isOn = isOn
        swRed.isOn = isRed
    }

    @IBAction func swIsOn(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            isOn = true
            swRed.isEnabled = true
        default:
            isOn = false
            swRed.isEnabled = false
            // 이게 필요한 이유는 lamp on / red on 일 경우 off 를 끄게 되면 red 는 enabled false가 되긴하지만 red on 상태로 enabled false가 되기 때문!
            // 그래서 isRed = false 를 해야 한다!
            isRed = false
            swRed.isOn = isRed
        }
    }
    
    @IBAction func swIsRed(_ sender: UISwitch) {
        if isOn { // lamp on 상태인 경우
            switch sender.isOn { // red가 켜져있는 경우와 꺼져있는 경우
            case true:
                isRed = true
                swRed.isOn = isRed
            default:
                isRed = false
                swRed.isOn = isRed
            }
        }
    }
    
    @IBAction func btnFinish(_ sender: UIButton) {
        //delegate?.didLampOnOffDone(self, isOn)
        delegate?.didLampRedDone(self, isRed, isOn)
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
