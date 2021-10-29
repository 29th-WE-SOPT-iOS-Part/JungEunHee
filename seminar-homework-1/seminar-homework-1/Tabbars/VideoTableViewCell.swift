//
//  VideoTableViewCell.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/28.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    static let identifier = "VideoTableViewCell"
    
    // MARK: IBOutlets
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(videoData: VideoContentData) {
        // IBOutlets으로 선언했던 변수들에 데이터를 넣어주는 부분
        
        previewImageView.image = videoData.makePreviewImage()
        channelImageView.image = videoData.makeChannelImage()
        
        titleLabel.text = videoData.videoTitle
        
        descriptionLabel.text = "\(videoData.channelName) · 조회수 \(videoData.views)만회 ·  \(videoData.sinceUpload) 전"
        
    }
}
