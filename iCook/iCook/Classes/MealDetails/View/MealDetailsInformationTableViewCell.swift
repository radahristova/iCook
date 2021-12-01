//
//  MealDetailsInformationTableVTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 23.11.21.
//

import UIKit

class MealDetailsInformationTableViewCell: ICTableViewCell {

    //MARK: Constants
    static let CELL_IDENTIFIER = "MealDetailsInformationTableViewCell"
    static let CELL_BASE_HEIGHT = CGFloat(150)
    static let DEFAULT_FONT_LABEL = CGFloat(19)
    
    //MARK: IBOutlets
    @IBOutlet weak var categoryDescriptionLabel: ICLabel!
    @IBOutlet weak var categoryValueLabel: ICLabel!
    @IBOutlet weak var areaDescriptionLabel: ICLabel!
    
    @IBOutlet weak var areaValueLabel: ICLabel!
    
    
    @IBOutlet weak var instructionsDescriptionLabel: ICLabel!
    @IBOutlet weak var instructionsValueLabel: ICLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryDescriptionLabel.configureBoldItalic(withSize: MealDetailsInformationTableViewCell.DEFAULT_FONT_LABEL)
        areaDescriptionLabel.configureBoldItalic(withSize: MealDetailsInformationTableViewCell.DEFAULT_FONT_LABEL)
        instructionsDescriptionLabel.configureBoldItalic(withSize: MealDetailsInformationTableViewCell.DEFAULT_FONT_LABEL)
     
        categoryValueLabel.configureItalic(withSize: MealDetailsInformationTableViewCell.DEFAULT_FONT_LABEL)
        areaValueLabel.configureItalic(withSize: MealDetailsInformationTableViewCell.DEFAULT_FONT_LABEL)
 
        categoryDescriptionLabel.text = "Category:"
        areaDescriptionLabel.text = "Area:"
        instructionsDescriptionLabel.text = "Instructions:"
        
        instructionsValueLabel.configureDefault(withSize: 17)
        
    }
    
    func populate(withMeal meal: MealDetailsModel) {
        categoryValueLabel.text = meal.strCategory
        areaValueLabel.text = meal.strArea
        instructionsValueLabel.text = meal.strInstructions
    }

}
