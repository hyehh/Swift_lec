//
//  ViewController.swift
//  Map
//
//  Created by Hyeji on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    // 버튼 모양이 바뀌기에 Outlet 에도 필요!
    @IBOutlet weak var locationGo: UISegmentedControl!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var addr1: UILabel!
    @IBOutlet weak var addr2: UILabel!
    
    let myLoc = CLLocationManager() // viewDidLoad 전에 작성!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization() // 승인 허용 문구 받아서 처리
        myLoc.startUpdatingLocation() // GPS 좌표 받기 시작
        myMap.showsUserLocation = true
    }
    
    // 위치 그림 그려주기
    // CLLocationDegrees : 좌표 값에 대한 데이터 타입
    // txt 현재 위치 같은 글자 / txt1은 받는 데이터
    func mapMove(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees, _ txt1: String) {
        // 지도 모양 정의 (가운데 부분 - 파란색 동그라미!)
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        // 지도 모양 배율
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        // 좌표 정보
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        // 현재 지도를 좌표 정보로 보이기
        myMap.setRegion(pRegion, animated: true)
        // 글자 보여주기 (해당 좌표의 위치를 글씨로 알려주기)
        let addrLoc = CLLocation(latitude: lat, longitude: lon)
        var txt2 = ""
        // 미국과 우리나라는 거꾸로 주소가 나열되어있기에!!
        // completionHandler 에 들어갈 것은 closure 함수
        // place, error function의 2가지 argument가 있다고 생각하기
        CLGeocoder().reverseGeocodeLocation(addrLoc, completionHandler: {place, error in
            let pm = place!.first
            txt2 = pm!.country! // 국가명
            txt2 += " " + pm!.locality! // 시 도
            txt2 += " " + pm!.thoroughfare! // 동 (있을 수도 있고 없을 수도 있음 : 없으면 위에까지만 나오고 있으면 여기까지 다 나옴)
            self.addr2.text = txt2
        })
        addr1.text = txt1
        // 여기에 우리가 만든 핀 함수 넣기!!!!
        setPoint(pLoc, txt1, txt2)
    }
    
    // 핀 잡기
    func setPoint(_ loc : CLLocationCoordinate2D, _ txt1: String, _ txt2: String) {
        // 핀 만들기
        let pin = MKPointAnnotation()
        
        pin.coordinate = loc
        pin.title = txt1
        pin.subtitle = txt2
        
        // 지도에 핀 집어넣기
        myMap.addAnnotation(pin)
    }
    
    // locationGo : outlet과 action 이름 같아도 상관 없음!
    @IBAction func locationGo(_ sender: UISegmentedControl) {
        // sender 가 Segment 뭘 선택했는지 알고 있음
        if sender.selectedSegmentIndex == 0 {
            myLoc.startUpdatingLocation() // 현재 위치!
        }else if sender.selectedSegmentIndex == 1 {
            mapMove(37.65243153, 127.0276397, "둘리 뮤지엄")
        }else if sender.selectedSegmentIndex == 2 {
            mapMove(37.57244171, 126.9595412, "서대문 형무소 역사관")
        }
    }

} // ViewController

// CLLocationManagerDelegate : 위치 정보를 가져옴
// myLoc 호출 시 CLLocationManager() 자동 실행
extension ViewController: CLLocationManagerDelegate{
    
    // gps는 신호를 계속 받음! 그래서 계속 업데이트해줘야 함! didUpdateLocations 기억!
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 신호의 가장 마지막으로 잡은 것을 내 위치라고 설정
        let lastLoc = locations.last
        // 지도 보기
        mapMove((lastLoc?.coordinate.latitude)!, (lastLoc?.coordinate.longitude)!, "현재 위치")
        myLoc.stopUpdatingLocation() // 좌표 받기 중지 (꼭 있어야 함)
    }
}
