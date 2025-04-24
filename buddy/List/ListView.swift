//
// ListView.swift
//  buddy
//
//  Created by 이서현 on 4/19/25.
//

import SwiftUI

struct ListView: View {
    @State private var selectedCategory: Category = .tech
    @State private var path = NavigationPath()
    
    @State var defaultUser: User
    
    @EnvironmentObject var dummyData: DummyData
    var filteredPosts: [Post] {
        dummyData.posts.filter { $0.category == selectedCategory.rawValue }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                ScrollView { // navigation title 자동 축소 불가
                    VStack(spacing: 12) {
                        ForEach(filteredPosts) { post in
                            NavigationLink(value: Route.viewPost(post)) {
                                PostPreview(post: post)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(4)
                }
            }
            .padding()
            .navigationTitle("Q&A")
            .toolbar {
                    Button {
                        if !path.isEmpty {
                            path.removeLast()
                        }
                        path.append(Route.newPost)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.accent)
                    }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .newPost:
                    WritePostView(post: nil, path: $path, defaultUser: defaultUser)
                        .environmentObject(dummyData)
                case .editPost(let post):
                    WritePostView(post: post, path: $path, defaultUser: defaultUser)
                        .environmentObject(dummyData)
                case .viewPost(let post):
                    if let index = dummyData.posts.firstIndex(where: { $0.id == post.id }) {
                        PostView(post: $dummyData.posts[index], path: $path, defaultUser: defaultUser)
                    }
                case .listView(_):
                    ListView(defaultUser: defaultUser)
                        .environmentObject(dummyData)
                }
            }
        }
    }
}

#Preview {
    ListView(defaultUser: User(id: "dummy-user", name: "익명"))
        .environmentObject(DummyData.shared)
}
