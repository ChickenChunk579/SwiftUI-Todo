//
//  AddView.swift
//  Todo
//
//  Created by Rhys Tumelty on 23/12/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color("TextField"))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if isTextAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    func isTextAppropriate() -> Bool {
        if textFieldText.count != 0 {
            return true
        }
        showAlert.toggle()
        return false
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("Invalid"), message: Text("You need to enter something"))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
