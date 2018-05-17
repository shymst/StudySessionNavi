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

    private lazy var collectionView: UICollectionView = { [weak self] in
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(SessionListCollectionViewCell.self, forCellWithReuseIdentifier: "SessionListCell")
        guard let strongSelf = self else { fatalError() }
        collectionView.dataSource = strongSelf
        collectionView.delegate = strongSelf
        collectionView.backgroundColor = .red
        return collectionView
    }()

    private var targetDate: Date! {
        didSet {
            calendarView.configureWith(year: targetDate.year, month: targetDate.month)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        targetDate = Date()

//        let dataStore = ConnpassDataStoreImpl()
//        dataStore.search(keyword: "") { (result) in
//            print(result)
//        }
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(calendarView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                view.heightAnchor.constraint(equalToConstant: 318)
            ]
        }

        view.addSubview(collectionView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: calendarView.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
            ]
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SessionListViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.bounds.width, height: UICollectionViewFlowLayoutAutomaticSize.height)
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

// MARK: - UICollectionViewDataSource
extension SessionListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SessionListCell", for: indexPath) as? SessionListCollectionViewCell else { fatalError() }
//        cell.configureWith(viewModel: viewModels[indexPath.row])
//        cell.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        return cell
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
        targetDate.month -= 1
    }

    func tapNextButton() {
        targetDate.month += 1
    }
}
