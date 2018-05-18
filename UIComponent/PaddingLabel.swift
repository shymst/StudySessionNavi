//
//  PaddingLabel.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/17.
//

import UIKit

final class PaddingLabel: UILabel {

    internal var padding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, padding))
    }

    override var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += padding.top + padding.bottom
        intrinsicSuperViewContentSize.width += padding.left + padding.right
        return intrinsicSuperViewContentSize
    }
}
