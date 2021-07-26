//
//  ViewController.swift
//  CollectionView_Label
//
//  Created by Hyeji on 2021/07/26.
//

import UIKit

var list = ["유비", "관우", "장비", "조조", "여포", "동탁", "초선", "손견", "장양", "손책"]

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail" {
            let cell = sender as! CollectionViewCell
            let indexPath = self.collectionView.indexPath(for: cell)
            // segue를 통해서 instance 하나를 만들었다고 생각하기
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItems(list[indexPath!.row])
        }
    }

} // ViewController

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // cell의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    // cell 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // collectionView는 collectionView: UICollectionView 변수 이름
        // CollectionViewCell 타입으로 변환시키기
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .lightGray // cell의 배경색
        cell.lblHuman.text = list[indexPath.row]
        cell.lblHuman.backgroundColor = .yellow // 글자의 배경색
        return cell
    }
    
}

// cell Layout 정의 (중요!!!) - cell을 어떻게 배치하겠냐의 부분임
// ViewController에게 알려줘야 함!
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // 위 아래 간격
    // minimumLine 기억!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1 // 간격을 1씩 띄울꺼야
    }
    
    // 옆 간격
    // minimumInteritem 기억!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // cell 사이즈 정의 (옆 라인을 고려하여 설정)
    // cell 사이즈 storyboard에서 정의하는 거 의미 없음! 여기서 해줘야 함!
    // sizeForItemAt 기억!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 화면 한 줄에 3등분하여 배치한다는 것을 의미 (옆 간격이 1 이므로 1을 빼줘야 함)
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width) // 정사각형 만들기 위함
        return size
    }
    
}
