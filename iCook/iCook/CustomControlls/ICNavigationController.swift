//
//  ICNavigationController.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import Foundation
import UIKit

class ICNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        configureStyle()
    }
    
    private func configureStyle() {
        modalPresentationStyle = .fullScreen
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = .icDarkColor
        navigationBar.barTintColor = .icDarkColor
 
    }
}
