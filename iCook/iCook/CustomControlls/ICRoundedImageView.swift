//
//  ICRoundedImageView.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.21.
//

import Foundation
import UIKit

class ICRoundedImageView: UIImageView {
    
    lazy var radiusRatioToSmallerSide: CGFloat? = 0.15
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addObserver(self, forKeyPath: #keyPath(bounds), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard let path = keyPath,
                path == #keyPath(bounds),
                let bounds = value(forKey: path) as? CGRect else {
            return
        }
        setDefaultCornerRadius(with: bounds.size)
    }
    
    private func setDefaultCornerRadius(with size: CGSize) {
        guard let ratio = radiusRatioToSmallerSide else { return }
        let smallerSide = min(size.height, size.width)
        layer.cornerRadius = smallerSide * ratio
        clipsToBounds = true
    }
    
    deinit {
        removeObserver(self, forKeyPath: #keyPath(bounds))
    }
}
