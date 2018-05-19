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

    private lazy var headerView: CalendarHeaderView = { [weak self] in
        guard let strongSelf = self else { fatalError() }
        let headerView = CalendarHeaderView()
        headerView.delegate = strongSelf
        return headerView
    }()

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
        addSubview(headerView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: 46)
            ]
        }

        addSubview(containerView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
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
