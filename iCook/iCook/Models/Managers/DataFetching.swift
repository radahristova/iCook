//
//  DataFetching.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.22.
//

import Foundation

protocol DataFetching {
    func getCategories(completion: ([Category]) -> Void)
    func getMeals(in category: String, completion: ([Meal]) -> Void)
    func getDetails(of meal: String, completion: (MealDetails) -> Void)
}


