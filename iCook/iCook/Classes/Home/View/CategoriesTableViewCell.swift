//
//  CategoriesTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    //MARK: Constants
    static let CELL_IDENTIFIER = "CategoriesTableViewCell"
    
    //MARK:  IBOutlets
    @IBOutlet weak var imageViewCell: ICRoundedImageView!
    @IBOutlet weak var cellCategoryTitle: ICLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
    }
    
    func populate(withCategory category: CategoryModel) {
        cellCategoryTitle.text = category.categoryString
    }
    
}