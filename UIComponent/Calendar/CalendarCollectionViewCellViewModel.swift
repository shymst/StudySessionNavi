//
//  CalendarCollectionViewCellViewModel.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import Foundation

struct CalendarCollectionViewCellViewModel {
    let day: Int
    let count: Int
    let type: DayType
    var isSelected: Bool = false

    enum DayType {
        case weekday, saturday, sunday, holiday
    }
}
