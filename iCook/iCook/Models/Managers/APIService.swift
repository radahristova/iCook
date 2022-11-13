//
//  APIService.swift
//  iCook
//
//  Created by Rada Hristova on 12.11.22.
//

import Alamofire

class APIService {
    private let api: MealsAPI
    
    init(api: MealsAPI = MealsAPI()) {
        self.api = api
    }
}

extension APIService: DataFetching {
    func getCategories(completion: ([Category]) -> Void) {
        
    }
    
    func getMeals(in category: String, completion: ([Meal]) -> Void) {
        
    }
    
    func getDetails(of meal: String, completion: (MealDetails) -> Void) {
        
    }
}
