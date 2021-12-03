//
//  ICLabel.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import Foundation
import UIKit

class ICLabel: UILabel {
       
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Public Methods
    func setFontSize(_ size: CGFloat) {
        font = UIFont(name: self.font.fontName, size: size)
    }
    
    func configureDefault(withSize size: CGFloat) {
        font = .defaultFont?.withSize(size)
    }
    func configureBold(withSize size: CGFloat) {
        font = .boldFont?.withSize(size)
    }
    func configureItalic(withSize size: CGFloat) {
        font = .italicFont?.withSize(size)
    }
    func configureBoldItalic(withSize size: CGFloat) {
        font = .boldItalicFont?.withSize(size)
    }
    
   
}
