//
//  itemModel.swift
//  TodoApp
//
//  Created by Ankit Ammanagi on 11/06/26.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
