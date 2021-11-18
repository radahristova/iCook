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
                             responseModel: BaseAPIObject.Type) {
        guard let url = URL(string:"\(ICServerConstants.BASE_URL)\(route.rawValue)") else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { ( data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                let responseObject = try! JSONDecoder().decode(responseModel.self, from: data)
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
        
}

class BaseAPIObject: Codable {
    
}
