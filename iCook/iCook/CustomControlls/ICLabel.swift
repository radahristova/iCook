//
//  ICLabel.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import Foundation
import UIKit

class ICLabel: UILabel {
   
    //MARK: Constants
    private static let DEFAULT_FONT_SIZE = CGFloat(14)
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureDefault(withSize: ICLabel.DEFAULT_FONT_SIZE)
    }
    
    //MARK: Public Methods
    func setFontSize(_ size: CGFloat) {
        font = UIFont(name: self.font.fontName, size: size)
    }
    
    func configureDefault(withSize size: CGFloat? = ICLabel.DEFAULT_FONT_SIZE) {
        font = UIFont(name: "Palatino", size: size ?? ICLabel.DEFAULT_FONT_SIZE)
    }
    
    func configureBold(withSize size: CGFloat? = ICLabel.DEFAULT_FONT_SIZE) {
        font = UIFont(name: "Palatino-Bold", size: size ?? ICLabel.DEFAULT_FONT_SIZE)
    }
    
    func configureItalic(withSize size: CGFloat? = ICLabel.DEFAULT_FONT_SIZE) {
        font = UIFont(name: "Palatino-Italic", size: size ?? ICLabel.DEFAULT_FONT_SIZE)
    }
    func configureBoldItalic(withSize size: CGFloat? = ICLabel.DEFAULT_FONT_SIZE) {
        font = UIFont(name: "Palatino-BoldItalic", size: size ?? ICLabel.DEFAULT_FONT_SIZE)
    }
    
   
}
