//
//  UIColor+HEX.swift
//  iCook
//
//  Created by Yavor Stanoev on 12.11.21.
//

import Foundation
import UIKit

extension UIColor {
    
    static var icBeigeColor = UIColor(hexaString: "#FCF8E8")
    static var icRedColor = UIColor(hexaString: "#F64B31")
    static var icGreenColor = UIColor(hexaString: "#D4E2D4")
    static var icLightOrangeColor = UIColor(hexaString: "#ECB390")
    static var icDarkOrangeColor = UIColor(hexaString: "#DF7861")
    static var icDarkColor = UIColor(hexaString: "#3B1D17")
    static var icLightColor = UIColor(hexaString: "#F1CF91")
    static var icTransparentGreenColor = icGreenColor.withAlphaComponent(0.35)
    
    
    //Init from HEX color
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
    
}
