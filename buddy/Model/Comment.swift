//
//  Comment.swift
//  buddy
//
//  Created by 이서현 on 4/22/25.
//

import SwiftUI

struct Comment: Identifiable, Hashable {
    let id: UUID
    let user: User
    let content: String
    let timestamp: Date
    let heartCount: Int
    let reply: [Comment]
    
    init(
        id: UUID = UUID(),
        user: User,
        content: String,
        timestamp: Date,
        heartCount: Int = 0,
        reply: [Comment] = []
    ) {
        self.id = id
        self.user = user
        self.content = content
        self.timestamp = timestamp
        self.heartCount = heartCount
        self.reply = reply
    }
}
