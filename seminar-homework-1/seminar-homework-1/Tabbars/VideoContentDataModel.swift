//
//  VideoContentDataModel.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/29.
//

import UIKit

// 데이터 모델을 만들어주는 부분
struct VideoContentData {
    
    let previewImageName: String
    let videoTitle: String
    let channelImageName: String
    let channelName: String
    let views: Int
    let sinceUpload: String
    
    func makePreviewImage() -> UIImage? {
        return UIImage(named: previewImageName)
    }
    
    func makeChannelImage() -> UIImage? {
        return UIImage(named: channelImageName)
    }
    
}
