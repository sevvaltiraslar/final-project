//
//  ShoppingViewModel.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import Foundation

struct ShoppingListViewModel {
    let shoppingList: [ShoppingModel]
    
    func numberOfRowsInSection() -> Int {
        return self.shoppingList.count
    }
    
    func shoppingAtIndex(_ index: Int) -> ShoppingViewModel {
        let shopping = self.shoppingList[index]
        return ShoppingViewModel(shopping: shopping)
    }
}

struct ShoppingViewModel {
    let shopping: ShoppingModel
    
    var id: Int {
        return self.shopping.id
    }
    
    var title: String {
        return self.shopping.title
    }
    
    var price: Double {
        return self.shopping.price
    }
    
    var description: String {
        return self.shopping.description
    }
    
    var category: String {
        return self.shopping.category
    }
}
