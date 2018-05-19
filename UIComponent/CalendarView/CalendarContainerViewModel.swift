//
//  CalendarContainerViewModel.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import Foundation
import RxSwift

protocol CalendarContainerViewModelInputs {
    func configureWith(year: Int, month: Int)
}

protocol CalendarContainerViewModelOutputs {
    typealias EventDate = (type: DayType, day: Int, count: Int)
    var eventDateList: Variable<[EventDate]> { get }
}

protocol CalendarContainerViewModelType {
    var inputs: CalendarContainerViewModelInputs { get }
    var outputs: CalendarContainerViewModelOutputs { get }
}

final class CalendarContainerViewModel: CalendarContainerViewModelInputs, CalendarContainerViewModelOutputs, CalendarContainerViewModelType {

    var inputs: CalendarContainerViewModelInputs { return self }
    var outputs: CalendarContainerViewModelOutputs { return self }

    // MARK: - CalendarContainerViewModelInputs

    var eventDateList: Variable<[EventDate]> = Variable([])

    // MARK: - CalendarContainerViewModelOutputs

    func configureWith(year: Int, month: Int) {
        var newEventDateList: [EventDate] = []
        let weeks = Date.ex.getWeeks(year: year, month: month)
        for week in weeks {
            for (index, day) in week.enumerated() {
                var type: DayType
                switch index {
                case 0: type = .holiday
                case 6: type = .saturday
                default: type = .weekday
                }
                let date: EventDate = EventDate(type: type, day: day, count: 0)
                newEventDateList.append(date)
            }
        }
        eventDateList.value = newEventDateList
    }
}
