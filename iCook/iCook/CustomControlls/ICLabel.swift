//
//  ICLabel.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import Foundation
import UIKit

class ICLabel: UILabel {
    
}


extension UILabel {

    // extension user defined Method
    func setRoundEdge() {
        let myGreenColor = (UIColor(red: -0.108958, green: 0.714926, blue: 0.758113, alpha: 1.0))
        //Width of border
        self.layer.borderWidth = 1.0
        //How much the edge to be rounded
        self.layer.cornerRadius = 5.0

        // following properties are optional
        //color for border
        self.layer.borderColor = myGreenColor.cgColor
        //color for text
        self.textColor = UIColor.red
        // Mask the bound
        self.layer.masksToBounds = true
        //clip the pixel contents
        self.clipsToBounds = true
    }
}
