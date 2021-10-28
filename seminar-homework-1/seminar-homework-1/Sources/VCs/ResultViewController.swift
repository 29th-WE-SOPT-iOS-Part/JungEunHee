//
//  ResultViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/15.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: Labels
    @IBOutlet weak var nameLabel: UILabel!
    var message: String?    // 전달받은 값을 대입하기 위한 프로퍼티
    
    // MARK: Buttons
    @IBOutlet weak var otherLoginButton: UIButton!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessageInLabel()
    }
    
    
    // MARK: Methods
    func setMessageInLabel() {
        if let msg = message {
            // 옵셔널 바인딩으로 값을 꺼내 nameLabel에 넣음
            nameLabel.text = "\(msg)님"
            nameLabel.sizeToFit()
        }
    }
    
    
    // MARK: IBActions
    @IBAction func touchUpToGoSignInView(_ sender: Any) {
        // 로그인 화면으로 전환하는 부분
        guard let loginVC = self.presentingViewController as? UINavigationController else {return}
        
        self.dismiss(animated: true) {
            loginVC.popToRootViewController(animated: true)
        }
    }
    
    @IBAction func touchUpToGoTabbar(_ sender: UIButton) {
        // Tabbar로 화면을 전환하는 부분
        let confirmStoryboard = UIStoryboard(name: "TabbarStoryboard", bundle: nil)
        
        guard let nextVC = confirmStoryboard.instantiateViewController(withIdentifier: "TabbarController") as? TabbarController else {return}
        // guard let -> nextVC가 nil인지 확인
        // 타입 캐스팅 -> TabbarController로 할당
        
        present(nextVC, animated: true, completion: nil)
    }
    
    
}
