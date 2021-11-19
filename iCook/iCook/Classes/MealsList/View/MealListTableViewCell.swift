//
//  MealListTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import UIKit

class MealListTableViewCell: ICTableViewCell {
    
    //MARK: Constants
    static let CELL_IDENTIFIER = "MealListTableViewCell"

    //MARK:  IBOutlets
    @IBOutlet weak var categoryImageView: ICRoundedImageView!
    
    @IBOutlet weak var categoryMealLabel: ICLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.setImageActivity()
        categoryImageView.radiusRatioToSmallerSide = 0
        categoryMealLabel.configureDefault(withSize: 19)
    }
    
    
    func populate(withMeal meals: MealListModel) {
        let url = URL(string: meals.strMealThumb ?? "")
        categoryImageView.kf.setImage(with: url)
        categoryMealLabel.text = meals.strMeal
    }

}
