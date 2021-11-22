//
//  MealDetailsModel.swift
//  iCook
//
//  Created by Rada Hristova on 22.11.21.
//

import Foundation

class MealDetailsModelResponse: BaseAPIObject {
    var mealDetails: [MealDetailsModel]?
    
    private enum CodingKeys: String, CodingKey {
        case meals
    }
    
    required init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        mealDetails = try? container?.decode([MealDetailsModel].self, forKey: .meals)
        
        super.init()
    }
}

class MealDetailsModel: Codable {

    
    var idMeal: String?
    var strMeal: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strMealThumb: String?
    
    private enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strCategory
        case strArea
        case strInstructions
        case strMealThumb
    }
    
    required init(from decoder: Decoder) throws {
        let decoder = try? decoder.container(keyedBy: CodingKeys.self)
        idMeal = try? decoder?.decode(String.self, forKey: .idMeal)
        strMeal = try? decoder?.decode(String.self, forKey: .strMeal)
        strCategory = try? decoder?.decode(String.self, forKey: .strCategory)
        strArea = try? decoder?.decode(String.self, forKey: .strArea)
        strInstructions = try? decoder?.decode(String.self, forKey: .strInstructions)
        strMealThumb = try? decoder?.decode(String.self, forKey: .strMealThumb)
    }
}
