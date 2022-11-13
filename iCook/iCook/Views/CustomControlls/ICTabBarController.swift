//
//  ICTabBarController.swift
//  iCook
//
//  Created by Rada Hristova on 15.11.21.
//

import Foundation
import UIKit

class ICTabBarController: UITabBarController {
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStyle()
        configureViewControllers()
    }

    private func configureStyle() {
        modalPresentationStyle = .fullScreen
        
        tabBar.isTranslucent = false
        
        tabBar.backgroundColor = .icBackgroundColor
        tabBar.unselectedItemTintColor = .black.withAlphaComponent(0.7)
        tabBar.tintColor = .icAccentColor

        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .icBackgroundColor
        tabBar.standardAppearance = appearance;
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
    }
    
    private func configureViewControllers() {
        let manager: DataManaging = DataManager.shared
        let favoritesVC = FavoritesViewController()
        favoritesVC.manager = manager
        let favorites = ICNavigationController(rootViewController: favoritesVC)
        favorites.tabBarItem = UITabBarItem(
            title: "Favourites", image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill")
        )
        
        let homeVC = HomeViewController()
        homeVC.manager = manager
        let home = ICNavigationController(rootViewController: homeVC)
        home.tabBarItem = UITabBarItem(
            title: "Categories", image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let settings = ICNavigationController(rootViewController: SettingsViewController())
        settings.tabBarItem =  UITabBarItem(
            title: "Settings", image: UIImage(systemName: "gearshape"),
            selectedImage: UIImage(systemName: "gearshape.fill")
        )
        
        viewControllers = [favorites, home, settings]

    }

}
