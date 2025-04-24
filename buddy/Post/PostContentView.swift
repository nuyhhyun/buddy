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
            Text(post.category)
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background((Color.accent.opacity(0.8)))
                .cornerRadius(4)
                .foregroundColor(.white)
                .font(.callout)
                .bold()
            
            Text(post.title)
                .font(.title)
                .bold()
                .padding(.vertical)
            
            Text(post.content)
                .padding(.bottom)
            
            Divider()
            
            HStack {
                Text(post.timestamp.writtenTime)
                Spacer()
                Label("\(post.heartCount)", systemImage: "heart")
                Label("\(post.bookmarkCount)", systemImage: "bookmark")
            }
            .foregroundColor(.gray)
            .font(.subheadline)
        }
        .padding(20)
        //.background(Color.gray.opacity(0.1))
        .cornerRadius(12)
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
