//
//  MealDetailsImageTableViewCell.swift
//  iCook
//
//  Created by Yavor Stanoev on 23.11.21.
//

import UIKit
import Kingfisher

class MealDetailsImageTableViewCell: ICTableViewCell {

    //MARK: Constants
    static let CELL_IDENTIFIER = "MealDetailsImageTableViewCell"
    static let CELL_HEIGHT = CGFloat(250)
    private let DEFAULT_FONT_SIZE_LABEL = CGFloat(19)
    
    //MARK: IBOutlets
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: ICLabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mealNameLabel.configureDefault(withSize: DEFAULT_FONT_SIZE_LABEL)
    }
    
    func populate(withMeal meal: Meal) {
        let url = URL(string: meal.strMealThumb ?? "")
        mealImageView.kf.setImage(with: url)
        
        mealNameLabel.text = meal.strMeal
    }
    
}
