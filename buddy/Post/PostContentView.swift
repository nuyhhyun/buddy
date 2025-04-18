//
//  PostContentView.swift
//  buddy
//
//  Created by 이서현 on 4/22/25.
//

import SwiftUI

struct PostContentView: View {
    @Binding var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack() {
                Text("🌱 " + post.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.accentColor1)
                
                Text(post.content)
                    .padding()
            }
            
            HStack {
                Text(post.timestamp.writtenTime)
                Spacer()
                Label("\(post.heartCount)", systemImage: "heart")
                Label("\(post.bookmarkCount)", systemImage: "bookmark")
            }
            .foregroundColor(.gray)
            .font(.subheadline)
        }
    }
}

#Preview {
    PreviewablePostContentView()
}

struct PreviewablePostContentView: View {
    @State private var previewPost: Post
    let user = User(id: "dummy-user", name: "익명")

    init() {
        let post = Post(
            user: user,
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
    }

    var body: some View {
        PostContentView(post: $previewPost)
            .padding()
            .environmentObject(DummyData.shared)
    }
}
