//
//  ResultViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/06.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: Labels
    @IBOutlet weak var dataLabel: UILabel!
    // 전달받은 이름을 나타내는 Label
    var message: String?    // 전달받은 값을 대입하기 위한 프로퍼티
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()   // 이름을 표시
    }
    
    
    // MARK: Methods
    func setMessageInLabel() {  // 옵셔널 바인딩으로 값을 꺼내 dataLabel에 넣음
        if let msg = message {
            dataLabel.text = msg + "님"
            dataLabel.sizeToFit()
        }
    }


}

