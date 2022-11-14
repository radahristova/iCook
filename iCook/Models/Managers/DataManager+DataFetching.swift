//
//  DataManager+DataFetching.swift
//  iCook
//
//  Created by Rada Hristova on 13.11.22.
//

import Alamofire

extension DataManager: DataFetching {

    func get(completion: @escaping ([Category]) -> Void) {
        let request = AF.request(api.BASE_URL.appendingPathComponent(api.routeCategories))
        request.responseData { dataResponse in
            guard let data = dataResponse.data else { return }
            do {
                guard let json = try JSONSerialization
                    .jsonObject(with: data) as? [AnyHashable: Any],
                      let array = json["categories"] as? [[AnyHashable: Any]] else {
                    return
                }
                completion(array.compactMap { Category(from: $0) })
            } catch let error {
                print(error)
            }
        }
    }

    func get(in category: String, completion: @escaping ([Meal]) -> Void) {
        var url = api.BASE_URL.appendingPathComponent(api.routeCategoryMeals)
        url.append(contentsOf: [URLQueryItem(name: "c", value: category)])
        let request = AF.request(url)
        request.responseData { dataResponse in
            guard let data = dataResponse.data else { return }
            do {
                guard let json = try JSONSerialization
                    .jsonObject(with: data) as? [AnyHashable: Any],
                      let array = json["meals"] as? [[AnyHashable: Any]] else {
                    return
                }
                completion(array.compactMap { Meal(from: $0) })
            } catch let error {
                print(error)
            }
        }
    }

    func get(of meal: String, completion: @escaping (MealDetails) -> Void) {
        var url = api.BASE_URL.appendingPathComponent(api.routeMealDetails)
        url.append(contentsOf: [URLQueryItem(name: "i", value: meal)])
        let request = AF.request(url)
        request.responseData { dataResponse in
            guard let data = dataResponse.data else { return }
            do {
                guard let json = try JSONSerialization
                    .jsonObject(with: data) as? [AnyHashable: Any],
                      let nested = (json["meals"] as? [[AnyHashable: Any]])?.first,
                      let details = MealDetails(from: nested) else {
                    return
                }
                completion(details)
            } catch let error {
                print(error)
            }
        }
    }

}
