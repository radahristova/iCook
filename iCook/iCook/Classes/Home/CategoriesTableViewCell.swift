//
//  CategoriesTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    //MARK:  IBOutlets
    @IBOutlet weak var imageViewCell: UIImageView!
    @IBOutlet weak var cellCategoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
