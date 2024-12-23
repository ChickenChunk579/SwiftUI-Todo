//
//  ItemModel.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    var completed: Bool
}
