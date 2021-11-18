//
//  Category.swift
//  iCook
//
//  Created by Rada Hristova on 16.11.21.
//

import Foundation
import UIKit

class CategoryModelResponse: BaseAPIObject {
    
    var categories: [CategoryModel]?
    
    private enum CodingKeys: String, CodingKey {
        case categories
    }

    required init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        categories = try? container?.decode([CategoryModel].self, forKey: .categories)

        super.init()
    }
    
}

class CategoryModel: BaseAPIObject {

    var idCategory: String?
    var strCategory: String?
    var strCategoryThumb: String?
    
    private enum CodingKeys: String, CodingKey {
        case idCategory
        case strCategory
        case strCategoryThumb
    }
    
    required init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        idCategory = try? container?.decode(String.self, forKey: .idCategory)
        strCategory = try? container?.decode(String.self, forKey: .strCategory)
        strCategoryThumb = try? container?.decode(String.self, forKey: .strCategoryThumb)
        
        super.init()
    }
    
}
