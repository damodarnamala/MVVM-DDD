//
//  MenuUseCases.swift
//  AppCore
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation

// MenuUseCases.swift
public protocol MenuUseCases {
    func fetchMenuItems(for category: MenuCategory) -> [MenuItem]
    func addMenuItem(_ item: MenuItem, to category: MenuCategory)
    func updateMenuItem(_ item: MenuItem)
    func deleteMenuItem(_ id: String)
    func fetchAllMenuItems() -> [MenuItem]

}

public class MenuInteractor: MenuUseCases {
    private let menuRepository: MenuRepository
    
    public init(menuRepository: MenuRepository) {
        self.menuRepository = menuRepository
    }
    
    public func fetchMenuItems(for category: MenuCategory) -> [MenuItem] {
        return menuRepository.fetchMenuItems(for: category)
    }
    
    public func addMenuItem(_ item: MenuItem, to category: MenuCategory) {
        menuRepository.addMenuItem(item, to: category)
    }
    
    public func updateMenuItem(_ item: MenuItem) {
        menuRepository.updateMenuItem(item)
    }
    public func deleteMenuItem(_ id: String) {
        self.menuRepository.deleteMenuItem(id)
    }
    
    public func fetchAllMenuItems() -> [MenuItem] {
        self.menuRepository.fetchAllMenuItems()
    }


}

class MenuDataRepository: MenuRepository {
    private var menuItems: [MenuItem] = []
    
    func fetchMenuItems(for category: MenuCategory) -> [MenuItem] {
        return menuItems.filter { $0.category == category }
    }
    
    func addMenuItem(_ item: MenuItem, to category: MenuCategory) {
        menuItems.append(item)
    }
    
    func updateMenuItem(_ item: MenuItem) {
        if let index = menuItems.firstIndex(where: { $0.id == item.id }) {
            menuItems[index] = item
        }
    }
    
    public func deleteMenuItem(_ id: String){
        self.menuItems = self.menuItems.filter({$0.id != id})
    }
    
    public func fetchAllMenuItems() -> [MenuItem] {
        self.menuItems
    }
}
