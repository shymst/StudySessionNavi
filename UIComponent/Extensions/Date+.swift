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

public extension Date {

    init(year: Int? = nil, month: Int? = nil, day: Int? = nil) {
        self.init()
        if let value = year   { self.year   = value }
        if let value = month  { self.month  = value }
        if let value = day    { self.day    = value }
    }

    var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            setComponentValue(newValue, for: .year)
        }
    }

    var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            setComponentValue(newValue, for: .month)
        }
    }

    var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            setComponentValue(newValue, for: .day)
        }
    }

    private mutating func setComponentValue(_ value: Int, for component: Calendar.Component) {
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.setValue(value, for: component)
        if let date = calendar.date(from: components) {
            self = date
        }
    }

    var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .japan
        calendar.locale   = .japan
        return calendar
    }
}

extension TimeZone {
    static let japan = TimeZone(identifier: "Asia/Tokyo")!
}

extension Locale {
    static let japan = Locale(identifier: "ja_JP")
}
