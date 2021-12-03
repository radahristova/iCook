//
//  UIView+Shadow.swift
//  iCook
//
//  Created by Yavor Stanoev on 3.12.21.
//

import UIKit

extension UIView {
    
    func addShadow() {
        layer.shadowOffset = .zero
        layer.cornerRadius = CORNER_RADIUS
        layer.shadowOpacity = SHADOW_OPACITY
        layer.shadowRadius = SHADOW_RADIUS
    }
    
}