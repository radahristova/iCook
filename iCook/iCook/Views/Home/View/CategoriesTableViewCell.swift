//
//  CategoriesTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import UIKit

class CategoriesTableViewCell: ICTableViewCell {
    
    //MARK: Constants
    static let CELL_IDENTIFIER = "CategoriesTableViewCell"
    
    //MARK:  IBOutlets
    @IBOutlet weak var imageViewCell: ICRoundedImageView!
    @IBOutlet weak var cellCategoryTitle: ICLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewCell.setImageActivity()

        cellCategoryTitle.configureDefault(withSize: 21)
    }
    
    func populate(withCategory category: CategoryModel) {
        let url = URL(string: category.strCategoryThumb ?? "")
        imageViewCell.kf.setImage(with: url)
        cellCategoryTitle.text = category.strCategory
    }

}
