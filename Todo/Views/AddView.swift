//
//  AddView.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import SwiftUI

struct AddView: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color("TextField"))
                    .cornerRadius(10)
                Button(action: {}, label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .font(.headline)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
