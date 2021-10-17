//
//  ResultViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/15.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: Text Fields
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: Labels
    @IBOutlet var nameLable: UILabel!
    var message: String?    // 전달받은 값을 대입하기 위한 프로퍼티
    
    
    // MARK: Buttons
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()

    }
    
    
    // MARK: Methods
    func setMessageInLabel() {
        if let msg = message {
            // 옵셔널 바인딩으로 값을 꺼내 nameLabel에 넣음
            nameLabel.text = msg + "님"
            nameLabel.sizeToFit()
        }
    }

}
