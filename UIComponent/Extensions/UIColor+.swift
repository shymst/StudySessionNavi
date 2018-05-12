//
//  UIColor+.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import Foundation

extension UIColor: ExtensionCompatible {}

extension Extension where Base: UIColor {
    static var borderLightGray: UIColor {
        return UIColor(red: 221.0 / 255.0, green: 221.0 / 255.0, blue: 225.0 / 255.0, alpha: 1.0)
    }
}
