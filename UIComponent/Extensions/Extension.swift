//
//  Extension.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import Foundation

struct Extension<Base> {
    let base: Base
    init (_ base: Base) {
        self.base = base
    }
}

protocol ExtensionCompatible {
    associatedtype Compatible
    static var ex: Extension<Compatible>.Type { get }
    var ex: Extension<Compatible> { get }
}

extension ExtensionCompatible {
    static var ex: Extension<Self>.Type {
        return Extension<Self>.self
    }

    var ex: Extension<Self> {
        return Extension(self)
    }
}
