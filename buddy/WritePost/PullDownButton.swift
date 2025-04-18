//
//  PullDownButton.swift
//  buddy
//
//  Created by 이서현 on 4/21/25.
//

import SwiftUI

struct PullDownButton : View {
    @Binding var selectedCategory: Category
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Text(selectedCategory.rawValue)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .padding()
                .background(Color(UIColor.systemGray5))
                .foregroundColor(.black)
                .bold()
                .frame(height: 48)
                .cornerRadius(12, corners: isExpanded ? [.topLeft, .topRight] : .allCorners)
            }
            
            if isExpanded {
                VStack(spacing: 0) {
                    ForEach(Category.allCases.filter { $0 != selectedCategory }, id: \.self) { option in
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(UIColor.systemGray4))
                        Button {
                            selectedCategory = option
                            isExpanded = false
                        } label: {
                            Text(option.rawValue)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .background(Color(UIColor.systemGray5))
                        .foregroundColor(.primary)
                    }
                }
                .background(Color.white)
                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
            }
        }
        .frame(width: 200)
    }
}

#Preview {
    StatefulPreviewWrapper(Category.tech) { binding in
        PullDownButton(selectedCategory: binding)
    }
}

struct StatefulPreviewWrapper<Value: Equatable, Content: View>: View {
    @State private var value: Value
    private var content: (Binding<Value>) -> Content

    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        self._value = State(wrappedValue: initialValue)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
