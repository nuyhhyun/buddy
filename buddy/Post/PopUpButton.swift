//
//  PopUpMenu.swift
//  buddy
//
//  Created by 이서현 on 4/23/25.
//

import SwiftUI

public struct PopUpButton: View {
    @State private var selectedCommentID: UUID?

    public var body: some View {
        VStack(spacing: 8) {
            Button {
            } label: {
                Label("대댓글 달기", systemImage: "message")
            }
            
            Button {
            } label: {
                Label("수정하기", systemImage: "pencil")
            }
            
            Button {
                
            } label: {
                Label("삭제하기", systemImage: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(12)
        .shadow(radius: 1)
        .transition(.opacity)
    }
}

#Preview {
    PopUpButton()
}
