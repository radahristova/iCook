//
//  MealListTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import UIKit

class MealListTableViewCell: ICTableViewCell {

    static let CELL_IDENTIFIER = "MealListTableViewCell"
    private let DEFAULT_FONT_SIZE_LABEL = CGFloat(19)

    @IBOutlet weak var categoryImageView: ICRoundedImageView!
    @IBOutlet weak var categoryMealLabel: ICLabel!
    @IBOutlet weak var favoriteImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.setImageActivity()
        categoryImageView.radiusRatioToSmallerSide = 0
        categoryMealLabel.configureDefault(withSize: DEFAULT_FONT_SIZE_LABEL)
    }

    func populate(withMeal meal: Meal, isFavorite: Bool) {
        categoryImageView.kf.setImage(with: meal.thumbnailURL)
        categoryMealLabel.text = meal.name
        favoriteImage.isHidden = !isFavorite
    }

}
