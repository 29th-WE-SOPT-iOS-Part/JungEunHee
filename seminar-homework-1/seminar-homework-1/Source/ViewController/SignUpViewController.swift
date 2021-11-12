//
//  SecondViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/15.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - UI Component Part
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
        @IBOutlet weak var nextButton: UIButton!
    
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
//        editChanged()

    }
    
    
    // MARK: - Custom Method Part
//    @objc func textFieldCompleted(_ textField: UITextField) {
//        nextButton.isEnabled = nameTextField.hasText && contactTextField.hasText && pwTextField.hasText
//        // TextField가 모두 채워지면 버튼 활성화
//    }
//    
//    func editChanged() {
//        nextButton.isEnabled = false    // 처음에는 비활성화
//        [nameTextField, contactTextField, pwTextField].forEach {
//            $0?.addTarget(self, action: #selector(self.textFieldCompleted(_:)), for: .editingChanged)
//        }
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 사용자가 처음 화면을 터치할 때 호출
        self.view.endEditing(true)
    }
    
    // alert 창을 띄우기 위한 함수
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        // 입력받은 이름 전달하는 부분 (userDefault 아님...)
        let okAction = UIAlertAction(title: "확인", style: .default) {_ in
            if message == "회원 가입 성공" {
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
                
                nextVC.message = self.nameTextField.text
                self.present(nextVC, animated: true, completion: nil)
            }
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    // MARK: - IBAction Part
    @IBAction func touchUpToSendName(_ sender: Any) {
//        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
//        // as? ResultViewController
//        
//        resultVC.message = nameTextField.text
//        resultVC.modalPresentationStyle = .fullScreen
//        self.present(resultVC, animated: true, completion: nil)
        requestSignUp()
    }
    
    @IBAction func touchUpToShowPW(_ sender: UIButton) {
        if sender.isSelected {
            // 처음 상태: sender.isSelected == false
            // togle() -> bool 값을 반전시키는 함수
            pwTextField.isSecureTextEntry.toggle()
        } else {
            pwTextField.isSecureTextEntry.toggle()
        }
    }
    

}

// MARK: - Extension Part
extension SignUpViewController {
    
    // login 함수에서 정제해서 넘겨준 NetworkResult를 사용하는 부분
    func requestSignUp() {
        UserSignupService.shared.signUp(name: nameTextField.text ?? "",
                                     email: contactTextField.text ?? "",
                                     password: pwTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let signupResponse):
                guard let response = signupResponse as? SignupResponseData else {return}
                if response.data != nil {
                    self.simpleAlert(title: "회원가입",
                                     message: "회원 가입 성공")
                    UserDefaults.standard.set(self.nameTextField.text, forKey: "message")
                }
            case .requestErr:
                print("requestERR")
                self.simpleAlert(title: "회원가입",
                                 message: "이미 사용 중인 이메일입니다.")
            case .pathErr:
                print("pathErr")
                self.simpleAlert(title: "회원가입",
                                 message: "필요한 값이 없습니다.")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}


