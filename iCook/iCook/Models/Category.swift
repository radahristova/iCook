//
//  Category.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import Foundation

class Category {
    var id: String
    var name: String
    var thumbnail: URL?


    init?(from json: [AnyHashable: Any]) {
        guard let id = json["idCategory"] as? String,
              let name = json["strCategory"] as? String else {
            return nil
        }
        self.id = id
        self.name = name
        if let string = json["strCategoryThumb"] as? String {
            thumbnail = URL(string: string)
        }
    }
}
