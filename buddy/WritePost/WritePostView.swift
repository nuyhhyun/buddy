//
//  WritePostView.swift
//  buddy
//
//  Created by 이서현 on 4/19/25.
//

import SwiftUI

struct WritePostView: View {
    @EnvironmentObject var dummyData: DummyData
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedCategory: Category
    @State private var postTitle: String
    @State private var postContent: String
    
    let post: Post?
    var isNew: Bool { post == nil }
    var newOrEdit: String {
        isNew ? "새 질문 작성" : "질문 수정"
    }
    
    init(post: Post? = nil) {
        self.post = post
        
        let category = Category(rawValue: post?.category ?? "") ?? .tech
        let title = post?.title ?? ""
        let content = post?.content ?? ""
        
        _selectedCategory = State(initialValue: category)
        _postTitle = State(initialValue: title)
        _postContent = State(initialValue: content)
    }
    
    var body: some View {
        ScrollView {
            Text(newOrEdit)
                .font(.title)
                .bold()
                .foregroundColor(.accentColor1)
            Divider()
                .padding([.leading, .trailing])
            
            VStack(alignment: .leading, spacing: 20) {
                WritePostSectionView(title: "게시판", hasBorder: false) {
                    PullDownButton(selectedCategory: $selectedCategory)
                }
                
                WritePostSectionView(title: "제목", hasBorder: true) {
                    TextField("", text: $postTitle)
                        .frame(height: 32)
                }
                
                WritePostSectionView(title: "내용", hasBorder: true) {
                    TextEditor(text: $postContent)
                        .frame(height: 300)
                }
            }
            
            HStack {
                Spacer()
                Button(isNew ? "올리기" : "수정하기") {
                    let writtenPost = Post(
                        id: post?.id ?? UUID(),
                        user: dummyData.posts.first!.user,
                        category: selectedCategory.rawValue,
                        title: postTitle,
                        content: postContent,
                        timestamp: Date(),
                        commentCount: post?.commentCount ?? 0,
                        heartCount: post?.heartCount ?? 0,
                        bookmarkCount: post?.bookmarkCount ?? 0
                    )
                    
                    if isNew {
                        dummyData.posts.insert(writtenPost, at: 0)
                    } else if let index = dummyData.posts.firstIndex(where: { $0.id == writtenPost.id }) {
                        dummyData.posts[index] = writtenPost
                    }
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .disabled(postTitle.isEmpty || postContent.isEmpty)
            }
            .padding([.horizontal], 32)
        }
    }
}

#Preview {
    WritePostView()
        .environmentObject(DummyData.shared)
}
