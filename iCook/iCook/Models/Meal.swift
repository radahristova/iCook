//
//  MealListModel.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import Foundation

class Meal {
    var details: MealDetails?
    var id: String
    var name: String
    var thumbnailURL: URL?
    
    init(details: MealDetails? = nil, id: String, name: String, thumbnailURL: URL? = nil) {
        self.details = details; self.id = id; self.name = name; self.thumbnailURL = thumbnailURL
    }
    
    init?(from json: [AnyHashable: Any]) {
        guard let id = json["idMeal"] as? String,
              let name = json["strMeal"] as? String,
              let string = json["strMealThumb"] as? String else {
            return nil
        }
        self.id = id
        self.name = name
        self.thumbnailURL = URL(string: string)
    }
}
