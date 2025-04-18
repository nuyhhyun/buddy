//
//  User.swift
//  buddy
//
//  Created by 이서현 on 4/22/25.
//

import SwiftUI

public struct User: Identifiable, Hashable {
    public var id: String
    public var name: String = "익명"

    public init(id: String, name: String = "익명") {
        self.id = id
        self.name = name
    }
}
