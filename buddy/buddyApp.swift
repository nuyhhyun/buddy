//
//  buddyApp.swift
//  buddy
//
//  Created by 이서현 on 4/18/25.
//

import SwiftUI

@main
struct buddyApp: App {
    @StateObject private var dummyData = DummyData.shared
    private let defaultUser = User(id: "dummy-user", name: "익명")

    var body: some Scene {
        WindowGroup {
            ListView(defaultUser: defaultUser)
                .environmentObject(dummyData)
        }
    }
}
