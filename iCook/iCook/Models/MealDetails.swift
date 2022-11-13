//
//  MealDetailsModel.swift
//  iCook
//
//  Created by Rada Hristova on 22.11.21.
//

import Foundation
import RealmSwift

class MealDetails: Object {
    @Persisted var area: String
    @Persisted var instructions: String
    @Persisted var categoryName: String?

    convenience init?(from json: [AnyHashable: Any]) {
        guard let instructions = json["strInstructions"] as? String,
              let area = json["strArea"] as? String else {
            return nil
        }
        self.init()
        self.area = area
        self.instructions = instructions
        categoryName = json["strCategory"] as? String
    }
}
