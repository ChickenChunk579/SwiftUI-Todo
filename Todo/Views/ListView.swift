//
//  ListView.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import SwiftUI

struct ListView: View {
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first item", completed: true),
        ItemModel(title: "This is the second item", completed: true),
        ItemModel(title: "This is the third item", completed: true),
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .navigationTitle("Todo")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}

