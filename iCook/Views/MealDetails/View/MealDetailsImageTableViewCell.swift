//
//  MealDetailsImageTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 23.11.21.
//

import UIKit
import SDWebImage

class MealDetailsImageTableViewCell: ICTableViewCell {

    static let CELL_IDENTIFIER = "MealDetailsImageTableViewCell"
    static let CELL_HEIGHT = CGFloat(250)
    private let DEFAULT_FONT_SIZE_LABEL = CGFloat(19)

    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealNameLabel: ICLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        mealNameLabel.configureDefault(withSize: DEFAULT_FONT_SIZE_LABEL)
    }

    func populate(withMeal meal: Meal) {
        mealImageView.sd_setImage(with: meal.thumbnailURL)
        mealNameLabel.text = meal.name
    }

}
