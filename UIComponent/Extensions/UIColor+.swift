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

    static var textBlack: UIColor {
        return UIColor(red: 37.0 / 255.0, green: 37.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0)
    }

    static var calendarHeaderRed: UIColor {
        return UIColor(red: 1.0, green: 237.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
    }

    static var calendarHeaderBlue: UIColor {
        return UIColor(red: 225.0 / 255.0, green: 249.0 / 255.0, blue: 1.0, alpha: 1.0)
    }

    static var calendarHeaderGray: UIColor {
        return UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }
}
