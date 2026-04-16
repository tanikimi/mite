//
//  TodoItem.swift
//  Mite
//
//  Created by 谷川 木穣 on 2026/04/16.
//

import Foundation

struct TodoItem: Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    
    init(title: String){
        self.id = UUID()
        self.title = title
        self.isCompleted = false
    }
}
