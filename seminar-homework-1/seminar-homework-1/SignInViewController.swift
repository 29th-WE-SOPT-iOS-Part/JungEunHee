//
//  FirstViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/15.
//

import UIKit

class SignInViewController: UIViewController {
<<<<<<< HEAD
    
    // MARK: Labels
    @IBOutlet weak var descriptionLabel: UILabel!
    
=======
>>>>>>> 70ac2a4edf4b5b86decd5d483d8c0bb776f0a9e6

    // MARK: Text Fields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    

    // MARK: Buttons
    @IBOutlet weak var nextButton: UIButton!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        editChanged()
<<<<<<< HEAD
        lineBreak()
=======

>>>>>>> 70ac2a4edf4b5b86decd5d483d8c0bb776f0a9e6
    }
    
    
    // MARK: Methods
    @objc func textFieldCompleted(_ textField: UITextField) {
        nextButton.isEnabled = nameTextField.hasText && contactTextField.hasText && pwTextField.hasText
        // TextField가 모두 채워지면 버튼 활성화
    }
    
    func editChanged() {
        nextButton.isEnabled = false    // 처음에는 비활성화
<<<<<<< HEAD
        [nameTextField, contactTextField, pwTextField].forEach {
            $0?.addTarget(self, action: #selector(self.textFieldCompleted(_:)), for: .editingChanged)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 사용자가 처음 화면을 터치할 때 호출
        self.view.endEditing(true)
    }
    
    func lineBreak() {
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
=======
        self.nameTextField.addTarget(self, action: #selector(self.textFieldCompleted(_:)), for: .editingChanged)
        self.contactTextField.addTarget(self, action: #selector(self.textFieldCompleted(_:)), for: .editingChanged)
        self.pwTextField.addTarget(self, action: #selector(self.textFieldCompleted(_:)), for: .editingChanged)
>>>>>>> 70ac2a4edf4b5b86decd5d483d8c0bb776f0a9e6
    }
    
    // MARK: IBActions
    @IBAction func touchUpToSendName(_ sender: Any) {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        // as? ResultViewController
        
        resultVC.message = nameTextField.text
        resultVC.modalPresentationStyle = .fullScreen
        self.present(resultVC, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToGoSignUpView(_ sender: Any) {
        guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else {return}
        // guard let -> signUpVC가 nil인지 확인
        // 타입 캐스팅 -> SignUpViewController로 할당
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
        // push 방식으로 화면 전환
    }
    
}
