//
//  UIView+Shadow.swift
//  iCook
//
//  Created by Rada Hristova on 3.12.21.
//

import UIKit

extension UIView {
    
    func addShadow() {
        layer.shadowOffset = .zero
        layer.cornerRadius = CORNER_RADIUS
        layer.shadowOpacity = SHADOW_OPACITY
        layer.shadowRadius = SHADOW_RADIUS
        layer.shadowColor = UIColor.icShadowColor.cgColor
    }
    
}
