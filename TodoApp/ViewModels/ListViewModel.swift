//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Ankit Ammanagi on 11/06/26.
//

import Foundation
import SwiftUI

@Observable class ListViewModel {
    
    var todoItems: [ItemModel] = []
    private let userDefaultsKey = "items_list"
    
    init(){
        addItems()
    }
    
    func addItems() {
        guard
            let date = UserDefaults.standard.data(forKey: userDefaultsKey),
            let decodedItems = try? JSONDecoder().decode([ItemModel].self, from: date)
        else { return }
        
        todoItems.append(contentsOf: decodedItems)
    }
    
    
    func deleteTodo(index: IndexSet){
        todoItems.remove(atOffsets: index)
    }
    
    func moveTodo(from: IndexSet, to: Int) {
        todoItems.move(fromOffsets: from, toOffset: to)
    }
    
    func addTodo(title: String) {
        let todoItem = ItemModel(title: title, isCompleted: false)
        todoItems.append(todoItem)
    }
    
    func udpateTodoStatus(item: ItemModel)  {
        if let index = todoItems.firstIndex(where: { $0.id == item.id}) {
            todoItems[index] = item.updateStatus()
        }
    }
    
    func saveToUserDefaults() {
        if let encodedData = try? JSONEncoder().encode(todoItems) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
        }
    }
}
