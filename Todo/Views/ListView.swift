//
//  ListView.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .navigationTitle("To-do")
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
    .environmentObject(ListViewModel())
}

