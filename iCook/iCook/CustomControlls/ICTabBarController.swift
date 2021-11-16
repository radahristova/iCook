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
        view.backgroundColor = .icRedColor
        tabBar.backgroundColor = .icDarkColor
        self.tabBar.unselectedItemTintColor = .icTransparentGreenColor
        self.tabBar.tintColor = .icBeigeColor
    }
    
    private func configureViewControllers() {
        
        let favorites = UINavigationController(rootViewController: ICViewController())
        let tabOneBarItem = UITabBarItem(title: "Favourites",
                                         image: UIImage(systemName: "heart"),
                                         selectedImage: UIImage(systemName: "heart.fill"))
        
        favorites.tabBarItem = tabOneBarItem
        
        
        let home = UINavigationController(rootViewController: ICViewController())
        let tabTwoBarItem = UITabBarItem(title: "Home",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))
        home.tabBarItem = tabTwoBarItem
        
        let settings = UINavigationController(rootViewController: ICViewController())
        let tabThreeBarItem = UITabBarItem(title: "Settings",
                                         image: UIImage(systemName: "gearshape"),
                                         selectedImage: UIImage(systemName: "gearshape.fill"))
        settings.tabBarItem = tabThreeBarItem
        
        viewControllers = [favorites, home, settings]

    }
}
