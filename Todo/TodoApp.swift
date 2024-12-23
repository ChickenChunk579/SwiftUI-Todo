//
//  TodoApp.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import SwiftUI

@main
struct TodoApp: App {
    @State var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
