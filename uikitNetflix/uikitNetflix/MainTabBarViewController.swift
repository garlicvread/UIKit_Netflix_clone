//
//  ViewController.swift
//  uikitNetflix
//
//  Created by 김제필 on 7/3/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow

        let viewController1 = UINavigationController(rootViewController: HomeViewController())
        let viewController2 = UINavigationController(rootViewController: UpcommingViewController())
        let viewController3 = UINavigationController(rootViewController: SearchViewController())
        let viewController4 = UINavigationController(rootViewController: DownloadsViewController())

        setViewControllers([viewController1, viewController2, viewController3, viewController4], animated: true)
    }


}

