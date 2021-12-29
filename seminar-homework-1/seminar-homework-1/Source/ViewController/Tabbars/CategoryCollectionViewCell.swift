//
//  CategoryCollectionViewCell.swift
//  seminar-homework-1
//
//  Created by 정은희 on 2021/12/29.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CategoryCollectionViewCell"
    
    // MARK: - UI Component Part
    @IBOutlet var categoryButton: UIButton!

    // MARK: - Life Cycle Part
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonShape()
    }
    
    // MARK: - Custom Method Part
    private func setButtonShape() {
        categoryButton.layer.cornerRadius = 16
        categoryButton.layer.borderWidth = 1
        categoryButton.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    func setData(categoryData: CategoryContentData) {
        categoryButton.setTitle(categoryData.categoryName, for: .normal)
    }

}
