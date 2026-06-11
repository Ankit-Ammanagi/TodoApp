//
//  ListRowView.swift
//  TodoApp
//
//  Created by Ankit Ammanagi on 11/06/26.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
                
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}

#Preview("Incomplete Item") {
    let item = ItemModel(title: "Test Task", isCompleted: false)
    ListRowView(item: item)
}

#Preview("Completed Item") {
    let item = ItemModel(title: "Test Task", isCompleted: true)
    ListRowView(item: item)
}
