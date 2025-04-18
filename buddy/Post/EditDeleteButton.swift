//
//  EditDeleteButton.swift
//  buddy
//
//  Created by 이서현 on 4/22/25.
//

import SwiftUI

public struct EditDeleteButton: View {
    @Binding var post: Post
    @Binding var path: NavigationPath
    
    @EnvironmentObject var dummyData: DummyData
    @Environment(\.dismiss) var dismiss
    
    public var body: some View {
        HStack {
            Spacer()
            
            if let index = dummyData.posts.firstIndex(where: { $0.id == post.id }) {
                Button {
                    let actualPost = dummyData.posts[index]
                    path.append(Route.editPost(actualPost))
                } label: {
                    Image(systemName: "pencil")
                        .foregroundColor(.accentColor)
                }
                
                Button {
                    dummyData.posts.remove(at: index)
                    path.removeLast()
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

#Preview {
    PreviewableEditDeleteButton()
}

struct PreviewableEditDeleteButton: View {
    @State private var path = NavigationPath()
    @State private var previewPost: Post

    init() {
        let user = User(id: "test-user", name: "미리보기유저")
        let post = Post(
            user: user,
            category: "tech",
            title: "test",
            content: "testing",
            timestamp: Date(),
            commentCount: 0,
            heartCount: 0,
            bookmarkCount: 0
        )
        _previewPost = State(initialValue: post)
        DummyData.shared.posts = [post]
    }

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                EditDeleteButton(post: $previewPost, path: $path)
            }
            .environmentObject(DummyData.shared)
        }
    }
}
