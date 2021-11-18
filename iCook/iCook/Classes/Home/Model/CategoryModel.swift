//
//  Category.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import Foundation
import UIKit

class Cat: Codable {
    
    var categories: [CategoryModel]?
    
    private enum CodingKeys: String, CodingKey {
        case categories
    }
    
    required init(from decoder: Decoder) throws {
        let decoder = try? decoder.container(keyedBy: CodingKeys.self)
        categories = try? decoder?.decode([CategoryModel].self, forKey: .categories)
    }
}

class CategoryModel: Codable {

    var idCategory: String?
    var strCategory: String?
    var strCategoryThumb: String?
    
    private enum CodingKeys: String, CodingKey {
        case idCategory
        case strCategory
        case strCategoryThumb
    }
    
    required init(from decoder: Decoder) throws {
        let decoder = try? decoder.container(keyedBy: CodingKeys.self)
        idCategory = try? decoder?.decode(String.self, forKey: .idCategory)
        strCategory = try? decoder?.decode(String.self, forKey: .strCategory)
        strCategoryThumb = try? decoder?.decode(String.self, forKey: .strCategoryThumb)
    }
    
}
