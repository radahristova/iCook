//
//  Category.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import Foundation
import UIKit

class CategoryModel {

    //MARK: Properties
    let categoryID: String?
    let categoryString: String?
    let categoryImageURL: String?
    let categoryDescription: String?
    
    init(dictionary: [String: String]) {
        self.categoryID = dictionary["idCategory"]
        self.categoryString = dictionary["strCategory"]
        self.categoryImageURL = dictionary["strCategoryThumb"]
        self.categoryDescription = dictionary["strCategoryDescription"]
    }
    
    static func categories(dictionaries: [[String:String]]) -> [CategoryModel] {
        dictionaries.map { dictionary in
            CategoryModel(dictionary: dictionary)
        }
    }
}
