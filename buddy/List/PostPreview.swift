//
//  PostPreview.swift
//  buddy
//
//  Created by 이서현 on 4/19/25.
//

import SwiftUI

struct PostPreview: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(post.title)
                .font(.system(size: 20, weight: .heavy))
            
            Text(post.content)
                .font(.system(size: 14, weight: .light))
                .lineLimit(2)
                .truncationMode(.tail)
            
            HStack(spacing:4) {
                Label("\(post.commentCount)", systemImage: "message")
                Label("\(post.heartCount)", systemImage: "heart")
                Label("\(post.bookmarkCount)", systemImage: "bookmark")
                Spacer()
                
                Text(post.timestamp.writtenTime)
            }
            .font(.system(size:12))
            .foregroundColor(Color.gray)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.accentColor, lineWidth: 1)
        }
    }
}

#Preview {
    let user = User(id: "dummy-user", name: "익명")
    return PostPreview(post: Post(user: user, category: "tech", title: "title", content: "content", timestamp: Date().addingTimeInterval(-590)))
}
