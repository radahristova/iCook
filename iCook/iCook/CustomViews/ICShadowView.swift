//
//  ICShadowView.swift
//  iCook
//
//  Created by Yavor Stanoev on 2.12.21.
//

import UIKit

class ICShadowView: ICView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureStyle()
    }
    
    private func configureStyle() {
        addShadow()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            configureStyle()
        } 
    }
}
