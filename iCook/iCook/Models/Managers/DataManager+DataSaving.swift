//
//  StorageManager.swift
//  iCook
//
//  Created by Rada Hristova on 24.11.21.
//

import Foundation

extension DataManager: DataSaving {
    
    func save(meal: Meal) {
        do {
            try realm.write {
                realm.add(meal)
            }
        } catch let error {
            print(error)
        }
    }
    
    func savedMeals() -> [Meal]? {
        let result = realm.objects(Meal.self)
        let array = Array(result)
        return array.isEmpty == false ? array : nil
    }
    
    func hasSavedMeal(withID mealID: String) -> Bool {
        meal(withID: mealID) != nil
    }

    func removeMeal(withID mealID: String) {
        guard let meal = meal(withID: mealID) else {
            return
        }
        do {
            try realm.write {
                realm.delete(meal)
            }
        } catch let error {
            print(error)
        }
    }
    
    private func meal(withID id: String) -> Meal? {
        savedMeals()?.first(where: { $0.id == id })
    }
}

//class StorageManager : StorageManaging {
//    static var sharedInstance = StorageManager()
//    private init() {}
//
//    var favoritesCount: Int {
//        favorites.count
//    }
//    var hasAddedMaxFavorites: Bool {
//        favorites.count >= maxFavorites
//    }
//    var maxFavorites: Int {
//        10
//    }
//
//    private var favorites: [Meal] {
//        set {
//            favoritesInMemory = newValue
//            let data = try? JSONEncoder().encode(newValue)
//            UserDefaults.standard.set(data, forKey: "favorites")
//        }
//        get {
////            if favoritesInMemory == nil,
////               let data = UserDefaults.standard.value(forKey: "favorites") as? Data,
//////               let favorites = try? JSONDecoder().decode([Meal].self, from: data) {
////                favoritesInMemory = favorites
////            }
//            return favoritesInMemory ?? []
//        }
//    }
//
//    private var favoritesInMemory: [Meal]?
//
//    func add(toFavorites meal: Meal) -> Bool {
//        if hasAddedMaxFavorites == false {
//            favorites.append(meal)
//            return true
//        }
//        return false
//    }
//
//    func hasAddedAtIndex(toFavorites mealID: String?) -> Int? {
//        favorites.firstIndex(where: { $0.id == mealID })
//    }
//
//    func remove(fromFavoritesAt index: Int)  {
//        favorites.remove(at: index)
//    }
//
//    func meal(at index: Int) -> Meal? {
//        favorites[safe: index]
//    }
//}
