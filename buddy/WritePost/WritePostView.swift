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
    
    @Binding var path: NavigationPath
    
    let defaultUser: User
    let post: Post?
    var isNew: Bool { post == nil }
    var newOrEdit: String {
        isNew ? "새 질문 작성" : "질문 수정"
    }
    
    init(post: Post? = nil, path: Binding<NavigationPath>, defaultUser: User) {
        self.post = post
        self._path = path
        self.defaultUser = defaultUser
        
        let category = Category(rawValue: post?.category ?? "") ?? .tech
        let title = post?.title ?? ""
        let content = post?.content ?? ""

        _selectedCategory = State(initialValue: category)
        _postTitle = State(initialValue: title)
        _postContent = State(initialValue: content)
    }
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
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
            .padding(.bottom)
            
            Button(isNew ? "올리기" : "수정하기") {
                let writtenPost = Post(
                    id: post?.id ?? UUID(),
                    user: defaultUser,
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
                
                if !path.isEmpty {
                    path.removeLast()
                }
                path.append(Route.viewPost(writtenPost))
            }
            .navigationTitle(newOrEdit)
            .frame(width: 300)
            .padding(8)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .bold))
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .disabled(postTitle.isEmpty || postContent.isEmpty)
        }
    }
}

#Preview {
    PreviewableWritePostView()
        .environmentObject(DummyData.shared)
}

struct PreviewableWritePostView: View {
    @State private var path = NavigationPath()
    private let user = User(id: "dummy-user", name: "익명")

    var body: some View {
        WritePostView(path: $path, defaultUser: user)
            .environmentObject(DummyData.shared)
    }
}
