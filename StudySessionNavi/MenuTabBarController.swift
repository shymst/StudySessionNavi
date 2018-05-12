//
//  MenuTabBarController.swift
//  StudySessionNavi
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

final class MenuTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sessionListViewContrller = SessionListViewController()
        let sessionListNavigationContrller = UINavigationController(rootViewController: sessionListViewContrller)

        let viewControllers: [UIViewController] = [
            sessionListNavigationContrller
        ]
        setViewControllers(viewControllers, animated: false)
    }
}
