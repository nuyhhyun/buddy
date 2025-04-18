//
//  PostPreview.swift
//  buddy
//
//  Created by 이서현 on 4/19/25.
//

import SwiftUI

struct CommentPreview: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(comment.timestamp.writtenTime)
                Spacer()
                Label("\(comment.heartCount)", systemImage: "heart")
            }
            .font(.system(size:12))
            .foregroundColor(Color.gray)
            .padding(.bottom)
            
            Text(comment.content)
                .font(.callout)
                .lineLimit(2)
                .truncationMode(.tail)
            
        }
        .padding(16)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.accentColor, lineWidth: 1)
        }
    }
}

#Preview {
    let user = User(id: "dummy-user", name: "익명")
    let comment = Comment(
        id: UUID(),
        user: user,
        content: "이거 진짜 저도 궁금했어요! 누가 좀 알려주세요 ㅠㅠ",
        timestamp: Date(),
        heartCount: 5
    )
    
    CommentPreview(comment: comment)
}
