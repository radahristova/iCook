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
        navigationBar.backgroundColor = .icBackgroundColor
        navigationBar.barTintColor = .icBackgroundColor
        appearance.backgroundColor = .icBackgroundColor
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        navigationBar.tintColor = .icAccentColor
    }

}
