//
//  CalendarCollectionViewCell.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

struct CalendarCollectionViewCellViewModel {
    let day: Int
    let count: Int
    let type: DayType
    var isSelected: Bool = false

    enum DayType {
        case weekday, saturday, sunday, holiday
    }
}

final class CalendarCollectionViewCell: UICollectionViewCell {

    private lazy var dayLabel: UILabel = { [weak self] in
        guard let strongSelf = self else { fatalError() }
        let label = UILabel()
        label.frame = CGRect(x: 4, y: 0, width: strongSelf.bounds.width - 8, height: strongSelf.bounds.height / 2)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()

    private lazy var countLabel: UILabel = { [weak self] in
        guard let strongSelf = self else { fatalError() }
        let label = UILabel()
        label.frame = CGRect(x: 0, y: strongSelf.bounds.height / 2, width: strongSelf.bounds.width, height: strongSelf.bounds.height / 2)
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = .white
        addSubview(dayLabel)
        addSubview(countLabel)
    }

    internal func configureWith(viewModel: CalendarCollectionViewCellViewModel) {
        dayLabel.text = "\(viewModel.day)"
        countLabel.text = "\(viewModel.count)"

        switch viewModel.type {
        case .weekday:
            dayLabel.textColor = UIColor.ex.textBlack
        case .saturday:
            dayLabel.textColor = .blue
        case .holiday, .sunday:
            dayLabel.textColor = .red
        }

        if viewModel.isSelected {
            backgroundColor = .blue
            countLabel.textColor = .white
        }
    }
}
