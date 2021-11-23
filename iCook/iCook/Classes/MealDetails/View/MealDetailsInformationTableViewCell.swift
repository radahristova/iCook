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
    
    //MARK: IBOutlets
    @IBOutlet weak var categoryDescriptionLabel: ICLabel!
    @IBOutlet weak var categoryValueLabel: ICLabel!
    @IBOutlet weak var areaDescriptionLabel: ICLabel!
    
    @IBOutlet weak var areaValueLabel: ICLabel!
    
    
    @IBOutlet weak var instructionsDescriptionLabel: ICLabel!
    @IBOutlet weak var instructionsValueLabel: ICLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryDescriptionLabel.configureBoldItalic(withSize: 19)
        areaDescriptionLabel.configureBoldItalic(withSize: 19)
        instructionsDescriptionLabel.configureBoldItalic(withSize: 19)
     
        categoryValueLabel.configureItalic(withSize: 19)
        areaValueLabel.configureItalic(withSize: 19)
 
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
