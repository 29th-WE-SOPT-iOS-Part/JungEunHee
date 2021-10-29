//
//  TabbarController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/18.
//

import UIKit

class TabbarController: UITabBarController {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabbar()
    }
    
    func setTabbar() {
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(identifier: "ShortsVC"),
              let plusVC = self.storyboard?.instantiateViewController(identifier: "PlusVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(identifier: "SubscribeVC"),
              let libraryVC = self.storyboard?.instantiateViewController(identifier: "LibraryVC")
            else { return }
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        shortsVC.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        
        plusVC.tabBarItem.title = "추가"
        plusVC.tabBarItem.image = UIImage(named: "plueCircleIcon-1")
        plusVC.tabBarItem.selectedImage = UIImage(named: "plueCircleIcon")
        
        subscribeVC.tabBarItem.title = "구독"
        subscribeVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        
        libraryVC.tabBarItem.title = "보관함"
        libraryVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        libraryVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        setViewControllers([homeVC, shortsVC, plusVC, subscribeVC, libraryVC], animated: true)
        
    }
}

