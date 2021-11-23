//
//  HTTPManager.swift
//  iCook
//
//  Created by Rada Hristova on 17.11.21.
//

import Foundation
import UIKit

protocol HTTPManagerDelegate {
    func didGetResponse(model: BaseAPIObject)
}

class HTTPManager {
    
    //MARK: Constants
    static let sharedInstance = HTTPManager()
    private init() {}
    
    //MARK: Variables
    private var dataHandlingDelegate: HTTPManagerDelegate?
    
    //Generic request method
    private func makeRequest(delegate: HTTPManagerDelegate,
                             route: ICServerConstants.Routes,
                             parameter:String = "",
                             responseModel: BaseAPIObject.Type) {
        guard let url = URL(string:"\(ICServerConstants.BASE_URL)\(route.rawValue)\(parameter)") else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { ( data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data,
                      let responseObject = try? JSONDecoder()
                        .decode(responseModel.self, from: data) else {
                    return
                }
                delegate.didGetResponse(model: responseObject)
            }
            
        })
        task.resume()
    }
    
    //MARK: Requests Methos
    func getCategoriesRequest(delegate: HTTPManagerDelegate) {
        makeRequest(delegate: delegate,
                    route: .categoriesList,
                    responseModel: CategoryModelResponse.self)
    }
    
    func getMeals(by category:String, delegate: HTTPManagerDelegate){
        makeRequest(delegate: delegate, route: .fiterByCategory,parameter: category,
                    responseModel: MealListModelResponse.self)
    }
    
    func getMeal(byId id: String, delegate: HTTPManagerDelegate) {
        makeRequest(delegate: delegate,
                    route: .getMealById,
                    parameter: id,
                    responseModel: MealDetailsModelResponse.self)
    }
        
}

class BaseAPIObject: Codable {
    
}
