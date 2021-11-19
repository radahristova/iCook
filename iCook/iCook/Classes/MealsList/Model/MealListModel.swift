//
//  MealListModel.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import Foundation

class MealListModelResponse: BaseAPIObject {
    var mealList: [MealListModel]?
    
    private enum CodingKeys: String, CodingKey {
        case meals
    }
    
    required init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        mealList = try? container?.decode([MealListModel].self, forKey: .meals)
        
        super.init()
                                 
    }
}


class MealListModel: Codable {
    
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case strMeal
        case strMealThumb
        case idMeal
    }
    
    required init(from decoder: Decoder) throws {
        let decoder = try? decoder.container(keyedBy: CodingKeys.self)
        strMeal = try? decoder?.decode(String.self, forKey: .strMeal)
        strMealThumb = try? decoder?.decode(String.self, forKey: .strMealThumb)
        idMeal = try? decoder?.decode(String.self, forKey: .idMeal)
    }
}
