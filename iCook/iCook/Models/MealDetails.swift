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

class MealDetailsModel: BaseAPIObject {

    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
  
    private enum CodingKeys: String, CodingKey {
        case strCategory
        case strArea
        case strInstructions
    }
  
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        super.init()
    }
}
