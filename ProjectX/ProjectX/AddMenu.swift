//
//  AdMenuView.swift
//  ProjectX
//
//  Created by Damodar Namala on 02/08/23.
//

import SwiftUI
import Core

struct AddMenuView: View {
    @State var id: UUID = UUID()
    @State var name: String = ""
    @State var category: MenuCategory = .pasta
    @State var price: Double = 0
    @ObservedObject var viewModel: MenuViewModel
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                    .padding(.leading,8)
                    .textFieldStyle(.plain)
                    .frame(height: 52)
                    .background(Color(.lightGray).opacity(0.25))
                
                HStack {
                    TextField("Select an item", text: .constant(category.rawValue))
                        .padding(.leading,8)
                        .textFieldStyle(.plain)
                        .frame(height: 52)
                        .background(Color(.lightGray).opacity(0.25))
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    
                    Picker("Select an item", selection: $category) {
                        ForEach(MenuCategory.allCases, id: \.self) { item in
                            Text(category.rawValue).tag(item)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(height: 52)
                    .background(Color(.lightGray).opacity(0.28))
                    
                }
                TextField("Price", value: $price, format: .number)
                    .textFieldStyle(.plain)
                    .padding(.leading,8)
                    .frame(height: 52)
                    .background(Color(.lightGray).opacity(0.25))
                
                Button("Save") {
                    self.viewModel.addMenuItem(.init(id: self.id.uuidString, name: self.name, category: self.category, price: self.price), to: self.category)
                }
                Divider()
                List {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item.name.capitalized)
                    }
                    .onDelete(perform: deleteItem(at:))
                }
            }
            .padding(.all, 16)
        }
    }
    func deleteItem(at offsets: IndexSet) {
        if let indexToDelete = offsets.first {
            let item = self.viewModel.items[indexToDelete]
            self.viewModel.deleteMenuItem(item.id)
            print("Index to delete: \(indexToDelete)")
        }
    }
}

struct AddMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AddMenuView(viewModel: .init())
    }
}


