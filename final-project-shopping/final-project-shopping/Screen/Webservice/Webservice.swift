//
//  Webservice.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import Foundation

class Webservice {
    func downloadShopping(url: URL, completion: @escaping ([ShoppingModel]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let shoppingList = try? JSONDecoder().decode([ShoppingModel].self, from: data)
                print(shoppingList)
                if let shoppingList = shoppingList {
                    completion(shoppingList)
                }
            }
        }.resume()
    }
}
