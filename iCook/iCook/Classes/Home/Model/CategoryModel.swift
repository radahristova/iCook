//
//  Category.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import Foundation
import UIKit

class CategoryModel: Codable {

    //MARK: Properties
    var categoryID: String?
    var categoryString: String?
    var categoryImageURL: String?
    var categoryDescription: String?
    
    init(dictionary: [String: String]) {
        self.categoryID = dictionary["idCategory"]
        self.categoryString = dictionary["strCategory"]
        self.categoryImageURL = dictionary["strCategoryThumb"]
        self.categoryDescription = dictionary["strCategoryDescription"]
    }
    
    required init(from decoder: Decoder) throws {
        
    }
    
    static func categories(dictionaries: [[String:String]]) -> [CategoryModel] {
        dictionaries.map { dictionary in
            CategoryModel(dictionary: dictionary)
        }
    }
}
