//
//  ICButton.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import Foundation
import UIKit

class ICButton: UIButton {
    
    //MARK: Variables
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .icBackgroundColor.withAlphaComponent(0.7) : .icBackgroundColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addTarget(self, action: #selector(hapticFeedbackOnPress), for: .touchUpInside)
        configureStyle()
    }
    
    //MARK: Public Methods
    func addBorder(color: UIColor? = .icAccentColor,
                   width: CGFloat? = 2) {
        layer.borderColor = color?.cgColor
        layer.borderWidth = width!
    }
    
    func configureForSignOut() {
        tintColor = .red
        setTitleColor(.red, for: .normal)
    }
    
    //MARK: Util Methods
    private func configureStyle() {
        backgroundColor = .icBackgroundColor
        setTitleColor(.icAccentColor, for: .normal)
        titleLabel?.font = .defaultFont?.withSize(18)
                
        layer.cornerRadius = CORNER_RADIUS
        
        //Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = SHADOW_RADIUS
    }
    
    @objc private func hapticFeedbackOnPress() {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
    }
    
}
