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
    private let DEFAULT_FONT_SIZE_LABEL = CGFloat(19)

    //MARK:  IBOutlets
    @IBOutlet weak var categoryImageView: ICRoundedImageView!
    
    @IBOutlet weak var categoryMealLabel: ICLabel!
    
    @IBOutlet weak var favoriteImage: UIImageView!
    
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.setImageActivity()
        categoryImageView.radiusRatioToSmallerSide = 0
        categoryMealLabel.configureDefault(withSize: DEFAULT_FONT_SIZE_LABEL)
        
    }

    func populate(withMeal meal: MealListModel) {
        let url = URL(string: meal.strMealThumb ?? "")
        categoryImageView.kf.setImage(with: url)
        categoryMealLabel.text = meal.strMeal
        favoriteImage.isHidden = StorageManager.sharedInstance.hasAddedAtIndex(toFavorites: meal.idMeal) == nil
    }

}
