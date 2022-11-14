//
//  DataFetching.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.22.
//

import Foundation

protocol DataFetching {
    func get(completion: @escaping ([Category]) -> Void)
    func get(in category: String, completion: @escaping ([Meal]) -> Void)
    func get(of meal: String, completion: @escaping (MealDetails) -> Void)
}

protocol DataSaving {
    func save(meal: Meal)
    func savedMeals() -> [Meal]?
    func hasSavedMeal(withID mealID: String) -> Bool
    func removeMeal(withID mealID: String)
}

typealias DataManaging = DataFetching & DataSaving
