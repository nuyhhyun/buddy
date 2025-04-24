//
//  buddyApp.swift
//  buddy
//
//  Created by 이서현 on 4/18/25.
//

import SwiftUI // SwiftUI 프레임워크를 코드에서 사용할 수 있게 함

@main // 앱이 시작하는 지점을 지정
struct buddyApp: App { // App 프로토콜을 따르는 'buddyApp' 구조체 선언
    @StateObject private var dummyData = DummyData.shared
    private let defaultUser = User(id: "dummy-user", name: "익명")

    var body: some Scene {
        WindowGroup {
            ListView(defaultUser: defaultUser)
                .environmentObject(dummyData)
        }
    }
}
