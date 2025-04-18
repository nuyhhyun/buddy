//
//  Tech.swift
//  buddy
//
//  Created by 이서현 on 4/19/25.
//

import SwiftUI

class DummyData: ObservableObject {
    static let shared = DummyData()
    
    @Published var posts: [Post] = []
    
    @Published var defaultUser = User(id: "dummy-user", name: "익명")
    private let anotherUser = User(id: "dummy-user2", name: "익명2")
    
    private init() {
        posts = [
            Post(user: defaultUser, category: "tech", title: "코드에 오류 나요ㅠ", content: "if n = 1 {\nreturn true\n}", timestamp: Date(), commentCount: 2, heartCount: 3),
            Post(user: anotherUser, category: "tech", title: "클로저 설명해주실 분", content: "이게 뭐임요..?;;\n개념 이해가 안돼요ㅠㅠㅠ", timestamp: Date().addingTimeInterval(-120), commentCount: 15, heartCount: 13, bookmarkCount: 10),
            Post(user: anotherUser, category: "tech", title: "이거 뭐에요?", content: "map{($0)}에서 $0이 뭡니까\nmap은 아는데..", timestamp: Date().addingTimeInterval(-240), commentCount: 3, heartCount: 2, bookmarkCount: 5),
            Post(user: anotherUser, category: "tech", title: "코딩 진짜 싫다...", content: "챗GPT 썼는데도 오류나여;", timestamp: Date().addingTimeInterval(-300), commentCount: 1, heartCount: 2, bookmarkCount: 1),
            Post(user: defaultUser, category: "tech", title: "시뮬레이터가 안 켜져요...", content: "어떻게 켜야 해요...?", timestamp: ISO8601DateFormatter().date(from: "2025-04-14T23:46:00Z")!, commentCount: 1),
            Post(user: anotherUser, category: "tech", title: "아무거나 물어보면 되나요?", content: "제곧내", timestamp: ISO8601DateFormatter().date(from: "2024-12-12T03:46:00Z")!),
            
            Post(user: defaultUser, category: "design", title: "피그마 어떻게 공부해야 해요..", content: "진짜 모르겠어요 하ㅠㅠㅠㅠㅠ", timestamp: Date(), commentCount: 2, heartCount: 3),
            Post(user: anotherUser, category: "design", title: "갑자기 피그마 양 옆이 사라졌어요", content: "이거 어디 간 거에요 어케 켜요", timestamp: Date().addingTimeInterval(-120), commentCount: 15, heartCount: 13, bookmarkCount: 10),
            Post(user: anotherUser, category: "design", title: "하이파이 한 번만 도와주실 분", content: "지금 C5 카페테리아 좀 와주세요 제발", timestamp: Date().addingTimeInterval(-240), commentCount: 3, heartCount: 2, bookmarkCount: 5),
            Post(user: anotherUser, category: "design", title: "그그그 뭐죠 그거 있잖아요", content: "그 막 그 확인 취소 나오는 버튼 그거 컴포넌트 이름 뭐죠ㅜ", timestamp: Date().addingTimeInterval(-300), commentCount: 1, heartCount: 2, bookmarkCount: 1),
            Post(user: anotherUser, category: "design", title: "모달형식 패턴 잘 이해가 안돼요", content: "팀즈에 올라온 그 병아리반이랑 같이 있는 글 봤거든요 거기에 있는 링크로 들어가서 봤는데 이거 모르겠어요 설명 좀요..", timestamp: ISO8601DateFormatter().date(from: "2025-04-14T23:46:00Z")!, commentCount: 1),
            Post(user: anotherUser, category: "design", title: "아무거나 물어보면 되나욤?", content: "제곧내~", timestamp: ISO8601DateFormatter().date(from: "2024-12-12T03:46:00Z")!),
            
            Post(user: defaultUser, category: "domain", title: "기획을 어떻게 해야 잘 할 수 있을까요", content: "꿀팁 좀 주세요", timestamp: Date(), commentCount: 2, heartCount: 3),
            Post(user: anotherUser, category: "domain", title: "사업기획서 써보신 분 계신가요?", content: "창업지원 신청하려고 하는데 이전에 해보신 분 있으시면 도움 좀 주실 수 있나요!", timestamp: Date().addingTimeInterval(-120), commentCount: 15, heartCount: 13, bookmarkCount: 10),
            Post(user: anotherUser, category: "domain", title: "도메인의 밤 다녀오신 분 계신가요?", content: "어땠나요", timestamp: Date().addingTimeInterval(-240), commentCount: 3, heartCount: 2, bookmarkCount: 5),
            Post(user: anotherUser, category: "domain", title: "기획은 얼마나 하는 게 좋을까요", content: "개발과 디자인도 해야 하니까 기간을 어떻게 둬야 할 지..", timestamp: Date().addingTimeInterval(-300), commentCount: 1, heartCount: 2, bookmarkCount: 1),
            Post(user: anotherUser, category: "domain", title: "PM 희망하시는 분 계신가요", content: "각자 PM에 대해 어떻게 생각하시는지 얘기해보고 싶어요", timestamp: ISO8601DateFormatter().date(from: "2025-04-14T23:46:00Z")!, commentCount: 1),
            Post(user: anotherUser, category: "domain", title: "아무거나 물어보면 되나용?", content: "제곧내!!", timestamp: ISO8601DateFormatter().date(from: "2024-12-12T03:46:00Z")!)
        ]
    }
}
