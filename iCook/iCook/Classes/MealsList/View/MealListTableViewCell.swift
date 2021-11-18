//
//  MealListTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import UIKit

class MealListTableViewCell: ICTableViewCell {
    
    static let CELL_IDENTIFIER = "MealListTableViewCell"

    @IBOutlet weak var categoryImageView: ICRoundedImageView!
    
    @IBOutlet weak var categoryMealLabel: ICLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    
    func populate(withMeal meals: MealListModel) {
        categoryMealLabel.text = meals.strMeal
    }

}
