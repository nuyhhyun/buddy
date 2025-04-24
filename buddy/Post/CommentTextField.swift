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
                post.comments.insert(newComment, at: 0)
                post.commentCount += 1
                newCommentText = ""
            } label: {
                if newCommentText.isEmpty {
                    Image(systemName: "arrowshape.up.circle")
                        .font(.title2)
                        .foregroundColor(.gray.opacity(0.8))
                } else {
                    Image(systemName: "arrowshape.up.circle.fill")
                        .font(.title2)
                        .foregroundColor(.accent)
                }
            }
            .disabled(newCommentText.isEmpty)
        }
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
        )
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var previewPost: Post = Post(
            user: User(id: "preview-user", name: "미리보기"),
            category: "tech",
            title: "프리뷰 테스트",
            content: "이건 프리뷰용 게시글입니다.",
            timestamp: Date(),
            commentCount: 0,
            heartCount: 0
        )

        var body: some View {
            CommentTextField(post: $previewPost, defaultUser: User(id: "preview-user", name: "미리보기"))
        }
    }

    return PreviewWrapper()
}
