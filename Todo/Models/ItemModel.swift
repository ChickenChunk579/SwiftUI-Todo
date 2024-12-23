//
//  ItemModel.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    var completed: Bool
    
    init(id: String = UUID().uuidString, title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, completed: !completed)
    }
}
