//
//  ICView.swift
//  iCook
//
//  Created by Rada Hristova on 6.12.21.
//

import Foundation
import UIKit

class ICView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureStyle() {
        backgroundColor = .icViewBackgroundColor
    }
}
