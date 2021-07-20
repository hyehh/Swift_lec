//
//  ViewController.swift
//  Alert
//
//  Created by Hyeji on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lampImage: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp_remove.png")
    
    // 상태 변수 선언 (Lamp State)
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        lampImage.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        switch isLampOn {
        case true:
            alertErrorOn()
//            let lampOnAlert = UIAlertController(title: "경고", message: "현재 ON 상태 입니다.", preferredStyle: .alert)
//            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
//
//            lampOnAlert.addAction(onAction)
//
//            // 애니메이션 뜨는게 true 인지 false 인지에 따라 다름 (true는 천천히 부드럽게 작동, false는 팍 뜸)
//            present(lampOnAlert, animated: true, completion: nil)
        default:
            lampImage.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        
        switch isLampOn {
        case true:
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: .alert)
            let offYesAction = UIAlertAction(title: "네", style: .default, handler: { ACTION in
                // 함수 안에 함수이기 때문에 self를 적어서 알려줘야 함!
                // self는 viewcontroller를 의미함! (function의 function이라 어떤 변수를 불러오든 다 self 작성!!!)
                self.lampImage.image = self.imgOff
                self.isLampOn = false
            })
            let offNoAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
            
            lampOffAlert.addAction(offYesAction)
            lampOffAlert.addAction(offNoAction)
            present(lampOffAlert, animated: true, completion: nil)
        default:
            alertErrorOff()
//            let lampOffImpossible = UIAlertController(title: "경고", message: "현재 OFF 상태 입니다.", preferredStyle: .alert)
//            let offAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
//
//            lampOffImpossible.addAction(offAction)
//            present(lampOffImpossible, animated: true, completion: nil)
        }

    }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거할까요?", preferredStyle: .alert)
        let removeFirstAction = UIAlertAction(title: "아니오, 끕니다.", style: .default, handler: {ACTION in
            switch self.isLampOn{
            case true:
                self.lampImage.image = self.imgOff
                self.isLampOn = false
            default:
                self.alertErrorOff()
            }
        })
        let removeSecondAction = UIAlertAction(title: "아니오, 켭니다.", style: .default, handler: {ACTION in
            switch self.isLampOn{
            case true:
                self.alertErrorOn()
            default:
                self.lampImage.image = self.imgOn
                self.isLampOn = true
            }
        })
        let removeThirdAction = UIAlertAction(title: "네, 제거합니다.", style: .default, handler: {ACTION in
            self.lampImage.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(removeFirstAction)
        lampRemoveAlert.addAction(removeSecondAction)
        lampRemoveAlert.addAction(removeThirdAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
    
    func alertErrorOn(){
        let lampOnAlert = UIAlertController(title: "경고", message: "현재 ON 상태 입니다.", preferredStyle: .alert)
        let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
        
        lampOnAlert.addAction(onAction)
        
        // 애니메이션 뜨는게 true 인지 false 인지에 따라 다름 (true는 천천히 부드럽게 작동, false는 팍 뜸)
        present(lampOnAlert, animated: true, completion: nil)
    }
    
    func alertErrorOff(){
        let lampOffImpossible = UIAlertController(title: "경고", message: "현재 OFF 상태 입니다.", preferredStyle: .alert)
        let offAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
        
        lampOffImpossible.addAction(offAction)
        present(lampOffImpossible, animated: true, completion: nil)
    }
    
}

