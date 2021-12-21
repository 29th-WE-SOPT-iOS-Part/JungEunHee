//
//  HomeTapVC.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/12/20.
//

import UIKit

class HomeTapVC: UIViewController {
    static let identifier = "HomeTapVC"
    
    // MARK: - UI Component Part
    @IBOutlet var videoImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    
    var imageProperty: String?
    var titleProperty: String?
    var descriptionProperty: String?

    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTintColorSettings()
        setDataWith()    }
    
    func imageTintColorSettings() {
        let image = UIImage(named: "locationIcon.png")?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(image, for: .normal)
        backButton.tintColor = UIColor.white
    }
    
    func setDataWith() {    // ⭐️ 프로퍼티로 넘어올 값 세팅해주는 부분
        
        if let imageProperty = imageProperty {
            videoImageView.image = UIImage(named: imageProperty)
        }
        if let title = titleProperty {
            titleLabel.text = title
        }
        if let description = descriptionProperty {
            descriptionLabel.text = description
        }
    }

    @IBAction func touchedBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
