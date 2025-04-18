//
//  Category.swift
//  buddy
//
//  Created by 이서현 on 4/21/25.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case tech, design, domain
    var id: Self { self }
}
