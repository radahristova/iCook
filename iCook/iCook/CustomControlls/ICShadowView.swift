//
//  ICShadowView.swift
//  iCook
//
//  Created by Yavor Stanoev on 2.12.21.
//

import UIKit

class ICShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureStyle()
    }
    
    private func configureStyle() {
        backgroundColor = .icBackgroundColor

        layer.shadowOffset = .zero
        layer.cornerRadius = CORNER_RADIUS
        layer.shadowOpacity = 0.5
        layer.shadowRadius = SHADOW_RADIUS
    }
    
}
