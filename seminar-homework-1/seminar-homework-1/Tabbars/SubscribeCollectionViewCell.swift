//
//  SubscribeCollectionViewCell.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/29.
//

import UIKit

class SubscribeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SubscribeCollectionViewCell"
    
    var subscribeContentList: [SubscribeData] = []
    
    // MARK: IBOutlets
    @IBOutlet weak var subscribeImageView: UIImageView!
    @IBOutlet weak var subscribeLabel: UILabel!
    
    // MARK: Methods
    func setData(channelName: String, channelImage: UIImage?) {
        // 외부에서 데이터를 넣어주는 함수
        subscribeLabel.text = channelName
        subscribeImageView.image = channelImage
    }
    
}
