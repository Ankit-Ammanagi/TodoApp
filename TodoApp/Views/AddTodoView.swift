//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Ankit Ammanagi on 11/06/26.
//

import SwiftUI

struct AddTodoView: View {
    @State private var todoText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TextField("Enter your todo item here...",text: $todoText)
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button {
                    // Add your action here
                } label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

            }
            .navigationTitle("Add todo 📝")
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        AddTodoView()
    }
}
