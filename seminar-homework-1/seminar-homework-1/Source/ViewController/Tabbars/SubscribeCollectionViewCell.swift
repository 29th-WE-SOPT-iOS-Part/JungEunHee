//
//  SubscribeCollectionViewCell.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/29.
//

import UIKit

class SubscribeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SubscribeCollectionViewCell"
    
    // MARK: - UI Component Part
    @IBOutlet weak var subscribeImageView: UIImageView!
    @IBOutlet weak var subscribeLabel: UILabel!
    
    // MARK: - Vars & Lets Part
    var text: String?
    var image: String?
    
    
    // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    // MARK: - Custom Method Part
    func setData(channelData: SubscribeData) {
        // 외부에서 데이터를 넣어주는 함수
        
        subscribeImageView.image = channelData.makeImage()
        subscribeLabel.text = channelData.channelName
    }
    
}

