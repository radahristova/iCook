//
//  MealListModel.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import Foundation

class MealListModelResponse: BaseAPIObject {
    var mealList: [Meal]?
    
    private enum CodingKeys: String, CodingKey {
        case meals
    }
    
    required init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        mealList = try? container?.decode([Meal].self, forKey: .meals)
        
        super.init()
                                 
    }
}


class Meal: Codable {
    
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
    var details: MealDetailsModel?
    
    private enum CodingKeys: String, CodingKey {
        case strMeal
        case strMealThumb
        case idMeal
        case details
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        details = try? container.decode(MealDetailsModel.self, forKey: .details)
    }
}
