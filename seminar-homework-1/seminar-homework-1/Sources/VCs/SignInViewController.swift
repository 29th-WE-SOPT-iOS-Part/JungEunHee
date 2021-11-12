//
//  FirstViewController.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/10/15.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - UI Component Part
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
//        editChanged()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // viewWillAppear -> 뷰가 화면에 돌아올 때마다 무언가를 할 수 있게 해주는 생명주기 메서드
        super.viewWillAppear(animated)
        setTextFieldEmpty()
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
    
    // alert 창을 띄우기 위한 함수
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        // 입력받은 이름 전달하는 부분 (userDefault 아님...)
        let okAction = UIAlertAction(title: "확인", style: .default) {_ in
            if message == "로그인 성공" {
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
                
//                nextVC.message = self.nameTextField.text
                self.present(nextVC, animated: true, completion: nil)
            }
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 사용자가 처음 화면을 터치할 때 호출
        self.view.endEditing(true)
    }
    
    func setTextFieldEmpty() {
        // TextField를 초기화 시켜주는 부분
        [nameTextField, contactTextField, pwTextField].forEach {
            $0.text = ""
        }
    }

    
    // MARK: - IBAction Part
    @IBAction func touchUpToSendName(_ sender: Any) {
//        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
//        // as? ResultViewController
//
//        resultVC.message = nameTextField.text
//        resultVC.modalPresentationStyle = .fullScreen
//        self.present(resultVC, animated: true, completion: nil)
        requestLogin()
    }
    
    @IBAction func touchUpToGoSignUpView(_ sender: Any) {
        guard let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else {return}
        // guard let -> signUpVC가 nil인지 확인
        // 타입 캐스팅 -> SignUpViewController로 할당
        
//        self.navigationController?.pushViewController(signUpVC, animated: true)
//        // push 방식으로 화면 전환
        self.present(signUpVC, animated: true, completion: nil)
        
    }
    
}

// MARK: - Extension Part
extension SignInViewController {
    
    // login 함수에서 정제해서 넘겨준 NetworkResult를 사용하는 부분
    func requestLogin() {
    UserLoginService.shared.login(email: contactTextField.text ?? "",
                                     password: pwTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else {return}
                if response.data != nil {
                    self.simpleAlert(title: "로그인",
                                     message: "로그인 성공")
                    UserDefaults.standard.set(self.nameTextField.text, forKey: "message")
                }
            case .requestErr:
                print("requestErr")
                self.simpleAlert(title: "로그인",
                                 message: "존재하지 않는 회원입니다.")
                
            case .pathErr:
                print("pathErr")
                self.simpleAlert(title: "로그인",
                                 message: "필요한 값이 없습니다.")
            case .serverErr:
                print("serverErr")

            case .networkFail:
                print("networkFail")
            }
        }
    }
}

