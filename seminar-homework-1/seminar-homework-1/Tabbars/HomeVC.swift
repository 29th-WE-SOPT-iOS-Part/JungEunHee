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
    
    // cell에 넣을 데이터 리스트 프로퍼티를 빈 배열로 선언
    var videoContentList: [VideoContentData] = []
    var subscribeContentList: [SubscribeData] = []
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVideoContentList()
        initSubscribeContentList()
        
        registerXib()
        
        videoTableView.dataSource = self
        videoTableView.delegate = self
        subscribeCollectionView.dataSource = self
        subscribeCollectionView.delegate = self

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
    
    func initSubscribeContentList() {
        
        subscribeContentList.append(contentsOf: [
            SubscribeData(channelName: "구독리스트", channelImageName: "ggamju1"),
            SubscribeData(channelName: "공개합니다", channelImageName: "ggamju2"),
            SubscribeData(channelName: "자취남", channelImageName: "ggamju3"),
            SubscribeData(channelName: "인보라", channelImageName: "ggamju4"),
            SubscribeData(channelName: "티빙", channelImageName: "ggamju5"),
            SubscribeData(channelName: "비타민신지니", channelImageName: "ggamju6"),
            SubscribeData(channelName: "짧은대본", channelImageName: "ggamju7")
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

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexPath에 어떤 cell 데이터를 넣을지 결정하는 메소드
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubscribeCollectionViewCell.identifier, for: indexPath) as? SubscribeCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setData(channelName: subscribeContentList[indexPath.row].channelName, channelImage: subscribeContentList[indexPath.row].makeImage())
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return subscribeContentList.count
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
