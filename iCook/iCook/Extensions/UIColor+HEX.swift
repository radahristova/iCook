//
//  UIColor+HEX.swift
//  iCook
//
//  Created by Yavor Stanoev on 12.11.21.
//

import Foundation
import UIKit

extension UIColor {
    
    static var beigeColor = UIColor(hexaString: "#FCF8E8")
    
    
    //Init from HEX color
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
    
}
