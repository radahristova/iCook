//
//  ICTableViewCell.swift
//  iCook
//
//  Created by Rada Hristova on 17.11.21.
//

import Foundation
import UIKit

class ICTableViewCell: UITableViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Remove cell selection color
        selectionStyle = .none

    }
    
}
