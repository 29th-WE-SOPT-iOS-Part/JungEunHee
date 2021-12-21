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
    

    // MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTintColorSettings()

    }
    
    func imageTintColorSettings() {
        let image = UIImage(named: "locationIcon.png")?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(image, for: .normal)
        backButton.tintColor = UIColor.white
    }

    @IBAction func touchedBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
