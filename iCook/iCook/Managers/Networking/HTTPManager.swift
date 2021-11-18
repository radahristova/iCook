//
//  HTTPManager.swift
//  iCook
//
//  Created by Rada Hristova on 17.11.21.
//

import Foundation

protocol HTTPManagerDelegate {
    func didGetResponse(model: Cat)
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
            guard let dataJson = try? JSONSerialization
                    .jsonObject(with: data, options: .allowFragments) as? [String : [Any]] else {return}
            print(dataJson)
            
            let categoriesModel: Cat = try! JSONDecoder().decode(Cat.self, from: data)
            
            self.dataHandlingDelegate?.didGetResponse(model: categoriesModel)
        })
        
        task.resume()
        
    }
    
}
