//
//  TabbarController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/18.
//

import UIKit

class TabbarController: UITabBarController {

    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabbar()
    }
    
    // MARK: - Custom Method Part
    func setTabbar() {
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(identifier: "ShortsVC"),
              let plusVC = self.storyboard?.instantiateViewController(identifier: "PlusVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(identifier: "SubscribeVC"),
              let libraryVC = self.storyboard?.instantiateViewController(identifier: "LibraryVC")
            else { return }
        

        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        shortsVC.tabBarItem = UITabBarItem(title: "Shorts", image: UIImage(named: "shortsIcon"), selectedImage: UIImage(named: "shortsIconFill"))
        plusVC.tabBarItem = UITabBarItem(title: "추가", image: UIImage(named: "plueCircleIcon-1"), selectedImage: UIImage(named: "plueCircleIcon"))
        subscribeVC.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))
        libraryVC.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconFill"))
        
        
        setViewControllers([homeVC, shortsVC, plusVC, subscribeVC, libraryVC], animated: true)
        
    }
}

