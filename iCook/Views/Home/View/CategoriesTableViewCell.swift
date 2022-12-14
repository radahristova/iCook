//
//  CategoriesTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import UIKit

class CategoriesTableViewCell: ICTableViewCell {

    static let CELL_IDENTIFIER = "CategoriesTableViewCell"

    @IBOutlet weak var imageViewCell: ICRoundedImageView!
    @IBOutlet weak var cellCategoryTitle: ICLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewCell.setImageActivity()
        cellCategoryTitle.configureDefault(withSize: 21)
    }

    func populate(withCategory category: Category) {
        imageViewCell.sd_setImage(with: category.thumbnail)
        cellCategoryTitle.text = category.name
    }

}
