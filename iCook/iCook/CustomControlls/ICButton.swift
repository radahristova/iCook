//
//  ICButton.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import Foundation
import UIKit

class ICButton: UIButton {
    
  var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
}
