//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Ankit Ammanagi on 11/06/26.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(ListViewModel.self) var listViewModel
    @State private var todoText: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTextMsg: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Enter your todo item here...",text: $todoText)
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    saveTodo(title: todoText)
                } label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

            }
            .padding()
        }
        .navigationTitle("Add todo 📝")
        .alert(alertTextMsg, isPresented: $showAlert) {
            alertView()
        }
    }
    
    func saveTodo(title: String) {
        if textIsValid() {
            listViewModel.addTodo(title: title)
            dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if todoText.count > 2 {
            return true
        }
        
        showAlert.toggle()
        alertTextMsg = "Todo item should contain atleast 3 characters 😟"
        return false
    }
    
    func alertView() -> some View {
        Button("OK") {
            showAlert.toggle()
        }
    }
}

#Preview {
    NavigationStack {
        AddTodoView()
    }
    .environment(ListViewModel())
}
