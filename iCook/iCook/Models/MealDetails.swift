//
//  MealDetailsModel.swift
//  iCook
//
//  Created by Rada Hristova on 22.11.21.
//

import Foundation

class MealDetails {
    var area: String
    var instructions: String
    var categoryName: String?

    init?(from json: [AnyHashable: Any]) {
        guard let instructions = json["strInstructions"] as? String,
              let area = json["strArea"] as? String else {
            return nil
        }
        self.area = area
        self.instructions = instructions
        categoryName = json["strCategory"] as? String
    }
}
