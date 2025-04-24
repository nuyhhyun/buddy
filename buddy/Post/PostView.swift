//
//  PostView.swift
//  buddy
//
//  Created by 이서현 on 4/22/25.
//

import SwiftUI

struct PostView: View {
    @Binding var post: Post
    @Binding var path: NavigationPath
    
    @State private var newCommentText: String = ""
    @State private var showMenu = false
    
    @EnvironmentObject var dummyData: DummyData
    
    let defaultUser: User
    
    var body: some View {
        ScrollView {
            PostContentView(post: $post)
                .padding(.horizontal)
            
            Rectangle()
                .fill(Color.gray.opacity(0.1))
            
            if post.comments.isEmpty {
                Text("첫 댓글을 입력해 주세요 :)")
                    .foregroundStyle(.secondary)
                    .padding()
            } else {
                CommentListView(post: $post, defaultUser: defaultUser)
                    .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if post.user == defaultUser {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        if let index = dummyData.posts.firstIndex(where: { $0.id == post.id }) {
                            let actualPost = dummyData.posts[index]
                            path.removeLast()
                            path.append(Route.editPost(actualPost))
                        }
                    } label: {
                        Image(systemName: "pencil")
                    }
                    
                    Button {
                        if let index = dummyData.posts.firstIndex(where: { $0.id == post.id }) {
                            dummyData.posts.remove(at: index)
                            path.removeLast()
                        }
                    } label: {
                        Image(systemName: "trash")
                    }
                }
            }
        }
        
        CommentTextField(post: $post, defaultUser: defaultUser)
            .padding()
    }
}

#Preview {
    PreviewablePostView()
        .environmentObject(DummyData.shared)
}

struct PreviewablePostView: View {
    @State private var path = NavigationPath()
    @State private var previewPost: Post
    private let defaultUser = User(id: "dummy-user", name: "익명")

    init() {
        let post = Post(
            user: defaultUser,
            category: "tech",
            title: "코드에 오류 나요ㅠ",
            content: """
            if n = 1 {
                return true
            }

            왜 이래요 이거..?
            저 똑같이 따라 쳤는데ㅠㅠ
            """,
            timestamp: Date(),
            commentCount: 2,
            heartCount: 5,
            bookmarkCount: 1
        )
        _previewPost = State(initialValue: post)
        DummyData.shared.posts = [post]
    }

    var body: some View {
        NavigationStack(path: $path) {
            PostView(
                post: $previewPost,
                path: $path,
                defaultUser: defaultUser
            )
        }
        .environmentObject(DummyData.shared)
    }
}
