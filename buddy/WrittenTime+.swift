//
//  WrittenTime+.swift
//  buddy
//
//  Created by 이서현 on 4/21/25.
//

import SwiftUI

extension Date {
    var writtenTime: String {
        if Calendar.current.isDateInToday(self) {
            let timeOffset = self.timeIntervalSinceNow
            if timeOffset > -60 {
                return "방금 전"
            } else if timeOffset > -300 {
                return "\(-Int(timeOffset/60))분 전"
            } else {
                return self.formatted(
                    .dateTime
                        .hour()
                        .minute()
                        .locale(Locale(identifier: "ko_KR"))
                )
            }
        } else {
            if Calendar.current.isDate(self, equalTo: Date(), toGranularity: .year) {
                return self.formatted(
                    .dateTime
                        .month()
                        .day()
                        .locale(Locale(identifier: "ko_KR"))
                )
            } else {
                return self.formatted(
                    .dateTime
                        .year()
                        .month()
                        .day()
                        .locale(Locale(identifier: "ko_KR"))
                )
            }
        }
    }
}
