//
//  ICTabBarController.swift
//  iCook
//
//  Created by Rada Hristova on 15.11.21.
//

import Foundation
import UIKit

class ICTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let favorites = generateNavController(vc: ICViewController(), image: UIImage(systemName: "heart")!)
        let home = generateNavController(vc: ICViewController(), image: UIImage(systemName:"house")!)
        let settings = generateNavController(vc: ICViewController(), image: UIImage(systemName: "gearshape")!)
        viewControllers = [favorites, home, settings]
        view.backgroundColor = UIColor.redColor
        self.selectedIndex = 1
        
    }
    
    fileprivate func generateNavController(vc: ICViewController, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = image
        return navController
    }
    
    
}
