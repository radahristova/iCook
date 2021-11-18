//
//  ICServerConstants.swift
//  iCook
//
//  Created by Yavor Stanoev on 18.11.21.
//

import Foundation

class ICServerConstants {
    
    //Base URL
    static let BASE_URL = "https://www.themealdb.com/api/json/v1/1"
    
    //End-Points
    enum Routes: String {
        case categoriesList = "/categories.php"
        case fiterByCategory = "/filter.php?c="
    }
    
}
