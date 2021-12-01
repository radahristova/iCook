//
//  StorageManager.swift
//  iCook
//
//  Created by Rada Hristova on 24.11.21.
//

import Foundation

protocol StorageManaging {
    var favoritesCount: Int { get }
    var maxFavorites: Int { get }
    var hasAddedMaxFavorites: Bool { get }
    @discardableResult
    func add(toFavorites meal: MealListModel) -> Bool
    func remove(fromFavoritesAt index: Int)
    func hasAddedAtIndex(toFavorites mealID: String?) -> Int?
    func meal(at index: Int) -> MealListModel?
   
}

class StorageManager : StorageManaging {
    static var sharedInstance = StorageManager()
    private init() {
        
    }
    
    var favoritesCount: Int {
        favorites.count
    }
    var hasAddedMaxFavorites: Bool {
        favorites.count >= maxFavorites
    }
    var maxFavorites: Int {
        10
    }
    
    private var favorites: [MealListModel] {
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
    
    func add(toFavorites meal: MealListModel) -> Bool {
        if hasAddedMaxFavorites == false {
            favorites.append(meal)
            return true
        }
        return false
    }
    
    func hasAddedAtIndex(toFavorites mealID: String?) -> Int? {
        favorites.firstIndex(where: { $0.idMeal == mealID })
    }
    
    func remove(fromFavoritesAt index: Int)  {
        favorites.remove(at: index)
    }
    
    func meal(at index: Int) -> MealListModel? {
        favorites[safe: index]
    }
    
    
}

extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
