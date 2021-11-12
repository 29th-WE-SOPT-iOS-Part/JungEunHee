//
//  SubscribeContentDataModel.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/29.
//

import UIKit

// 구독 채널명, 채널 이미지를 넣는 SubscribeData 모델
struct SubscribeData {
    
    let channelName: String
    let channelImageName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: channelImageName)
    }
}
