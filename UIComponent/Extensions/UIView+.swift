//
//  UIView+.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

extension UIView {
    public func addSubview(_ view: UIView, with layouts: (UIView) -> ([NSLayoutConstraint])) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate(layouts(view))
    }

    public struct EitherLayoutGuide {
        weak var view: UIView!

        var topAnchor: NSLayoutYAxisAnchor {
            if #available(iOS 11.0, *) {
                return view.safeAreaLayoutGuide.topAnchor
            } else {
                return view.topAnchor
            }
        }

        var bottomAnchor: NSLayoutYAxisAnchor {
            if #available(iOS 11.0, *) {
                return view.safeAreaLayoutGuide.bottomAnchor
            } else {
                return view.bottomAnchor
            }
        }
    }

    public var eitherLayoutGuide: EitherLayoutGuide { return EitherLayoutGuide(view: self) }
}
