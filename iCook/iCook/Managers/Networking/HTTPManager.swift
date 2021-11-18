//
//  HTTPManager.swift
//  iCook
//
//  Created by Rada Hristova on 17.11.21.
//

import Foundation

protocol HTTPManagerDelegate {
    func didGet(categories: [CategoryModel])
    
}

class HTTPManager {
    
    static let sharedInstance = HTTPManager()
    private init() {
        
    }
    
    private let baseURLString = "https://www.themealdb.com/api/json/v1/1/"
    
    var dataHandlingDelegate: HTTPManagerDelegate?
    
    func getCategories() {
        guard let url = URL(string:"\(baseURLString)categories.php") else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { ( data, response, error) in
            guard let data = data else {
                return
            }
//                  let categories = try? JSONSerialization
//                    .jsonObject(with: data, options: .allowFragments) as [String] else {
//                        return
//                    }
       //     self.dataHandlingDelegate?.didGet(categories: categories)
    
            
        })
        
        task.resume()
        
    }
    
}
