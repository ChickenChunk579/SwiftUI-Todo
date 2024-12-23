//
//  ListViewModel.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
            let newItems = [
                ItemModel(title: "Welcome to To-Do", completed: false),
                ItemModel(title: "To add an item, click on 'Add' at the top", completed: false),
                ItemModel(title: "Click on an item to toggle its completion", completed: false),
                ItemModel(title: "To remove an item, click on edit and click on the - to delete it", completed: false),
                ItemModel(title: "Use the 3 bars on the right of each item in edit mode to move the item", completed: false)
            ]
            items.append(contentsOf: newItems)
            saveItems()
            return;
        }
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return;
        }
        print(data.base64EncodedString())
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
        
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, completed: false)
        
        items.append(newItem)
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        } else {
            print("No Item found!")
        }
    }

 }
