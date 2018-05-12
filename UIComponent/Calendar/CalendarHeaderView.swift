//
//  CalendarHeaderView.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

protocol CalendarHeaderViewDelegate: class {
    func tapPrevButton()
    func tapNextButton()
}

final class CalendarHeaderView: UIView {

    private let monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()

    private lazy var prevButton: UIButton = { [weak self] in
        guard let strongSelf = self else { fatalError() }
        let button = UIButton()
        button.addTarget(strongSelf, action: #selector(tapPrevButton), for: .touchUpInside)
        button.setImage(UIImage(named: "icon_prev", in: Bundle(for: type(of: strongSelf)), compatibleWith: nil), for: .normal)
        return button
    }()

    private lazy var nextButton: UIButton = { [weak self] in
        guard let strongSelf = self else { fatalError() }
        let button = UIButton()
        button.addTarget(strongSelf, action: #selector(tapNextButton), for: .touchUpInside)
        button.setImage(UIImage(named: "icon_next", in: Bundle(for: type(of: strongSelf)), compatibleWith: nil), for: .normal)
        return button
    }()

    internal weak var delegate: CalendarHeaderViewDelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        addSubview(prevButton) { (button) -> ([NSLayoutConstraint]) in
            [
                button.leadingAnchor.constraint(equalTo: leadingAnchor),
                button.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        }

        addSubview(monthLabel) { (label) -> ([NSLayoutConstraint]) in
            [
                label.centerXAnchor.constraint(equalTo: centerXAnchor),
                label.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        }

        addSubview(nextButton) { (button) -> ([NSLayoutConstraint]) in
            [
                button.trailingAnchor.constraint(equalTo: trailingAnchor),
                button.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        }
    }

    internal func configureWith(month: Int) {
        monthLabel.text = "\(month) 月"
    }

    @objc private func tapPrevButton() {
        delegate.tapPrevButton()
    }

    @objc private func tapNextButton() {
        delegate.tapNextButton()
    }
}
