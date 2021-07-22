//
//  ViewController.swift
//  Navigation2
//
//  Created by Hyeji on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lampImage: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRed = UIImage(named: "lamp_red.png")
    var isOn: Bool = true
    var isRed: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImage.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let chooseViewController = segue.destination as? ChooseViewController
        chooseViewController?.isOn = isOn
        chooseViewController?.isRed = isRed
        
        chooseViewController?.delegate = self
        
    }
}

extension ViewController: DelegateLamp{

    
    func didLampRedDone(_ controller: ChooseViewController, _ isRed: Bool, _ isOn: Bool) {
        // isOn 과 isRed 모두 true false 값을 줘야 함!
        switch isRed {
        case true:
            lampImage.image = imgRed
            self.isOn = true
            self.isRed = true
        default:
            switch isOn {
            case true:
                lampImage.image = imgOn
                self.isOn = true
                self.isRed = false
            default:
                lampImage.image = imgOff
                self.isOn = false
                self.isRed = false
            }
        }
    }
    
}
