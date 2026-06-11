//
//  ListView.swift
//  TodoApp
//
//  Created by Ankit Ammanagi on 11/06/26.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    
    var body: some View {
        ZStack {
            
            if listViewModel.todoItems.isEmpty {
                NoTodosView()
                    .transition(
                        .asymmetric(
                            insertion: .scale.animation(.spring()), removal: .opacity.animation(.easeInOut)))
                
            } else {
                List {
                    ForEach(listViewModel.todoItems) { todo in
                        ListRowView(item: todo)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.udpateTodoStatus(item: todo)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteTodo)
                    .onMove(perform: listViewModel.moveTodo)
                }
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
    .environment(ListViewModel())
}
