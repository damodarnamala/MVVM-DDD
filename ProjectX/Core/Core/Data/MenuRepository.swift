//
//  MenuRepository.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation
// MenuRepository.swift
public protocol MenuRepository {
    func fetchMenuItems(for category: MenuCategory) -> [MenuItem]
    func addMenuItem(_ item: MenuItem, to category: MenuCategory)
    func updateMenuItem(_ item: MenuItem)
    func deleteMenuItem(_ id: String)
    func fetchAllMenuItems() -> [MenuItem]
}
