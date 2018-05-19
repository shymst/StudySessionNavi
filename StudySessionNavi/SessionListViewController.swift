//
//  SessionListViewController.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit
import UIComponent
import RxSwift

final class SessionListViewController: UIViewController {

    private lazy var calendarView: CalendarView = { [weak self] in
        guard let strongSelf = self else { fatalError() }
        let view = CalendarView()
        view.delegate = strongSelf
        return view
    }()

    private lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(SessionListCollectionViewCell.self, forCellWithReuseIdentifier: "SessionListCell")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CalendarHeaderView")
        guard let strongSelf = self else { fatalError() }
        collectionView.dataSource = strongSelf
        collectionView.delegate = strongSelf
        return collectionView
    }()

    private let viewModel: SessionListViewModelType = SessionListViewModel()

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBind()
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(collectionView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
            ]
        }
    }

    private func setupBind() {
        viewModel.outputs.targetDate.asObservable()
            .subscribe { value in
                guard let date = value.element else { return }
                self.calendarView.configureWith(year: date.year, month: date.month)
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SessionListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 318)
    }
}

// MARK: - UICollectionViewDataSource
extension SessionListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.outputs.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.outputs.numberOfItemsInSection
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SessionListCell", for: indexPath) as? SessionListCollectionViewCell else { fatalError() }
        cell.configureWith(session: viewModel.outputs.sessionList[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CalendarHeaderView", for: indexPath)
        headerView.addSubview(calendarView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: 318)
            ]
        }
        return headerView
    }
}

// MARK: - UICollectionViewDelegate
extension SessionListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// MARK: - CalendarHeaderViewDelegate
extension SessionListViewController: CalendarViewDelegate {
    func tapPrevButton() {
        viewModel.inputs.decrementTargetMonth()
    }

    func tapNextButton() {
        viewModel.inputs.incrementTargetMonth()
    }
}
