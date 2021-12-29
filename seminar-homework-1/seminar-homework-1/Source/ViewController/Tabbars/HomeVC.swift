//
//  HomeVC.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/28.
//

import UIKit

class HomeVC: UIViewController, UIGestureRecognizerDelegate {
    
    static let identifier = "HomeVC"
    
    // MARK: - UI Component Part
    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var subscribeCollectionView: UICollectionView!
    @IBOutlet var categoryCollectionView: UICollectionView!
    
    // cell에 넣을 데이터 리스트 프로퍼티를 빈 배열로 선언
    var videoContentList: [VideoContentData] = []
    var subscribeContentList: [SubscribeData] = []
    var categoryContentList: [CategoryContentData] = []
    
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVideoContentList()
        initSubscribeContentList()
        initCategoryContentList()
        
        registerXib()
        
        setTableView()
        setCollectionView()
    }
    

    // MARK: - IBAction Part
    @IBAction func touchUpToGoLogin(_ sender: UIButton) {
            
        let MainSB = UIStoryboard.init(name: "Main", bundle: nil)
        guard let loginVC = MainSB.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else {return}
        
        self.present(loginVC, animated: true, completion: nil)

    }
    
    
    // MARK: - Custom Method Part
    func setTableView() {
        videoTableView.dataSource = self
        videoTableView.delegate = self
    }
    
    func setCollectionView() {
        // forEach() -> 주어진 함수를 배열 요소 각각에 대해 실행
        [subscribeCollectionView, categoryCollectionView].forEach {
            $0?.delegate = self
            $0?.dataSource = self
        }
    }

    
    // xib 등록
    func registerXib() {
        videoTableView.register(UINib(nibName: VideoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: VideoTableViewCell.identifier)
        subscribeCollectionView.register(UINib(nibName: SubscribeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SubscribeCollectionViewCell.identifier)
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
    
    // 구조체 데이터를 넣는 함수
    func initVideoContentList() {
        videoContentList.append(contentsOf: [
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "4차 iOS 세미나 : Cocoapods & Networking, REST API", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주"),
            VideoContentData(previewImageName: "wesoptiOSPart", videoTitle: "AppJam", channelImageName: "wesoptProfile", channelName: "WE SOPT", views: 100, sinceUpload: "3주")
        ])
    }
    
    func initSubscribeContentList() {
        subscribeContentList.append(contentsOf: [
            SubscribeData(channelName: "iOSPart", channelImageName: "ggamju1"),
            SubscribeData(channelName: "AndroidPart", channelImageName: "ggamju2"),
            SubscribeData(channelName: "SeverPart", channelImageName: "ggamju3"),
            SubscribeData(channelName: "WebPart", channelImageName: "ggamju4"),
            SubscribeData(channelName: "DesignPart", channelImageName: "ggamju5"),
            SubscribeData(channelName: "PlanPart", channelImageName: "ggamju6"),
        ])
    }
    
    func initCategoryContentList() {
        categoryContentList.append(contentsOf: [
            CategoryContentData(categoryName: "전체"),
            CategoryContentData(categoryName: "오늘"),
            CategoryContentData(categoryName: "이어서 시청하기"),
            CategoryContentData(categoryName: "시청하지 않음"),
            CategoryContentData(categoryName: "실시간"),
            CategoryContentData(categoryName: "게시물")
            
        ])
    }
}


// MARK: - Extension Part
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // heightForRowAt() -> indexPath별의 높이만 지정
        return 306
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)   // 셀을 클릭했을 때 회색 표시 안 뜨게 해줌
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
        
        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(tapView(gestureRecognizer:)))
        
        videoTableView.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer.delegate = self
        
        return cell
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: HomeTapVC.identifier) as? HomeTapVC else {return}
        nextVC.modalPresentationStyle = .fullScreen

        nextVC.imageProperty = "wesoptiOSPart"
        nextVC.titleProperty = "1차 세미나 : iOS 컴포넌트 이해, XCode 기본 사용법, View 화면 전환"
        nextVC.descriptionProperty = "WE SOPT ・조회수 100만회 ・ 3주 전"
        
        present(nextVC, animated: true)
    }
    
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexPath에 어떤 cell 데이터를 넣을지 결정하는 메소드
        
        // switch-case로 구분해 반환
        
        // -- 구독 --
        switch collectionView {
        case subscribeCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubscribeCollectionViewCell.identifier, for: indexPath) as? SubscribeCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setData(channelData: SubscribeData(channelName: subscribeContentList[indexPath.item].channelName, channelImageName: subscribeContentList[indexPath.item].channelImageName))
            
            return cell
        
        // -- 카테고리 --
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setData(categoryData: CategoryContentData(categoryName: categoryContentList[indexPath.item].categoryName))
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // switch-case로 구분해 반환
        switch collectionView {
        case subscribeCollectionView:
            return subscribeContentList.count
        case categoryCollectionView:
            return categoryContentList.count
        default:
            return 0
        }
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        
        // -- 구독 --
        case subscribeCollectionView:
            return CGSize(width: 72, height: 104)
        
        // -- 카테고리 --
        case categoryCollectionView:
            let cellWidth = categoryContentList[indexPath.item].categoryName.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]).width + 20
            return CGSize(width: cellWidth, height: 32)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case categoryCollectionView:
            return UIEdgeInsets(top: 0, left: 9, bottom: 0, right: 9)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // minimumLineSpacingForSectionAt -> 최소 간격 (= 셀 크기가 다양할 때 최소 이만큼은 떨어져 있다!!)
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        switch collectionView {
        case categoryCollectionView:
            return 9
        default:
            return 0
        }
    }
}
