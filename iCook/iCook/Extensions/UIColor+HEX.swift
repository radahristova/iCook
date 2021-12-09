//
//  UIColor+HEX.swift
//  iCook
//
//  Created by Yavor Stanoev on 12.11.21.
//

import Foundation
import UIKit

extension UIColor {
    
    static var icRedColor = UIColor(hexaString: "#F64B31")
    
    static let icAccentColor = UIColor(hexaString: "#FF8942")
    static let icAccentColorTransparent = icAccentColor.withAlphaComponent(0.6)
    static let icBackgroundColor = dynamicColor(light:UIColor(hexaString: "#F7F7F7"), dark: UIColor.systemGray6)
    static let icDefaultLabelColor = dynamicColor(light: .black, dark: .white)
    static let icViewBackgroundColor = dynamicColor(light: UIColor(hexaString: "#F7F7F7"), dark: UIColor.systemGray4)
    static let icShadowColor = dynamicColor(light: .black, dark: .clear)
    
    
    //Init from HEX color
    convenience init(hexaString: String, alpha: CGFloat = 1) {
        let chars = Array(hexaString.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255,
                  alpha: alpha)}
    
}

extension UIColor {
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return light }
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
}
