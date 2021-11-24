//
//  StorageManager.swift
//  iCook
//
//  Created by Rada Hristova on 24.11.21.
//

import Foundation

class StorageManager {
    static var shared = StorageManager()
    
    var favorites: [MealListModel] {
        set {
            favoritesInMemory = newValue
            UserDefaults.standard.set(favoritesInMemory, forKey: "favorites")
        }
        get {
            favoritesInMemory ?? UserDefaults.standard.value(forKey: "favorites") as? [MealListModel] ?? []
        }
    }
    
    private var favoritesInMemory: [MealListModel]?
}
