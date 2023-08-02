//
//  MenuViewModel.swift
//  ProjectX
//
//  Created by Damodar Namala on 02/08/23.
//

import Foundation
import Core

class MenuViewModel: ObservableObject {
    private let dependency = DependencyContainer.shared
    @Published var items : [MenuItem] = []
    private lazy var menuUseCases: MenuUseCases = {
        let menuUseCases: MenuUseCases = dependency.resolve()
        return menuUseCases
    }()
    
    // Add properties, observable variables, and other view model logic here.
    init() {
   
    }
    
    func fetchMenuItems(for category: MenuCategory) {
        self.items = self.menuUseCases.fetchMenuItems(for: category)
    }
    
    func addMenuItem(_ item: MenuItem, to category: MenuCategory) {
        self.menuUseCases.addMenuItem(item, to: category)
        self.fetchMenuItems(for: category)
    }
    
    func updateMenuItem(_ item: MenuItem) {
        
    }
    
    func deleteMenuItem(_ id: String) {
        self.menuUseCases.deleteMenuItem(id)
        self.items = self.menuUseCases.fetchAllMenuItems()
    }

    // Add other methods for handling user interactions and business logic.
}

struct Menu {
    static func build() -> AddMenuView {
        let menuViewModel = MenuViewModel()
        return AddMenuView(viewModel: menuViewModel)
    }
}
