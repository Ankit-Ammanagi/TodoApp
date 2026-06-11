//
//  ListView.swift
//  TodoApp
//
//  Created by Ankit Ammanagi on 11/06/26.
//

import SwiftUI

struct ListView: View {
    @State private var todoItems: [ItemModel] = [
        ItemModel(title: "Todo 1", isCompleted: false),
       ItemModel(title: "Todo 2", isCompleted: true),
       ItemModel(title: "Todo 3", isCompleted: false),
       ItemModel(title: "Todo 4", isCompleted: true)
    ]
    
    var body: some View {
        List {
            ForEach(todoItems) { todo in
                ListRowView(item: todo)
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem( placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddTodoView()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
