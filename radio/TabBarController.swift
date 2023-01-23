//
//  TabBarController.swift
//  radio
//
//  Created by Igor Guzei on 22.01.2023.
//

import UIKit

final class TabBarController: UITabBarController {

    let vcPlayer0 = Player0()
    let vcPlayer1 = Player1()

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = .systemGroupedBackground

        let ncPlayer0: UINavigationController = {
            let nc = UINavigationController()
            nc.setViewControllers([vcPlayer0], animated: true)
            nc.tabBarItem = UITabBarItem(title: "Player0", image: UIImage(systemName: "radio"), tag: 0)
            return nc
        }()

        let ncPlayer1: UINavigationController = {
            let nc = UINavigationController()
            nc.setViewControllers([vcPlayer1], animated: true)
            nc.tabBarItem = UITabBarItem(title: "Player1", image: UIImage(systemName: "radio"), tag: 0)
            return nc
        }()

        viewControllers = [ncPlayer0, ncPlayer1]
        selectedIndex = 1
    }
}
