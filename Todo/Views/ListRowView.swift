//
//  ListRowView.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State var item: ItemModel
    
    var body: some View {
        HStack {
            Button(action: {
                listViewModel.updateItem(item: item)
                if let index = listViewModel.items.firstIndex(where: { $0.id == item.id }) {
                    let arrayItem = listViewModel.items[index]
                    item = ItemModel(id: arrayItem.id, title: arrayItem.title, completed: arrayItem.completed)
                }
            }, label: {
                Image(systemName: item.completed ? "checkmark.circle" : "circle")
                    .foregroundColor(item.completed ? .green : .red)
            })
            
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


#Preview {
    struct PreviewWrapper: View {
        var item1 = ItemModel(title: "First Item", completed: false)
        var item2 = ItemModel(title: "Second Item", completed: true)
        @State var updater: Bool = false
        
        var body: some View {
            VStack {
                ListRowView(item: item1)
                ListRowView(item: item2)
            }
        }
    }
    return PreviewWrapper()
}
