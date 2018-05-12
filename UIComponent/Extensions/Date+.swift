//
//  Date+.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import Foundation

extension Date: ExtensionCompatible {}

extension Extension where Base == Date {
    static func getWeeks(year: Int, month: Int) -> [[Int]] {
        let calendar: Calendar = Calendar.current
        let targetDateComponents = DateComponents(year: year, month: month)
        guard let targetDate = calendar.date(from: targetDateComponents) else { fatalError() }
        var dateComponents = calendar.dateComponents([.year, .month], from: targetDate)

        var weeks = [[Int]]()
        for week in 1...6 {
            dateComponents.weekOfMonth = week
            var days = [Int]()
            for weekday in 1...7 {
                dateComponents.weekday = weekday
                if let date = calendar.date(from: dateComponents) {
                    let day = calendar.component(.day, from: date)
                    days.append(day)
                }
            }
            weeks.append(days)
        }
        return weeks
    }
}
