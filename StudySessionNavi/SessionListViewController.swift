//
//  SessionListViewController.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit
import UIComponent

final class SessionListViewController: UIViewController {

    private let calendarView = CalendarView()

    var year = 2018
    var month = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        calendarView.configureWith(year: year, month: month)
    }

    private func setupUI() {
        view.backgroundColor = .white

        calendarView.delegate = self
        view.addSubview(calendarView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor)
            ]
        }
    }
}

// MARK: - CalendarHeaderViewDelegate
extension SessionListViewController: CalendarViewDelegate {
    func tapPrevButton() {
        // TODO: year
        month -= 1
        calendarView.configureWith(year: year, month: month)
    }

    func tapNextButton() {
        // TODO: year
        month += 1
        calendarView.configureWith(year: year, month: month)
    }
}
