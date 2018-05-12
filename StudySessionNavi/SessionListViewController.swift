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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        calendarView.configureWith(year: 2018, month: 5)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(calendarView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ]
        }
    }
}
