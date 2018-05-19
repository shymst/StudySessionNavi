//
//  CalendarCollectionViewCell.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

final public class SessionCell: UICollectionViewCell {

    private let viewModel: SessionCellViewModelType = SessionCellViewModel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = UIColor.ex.borderLightGray
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }
//
//    internal func configureWith(session: Session) {
//        print(session)
//    }
}
