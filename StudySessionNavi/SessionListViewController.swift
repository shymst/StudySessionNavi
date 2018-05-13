//
//  SessionListViewController.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit
import UIComponent

final class SessionListViewController: UIViewController {

    private lazy var calendarView: CalendarView = { [weak self] in
        guard let strongSelf = self else { fatalError() }
        let view = CalendarView()
        view.delegate = strongSelf
        return view
    }()

    internal var targetDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        calendarView.configureWith(year: targetDate.year, month: targetDate.month)
    }

    private func setupUI() {
        view.backgroundColor = .white
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
        targetDate.month -= 1
        calendarView.configureWith(year: targetDate.year, month: targetDate.month)
    }

    func tapNextButton() {
        targetDate.month += 1
        calendarView.configureWith(year: targetDate.year, month: targetDate.month)
    }
}
