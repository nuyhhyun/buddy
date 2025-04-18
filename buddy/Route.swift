//
//  Route.swift
//  buddy
//
//  Created by 이서현 on 4/22/25.
//
import SwiftUI

enum Route: Hashable {
    case newPost
    case editPost(Post)
    case viewPost(Post)
}
