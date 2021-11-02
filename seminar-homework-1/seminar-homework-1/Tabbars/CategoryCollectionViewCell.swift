//
//  CategoryCollectionViewCell.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/11/02.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    // MARK: IBOutlets
    @IBOutlet weak var categoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonShape()
    }
    
    func setButtonShape() {
        categoryButton.layer.cornerRadius = 16
        categoryButton.layer.borderWidth = 1
        categoryButton.layer.borderColor = UIColor.systemGray4.cgColor
    }

    func setData(categoryData: CategoryContentData) {
        // 외부에서 data를 넣어주는 함수
        categoryButton.setTitle(categoryData.categoryName, for: .normal)
    }
}
