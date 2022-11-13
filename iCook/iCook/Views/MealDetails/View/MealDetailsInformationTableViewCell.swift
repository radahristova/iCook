//
//  MealDetailsInformationTableVTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 23.11.21.
//

import UIKit

class MealDetailsInformationTableViewCell: ICTableViewCell {

    static let CELL_IDENTIFIER = "MealDetailsInformationTableViewCell"
    static let CELL_BASE_HEIGHT = CGFloat(150)
    private let DEFAULT_FONT_LABEL = CGFloat(19)

    @IBOutlet weak var categoryDescriptionLabel: ICLabel!
    @IBOutlet weak var categoryValueLabel: ICLabel!
    @IBOutlet weak var areaDescriptionLabel: ICLabel!
    @IBOutlet weak var areaValueLabel: ICLabel!
    @IBOutlet weak var instructionsDescriptionLabel: ICLabel!
    @IBOutlet weak var instructionsValueLabel: ICLabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        categoryDescriptionLabel.configureBoldItalic(withSize: DEFAULT_FONT_LABEL)
        areaDescriptionLabel.configureBoldItalic(withSize: DEFAULT_FONT_LABEL)
        instructionsDescriptionLabel.configureBoldItalic(withSize: DEFAULT_FONT_LABEL)
        categoryValueLabel.configureItalic(withSize: DEFAULT_FONT_LABEL)
        areaValueLabel.configureItalic(withSize: DEFAULT_FONT_LABEL)
 
        categoryDescriptionLabel.text = "Category:"
        areaDescriptionLabel.text = "Area:"
        instructionsDescriptionLabel.text = "Instructions:"

        instructionsValueLabel.configureDefault(withSize: 17)
    }

    func populate(withMeal meal: MealDetails) {
        categoryValueLabel.text = meal.categoryName
        areaValueLabel.text = meal.area
        instructionsValueLabel.text = meal.instructions
    }

}
