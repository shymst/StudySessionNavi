//
//  CalendarView.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

public protocol CalendarViewDelegate: class {
    func tapPrevButton()
    func tapNextButton()
}

final public class CalendarView: UIView {

    private let headerView = CalendarHeaderView()
    private let containerView = CalendarContainerView()

    public weak var delegate: CalendarViewDelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        headerView.delegate = self
        addSubview(headerView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                view.heightAnchor.constraint(equalToConstant: 46)
            ]
        }

        addSubview(containerView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                view.heightAnchor.constraint(equalToConstant: 248)
            ]
        }
    }

    public func configureWith(year: Int, month: Int) {
        headerView.configureWith(month: month)
        containerView.configureWith(year: year, month: month)
    }
}

// MARK: - CalendarHeaderViewDelegate
extension CalendarView: CalendarHeaderViewDelegate {
    func tapPrevButton() {
        delegate.tapPrevButton()
    }

    func tapNextButton() {
        delegate.tapNextButton()
    }
}
