
import Foundation

func getDays(year: Int, month: Int) -> [Int] {
    let calendar: Calendar = Calendar.current
    let targetDateComponents = DateComponents(year: year, month: month)
    guard let targetDate = calendar.date(from: targetDateComponents) else { fatalError() }
    var dateComponents = calendar.dateComponents([.year, .month], from: targetDate)

    var days = [Int]()
    for week in 1...5 {
        dateComponents.weekOfMonth = week
        for weekday in 1...7 {
            dateComponents.weekday = weekday
            if let date = calendar.date(from: dateComponents) {
                let day = calendar.component(.day, from: date)
                days.append(day)
            }
        }
    }
    return days
}

getDays(year: 2018, month: 5)
