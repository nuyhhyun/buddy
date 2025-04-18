//
//  CommentField.swift
//  buddy
//
//  Created by 이서현 on 4/23/25.
//

import SwiftUI

public struct CommentTextField: View {
    @Binding var post: Post
    @State private var newCommentText: String = ""
    
    let defaultUser: User
    
    public var body: some View {
        HStack {
            TextField("답변을 입력해 주세요 :)", text: $newCommentText)
            
            Button {
                let newComment = Comment(
                    id: UUID(),
                    user: defaultUser,
                    content: newCommentText,
                    timestamp: Date(),
                    heartCount: 0
                )
                post.comments.append(newComment)
                post.commentCount += 1
                newCommentText = ""
            } label: {
                if newCommentText.isEmpty {
                    Image(systemName: "paperplane")
                        .foregroundColor(.gray.opacity(0.8))
                } else {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.accent)
                }
            }
            .disabled(newCommentText.isEmpty)
        }
        .padding(16)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
    }
}
