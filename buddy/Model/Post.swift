//
//  Post.swift
//  buddy
//
//  Created by 이서현 on 4/19/25.
//

import SwiftUI

struct Post: Identifiable, Hashable {
    let id: UUID
    let user: User
    let category: String
    let title: String
    let content: String
    let timestamp: Date
    var commentCount: Int
    var heartCount: Int
    var bookmarkCount: Int
    var comments: [Comment] = []

    init(
        id: UUID = UUID(),
        user: User,
        category: String,
        title: String,
        content: String,
        timestamp: Date,
        commentCount: Int = 0,
        heartCount: Int = 0,
        bookmarkCount: Int = 0,
        comments: [Comment] = []
    ) {
        self.id = id
        self.user = user
        self.category = category
        self.title = title
        self.content = content
        self.timestamp = timestamp
        self.commentCount = commentCount
        self.heartCount = heartCount
        self.bookmarkCount = bookmarkCount
        self.comments = comments
    }
}
