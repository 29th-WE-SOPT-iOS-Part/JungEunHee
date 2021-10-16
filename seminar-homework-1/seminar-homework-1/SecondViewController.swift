//
//  SecondViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/06.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: TextFields
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    // MARK: Buttons
    @IBOutlet weak var nextButton: UIButton!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.isEnabled = false    // 처음에는 비활성화
        textFieldAddTarget()    // 텍스트가 모두 채워지면 활성화
    }
    
    
    // MARK: Methods
    @objc func textFieldCompleted(_ textField: UITextField) {
        if dataTextField.hasText && contactTextField.hasText && pwTextField.hasText {   // Text가 모두 채워지면
            nextButton.isEnabled = true // 버튼 활성화
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func textFieldAddTarget() {
        self.dataTextField.addTarget(self, action: #selector(self.textFieldCompleted(_:)), for: .editingChanged)
        self.contactTextField.addTarget(self, action: #selector(self.textFieldCompleted(_:)), for: .editingChanged)
        self.pwTextField.addTarget(self, action: #selector(self.textFieldCompleted(_:)), for: .editingChanged)
    }
    
    
    // MARK: IBActions
    @IBAction func touchUpToSendData(_ sender: Any) {
        
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        // guard let -> nextVC가 nil인지 확인
        // 타입 캐스팅 -> ResultViewController로 할당
        
        nextVC.message = dataTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    @IBAction func touchUpToShowPW(_ sender: UIButton) {
        
    }
    
}
