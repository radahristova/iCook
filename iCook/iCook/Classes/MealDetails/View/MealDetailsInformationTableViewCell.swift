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
    static let CELL_BASE_HEIGHT = CGFloat(250)
    
    //MARK: IBOutlets
    @IBOutlet weak var categoryLabel: ICLabel!
    
    @IBOutlet weak var areaLabel: ICLabel!
    
    @IBOutlet weak var categoryDescription: ICLabel!
    
    @IBOutlet weak var areaDescription: ICLabel!
    @IBOutlet weak var instructionDescription: ICLabel!
    @IBOutlet weak var instructionsLabel: ICLabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func populate(withMeal meal: MealDetailsModel) {
        categoryDescription.text = meal.strCategory
        areaDescription.text = meal.strArea
        instructionsLabel.text = meal.strInstructions
    }

}
