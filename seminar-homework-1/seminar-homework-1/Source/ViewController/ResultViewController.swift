//
//  ResultViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/15.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - UI Component Part
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var otherLoginButton: UIButton!
    
    
    // MARK: - Vars & Lets Part
    var message: String?    // 전달받은 값을 대입하기 위한 프로퍼티
    
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
//        setMessageInLabel()
        setNameInLabel()
    }
    
    
    // MARK: - Custom Method Part
//    func setMessageInLabel() {
//        if let msg = message {
//            // 옵셔널 바인딩으로 값을 꺼내 nameLabel에 넣음
//            nameLabel.text = "\(msg)님"
//            nameLabel.sizeToFit()
//        }
//    }
    
    func setNameInLabel() {
        if let userName = UserDefaults.standard.string(forKey: "message") {
            nameLabel.text = "\(userName)님"
            nameLabel.sizeToFit()
        }
    }
    
    
    // MARK: - IBAction Part
    @IBAction func touchUpToGoSignInView(_ sender: Any) {
        // 로그인 화면으로 전환하는 부분
        guard let loginVC = self.presentingViewController as? UINavigationController else {return}
        
        self.dismiss(animated: true) {
            loginVC.popToRootViewController(animated: true)
            // 스택에 쌓인 뷰를 빼줌.
        }
    }
    
    @IBAction func touchUpToGoTabbar(_ sender: UIButton) {
        // Tabbar로 화면을 전환하는 부분
        let confirmStoryboard = UIStoryboard(name: "TabbarStoryboard", bundle: nil)
        
        guard let nextVC = confirmStoryboard.instantiateViewController(withIdentifier: "TabbarController") as? TabbarController else {return}
        // guard let -> nextVC가 nil인지 확인
        // 타입 캐스팅 -> TabbarController로 할당
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
}
