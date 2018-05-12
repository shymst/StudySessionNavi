//
//  AppDelegate.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = MenuTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
}
