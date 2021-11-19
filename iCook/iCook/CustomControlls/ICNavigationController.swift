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
        let appearance = UINavigationBarAppearance()
        modalPresentationStyle = .fullScreen
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = .backgroundColor
        navigationBar.barTintColor = .backgroundColor
        appearance.backgroundColor = .backgroundColor
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        navigationBar.tintColor = .accentColor
    }
    
}
