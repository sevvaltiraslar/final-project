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
    
    var title: String {
        return self.shopping.title
    }
}
