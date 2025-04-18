//
//  TechListPreview.swift
//  buddy
//
//  Created by 이서현 on 4/20/25.
//

import SwiftUI

struct ListPreview: View {
    let posts: [Post]

    var body: some View {
        VStack(spacing: 12) {
            ForEach(posts) { post in
                PostPreview(post: post)
            }
        }
    }
}

#Preview {
    ListPreview(posts: DummyData.shared.posts.filter { $0.category == "tech" })
}
