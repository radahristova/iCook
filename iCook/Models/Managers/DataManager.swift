//
//  APIService.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.22.
//

import Foundation

class MealsAPI {
    let BASE_URL: URL = URL(string: "https://www.themealdb.com/api/json/v1/1")!

    let routeCategories = "/categories.php"
    let routeCategoryMeals = "/filter.php"
    let routeMealDetails = "/lookup.php"
}

class DataManager {
    let api: MealsAPI
    var storage: Any?
    
    init(api: MealsAPI = MealsAPI()) {
        self.api = api
    }
    
    static let shared = DataManager()
}
