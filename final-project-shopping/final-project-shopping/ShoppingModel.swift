//
//  ShoppingModel.swift
//  final-project-shopping
//
//  Created by SEVVAL on 6.11.2022.
//

import Foundation

struct ShoppingModel: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
}
