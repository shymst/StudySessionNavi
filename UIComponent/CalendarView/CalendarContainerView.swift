//
//  CalendarContainerView.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit
import RxSwift

final class CalendarContainerView: UIView {

    private let weekHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    private lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")
        guard let strongSelf = self else { fatalError() }
        collectionView.dataSource = strongSelf
        collectionView.delegate = strongSelf
        return collectionView
    }()

    private var cellSizeWidth: CGFloat = 0
    private var cellSizeHeight: CGFloat = 0

    let viewModel: CalendarContainerViewModelType = CalendarContainerViewModel()

    private let disposeBag = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupBind()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        setupBind()
    }

    private func setupBind() {
        viewModel.outputs.eventDateList.asObservable()
            .subscribe { _ in
                self.collectionView.reloadData()
            }
            .disposed(by: disposeBag)
    }

    internal func configureWith(year: Int, month: Int) {
        viewModel.inputs.configureWith(year: year, month: month)
    }

    private func setCellSize() {
        cellSizeWidth = (collectionView.bounds.width - 6) / 7
        cellSizeHeight = (collectionView.bounds.height - 5) / 6
        collectionView.reloadData()
    }

    private func setupUI() {
        backgroundColor = UIColor.ex.borderLightGray
        layer.borderColor = UIColor.ex.borderLightGray.cgColor
        layer.borderWidth = 1

        addSubview(weekHeaderView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: 24)
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
        setCellSize()
        setupWeekHeaderView()
    }

    private func setupWeekHeaderView() {
        var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        calendar.locale = Locale(identifier: "ja_JP")
        let weekdaySymbols: [String] = calendar.shortWeekdaySymbols

        let frameSize = CGSize(width: cellSizeWidth, height: weekHeaderView.bounds.height)
        for index in 0..<7 {
            let dayView = UIView()
            dayView.backgroundColor = .white
            weekHeaderView.addSubview(dayView)

            let dayLabel = UILabel()
            dayView.addSubview(dayLabel)
            dayLabel.text = weekdaySymbols[index]
            dayLabel.font = UIFont.systemFont(ofSize: 12)
            dayLabel.textAlignment = .center

            switch index {
            case 0:
                dayView.backgroundColor = UIColor.ex.calendarHeaderRed
                dayLabel.textColor = .red
            case 6:
                dayView.backgroundColor = UIColor.ex.calendarHeaderBlue
                dayLabel.textColor = .blue
            default:
                dayView.backgroundColor = UIColor.ex.calendarHeaderGray
                dayLabel.textColor = .black
            }

            let dayViewPoint = CGPoint(x: (cellSizeWidth + 1) * CGFloat(index), y: 0)
            dayView.frame = CGRect(origin: dayViewPoint, size: frameSize)
            dayLabel.frame = CGRect(origin: .zero, size: frameSize)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CalendarContainerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSizeWidth, height: cellSizeHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}

// MARK: - UICollectionViewDataSource
extension CalendarContainerView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.outputs.eventDateList.value.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as? CalendarCell else { fatalError() }
        let date = viewModel.outputs.eventDateList.value[indexPath.row]
        cell.configureWith(type: date.type, day: date.day, count: date.count)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CalendarContainerView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
