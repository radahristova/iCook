//
//  StorageManager.swift
//  iCook
//
//  Created by Rada Hristova on 24.11.21.
//

import RealmSwift

extension DataManager: DataSaving {
    
    private var realm: Realm? {
        if storage == nil {
            storage = try? Realm()
        }
        return storage as? Realm
    }
    
    func save(meal: Meal) {
        do {
            try realm?.write {
                realm?.add(MealPersistent(meal: meal))
            }
        } catch let error {
            print(error)
        }
    }
    
    func savedMeals() -> [Meal]? {
        savedMealsPersistent()?.compactMap { Meal(object: $0) }
    }
    
    func hasSavedMeal(withID mealID: String) -> Bool {
        meal(withID: mealID) != nil
    }

    func removeMeal(withID mealID: String) {
        guard let meal = meal(withID: mealID) else {
            return
        }
        do {
            try realm?.write {
                realm?.delete(meal)
            }
        } catch let error {
            print(error)
        }
    }
    
    private func savedMealsPersistent() -> [MealPersistent]? {
        guard let result = realm?.objects(MealPersistent.self) else {
            return nil
        }
        let array = Array(result)
        return array.isEmpty == false ? array : nil
    }
    
    private func meal(withID id: String) -> MealPersistent? {
        savedMealsPersistent()?.first(where: { $0.id == id })
    }
}

extension Meal {
    convenience init(object: MealPersistent) {
        var url: URL?
        if let string = object.thumbnailString {
            url = URL(string: string)
        }
        self.init(id: object.id, name: object.name, thumbnailURL: url)
    }
}

class MealPersistent: Object {
    @Persisted var name: String
    @Persisted var id: String
    @Persisted var thumbnailString: String?

    convenience init(meal: Meal) {
        self.init()
        name = meal.name
        id = meal.id
        thumbnailString = meal.thumbnailURL?.absoluteString
    }
}
