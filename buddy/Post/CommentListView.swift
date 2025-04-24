//
//  CommentListView.swift
//  buddy
//
//  Created by 이서현 on 4/23/25.
//

import SwiftUI

struct CommentListView: View {
    @Binding var post: Post
    @State private var showMenu = false
    @State private var selectedCommentID: UUID?

    let defaultUser: User

    var body: some View {
        VStack {
            ForEach(post.comments) { comment in
                ZStack(alignment: .topTrailing) {
                    CommentPreview(comment: comment)
                        .onLongPressGesture {
                            selectedCommentID = comment.id
                            showMenu = true
                        }

                    if showMenu && selectedCommentID == comment.id {
                        PopUpButton()
                            .onTapGesture {
                                showMenu = false
                            }
                    }
                }
                .padding(.horizontal)
                Divider()
                    .padding(.horizontal, 16)
            }
        }
        .animation(.easeInOut, value: showMenu)
    }
}

#Preview {
    PreviewableCommentListView()
}

struct PreviewableCommentListView: View {
    @State private var post: Post

    init() {
        let user = User(id: "dummy-user", name: "익명")
        let comments = [
            Comment(id: UUID(), user: user, content: "이거 어떻게 하죠?", timestamp: Date(), heartCount: 2),
            Comment(id: UUID(), user: user, content: "저도 궁금해요!", timestamp: Date().addingTimeInterval(-60), heartCount: 1)
        ]
        let samplePost = Post(
            user: user,
            category: "tech",
            title: "코드에 오류 나요ㅠ",
            content: "if n = 1 {\nreturn true\n}",
            timestamp: Date(),
            commentCount: comments.count,
            heartCount: 0,
            bookmarkCount: 0,
            comments: comments
        )
        _post = State(initialValue: samplePost)
    }

    var body: some View {
        CommentListView(post: $post, defaultUser: User(id: "dummy-user", name: "익명"))
    }
}
