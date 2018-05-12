//
//  CalendarCollectionViewCell.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

final class CalendarCollectionViewCell: UICollectionViewCell {

    private let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let countLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private var isHoliday: Bool = false
    private var isToday: Bool = false

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
    }
}
