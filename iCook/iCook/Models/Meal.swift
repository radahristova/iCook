//
//  MealListModel.swift
//  iCook
//
//  Created by Rada Hristova on 18.11.21.
//

import Foundation
import RealmSwift

class Meal: Object {
    @Persisted var name: String
    @Persisted var id: String
    @Persisted private var thumbnailString: String
    var thumbnailURL: URL? { URL(string: thumbnailString) }
    var details: MealDetails?

    convenience init?(from json: [AnyHashable: Any]) {
        guard let id = json["idMeal"] as? String,
              let name = json["strMeal"] as? String,
              let thumbnailString = json["strMealThumb"] as? String else {
            return nil
        }
        self.init()
        self.id = id
        self.name = name
        self.thumbnailString = thumbnailString
    }
}
