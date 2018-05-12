//
//  CalendarView.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

final public class CalendarView: UIView {

    private let headerView = CalendarHeaderView()
    private let containarView = CalendarContainarView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        // TODO:
        headerView.backgroundColor = .lightGray
        containarView.backgroundColor = .yellow

        addSubview(headerView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: 46)
            ]
        }

        addSubview(containarView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: 248)
            ]
        }
    }
}

// MARK: - CalendarHeaderView
final class CalendarHeaderView: UIView {
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = true
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
        // TODO:
        monthLabel.text = "5月"

        addSubview(monthLabel) { (label) -> ([NSLayoutConstraint]) in
            [
                label.centerXAnchor.constraint(equalTo: centerXAnchor),
                label.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        }
    }
}

// MARK: - CalendarContainarView
final class CalendarContainarView: UIView {
    private let weekHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCell")
        guard let strongSelf = self else { fatalError() }
        collectionView.dataSource = strongSelf
        collectionView.delegate = strongSelf
        return collectionView
    }()

    private let CellSizeWidth: CGFloat = (UIScreen.main.bounds.size.width - 6) / 7
    private let CellSizeHeight: CGFloat = (UIScreen.main.bounds.size.width - 5) / 6

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        addSubview(weekHeaderView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: CellSizeHeight - 15)
            ]
        }

        addSubview(collectionView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: weekHeaderView.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        }


    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupWeekHeaderView()
    }

    private func setupWeekHeaderView() {
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.locale = Locale(identifier: "ja_JP")
        let weekdaySymbols: [String] = calendar.shortWeekdaySymbols

        let frameSize = CGSize(width: CellSizeWidth, height: weekHeaderView.bounds.height)
        for index in 0..<7 {
            let dayView = UIView()
            dayView.backgroundColor = .green
            weekHeaderView.addSubview(dayView)

            let dayLabel = UILabel()
            dayView.addSubview(dayLabel)
            dayLabel.text = weekdaySymbols[index]
            dayLabel.font = UIFont.systemFont(ofSize: 12)
            dayLabel.textAlignment = .center

            switch index {
            case 0:
                dayLabel.textColor = .red
                dayView.backgroundColor = .white
            case 6:
                dayLabel.textColor = .blue
                dayView.backgroundColor = .white
            default:
                dayLabel.textColor = .black
            }

            let dayViewPoint = CGPoint(x: (CellSizeWidth + 1) * CGFloat(index), y: 0)
            dayView.frame = CGRect(origin: dayViewPoint, size: frameSize)
            dayLabel.frame = CGRect(origin: .zero, size: frameSize)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CalendarContainarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CellSizeWidth, height: CellSizeHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

// MARK: - UICollectionViewDataSource
extension CalendarContainarView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as? CalendarCollectionViewCell else { fatalError() }
        cell.backgroundColor = .red
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CalendarContainarView: UICollectionViewDelegate {}

// MARK: - CalendarCollectionViewCell
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
        backgroundColor = .green
    }
}
