//
//  MenuItem.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation
public struct MenuItem: Hashable {
    public let id: String
    public let name: String
    public let category: MenuCategory
    public let price: Double
    public init(id: String, name: String, category: MenuCategory, price: Double) {
        self.id = id
        self.name = name
        self.category = category
        self.price = price
    }
}
