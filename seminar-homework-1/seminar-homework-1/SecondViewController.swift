//
//  SecondViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/06.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!  // 전달할 이름을 넣음
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        // guard let -> nextVC가 nil인지 확인
        // 타입 캐스팅 -> ResultViewController로 할당
        
        nextVC.message = dataTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
    }

}
