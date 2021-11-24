//
//  StorageManager.swift
//  iCook
//
//  Created by Rada Hristova on 24.11.21.
//

import Foundation

protocol StorageManaging {
    var favorites: [MealListModel] { get set }
}

class StorageManager : StorageManaging {
    static var shared = StorageManager()
    
    var favorites: [MealListModel] {
        set {
            favoritesInMemory = newValue
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: "favorites")
        }
        get {
            if favoritesInMemory == nil,
               let data = UserDefaults.standard.value(forKey: "favorites") as? Data,
               let favorites = try? JSONDecoder().decode([MealListModel].self, from: data) {
                favoritesInMemory = favorites
            }
            return favoritesInMemory ?? []
        }
    }
    
    private var favoritesInMemory: [MealListModel]?
}
