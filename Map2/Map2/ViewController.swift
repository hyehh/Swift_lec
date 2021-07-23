//
//  ViewController.swift
//  Map2
//
//  Created by Hyeji on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var locationName = [("혜화문",37.5878892,127.0037098),("홍인지문",37.5711907,127.009506),("창의문",37.5926027,126.9664771),("숙정문",37.5956584,126.9810576)]
    var listCount = 0
    
    let myLoc = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listCount = locationName.count
        pageControlSetting()
        
        myLoc.requestWhenInUseAuthorization()
        lblName.text = locationName[0].0
        mapMove(locationName[0].1, locationName[0].2, locationName[0].0)
    }

    // 위치 그림 그리기
    func mapMove(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees, _ txt1: String) {
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        myMap.setRegion(pRegion, animated: true)
        setPin(pLoc, txt1)
    }
    
    // 핀 잡기
    func setPin(_ loc: CLLocationCoordinate2D, _ txt1: String) {
        let pin = MKPointAnnotation()
        pin.coordinate = loc
        pin.title = txt1
        myMap.addAnnotation(pin)
    }

    func pageControlSetting() {
        pageControl.numberOfPages = listCount
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.systemGray
        pageControl.currentPageIndicatorTintColor = UIColor.systemRed
    }
    
    @IBAction func btnPageControl(_ sender: UIPageControl) {
        mapMove(locationName[pageControl.currentPage].1, locationName[pageControl.currentPage].2, locationName[pageControl.currentPage].0)
    }
    
} // ViewController


