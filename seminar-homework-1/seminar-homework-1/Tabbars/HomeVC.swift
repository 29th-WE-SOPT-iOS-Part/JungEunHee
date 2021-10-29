//
//  HomeVC.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/28.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var subscribeCollectionView: UICollectionView!
    
    // tableview cell에 넣을 앱 데이터 리스트 프로퍼티를 빈 배열로 선언
    var videoContentList: [VideoContentData] = []
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initVideoContentList()
        registerXib()
        videoTableView.dataSource = self
        videoTableView.delegate = self

    }
    
    // xib 등록
    func registerXib() {
        let xibName = UINib(nibName: VideoTableViewCell.identifier, bundle: nil)
        videoTableView.register(xibName, forCellReuseIdentifier: VideoTableViewCell.identifier)
    }
    
    // 구조체 데이터를 넣는 함수
    func initVideoContentList() {
        
        videoContentList.append(contentsOf: [
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "7AppJam", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주")
        ])
    }
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // heightForRowAt() -> indexPath별의 높이만 지정
        return 306
    }
    
}

extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // IndexPath -> TableView cell별로 데이터를 다르게 지정
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifier) as? VideoTableViewCell else {return UITableViewCell()}
        // dequeueReusableCell -> 재사용 큐에 cell이 있는지 물어봄
        // as? 타입 변환
        
        cell.setData(videoData: videoContentList[indexPath.row])
        
        return cell
    }
    
}
