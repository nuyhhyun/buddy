//
//  NewPostSectionVeiw.swift
//  buddy
//
//  Created by 이서현 on 4/22/25.
//

import SwiftUI

struct WritePostSectionView<Content: View>: View {
    let title: String
    let hasBorder: Bool
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3)
                .fontWeight(.heavy)

            Group {
                if hasBorder {
                    content()
                        .padding(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                } else {
                    content()
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(8)
    }
}

#Preview {
    WritePostSectionView(title: "제목", hasBorder: true) {
        return TextField("", text: .constant(""))
    }
}
