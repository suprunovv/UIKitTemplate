// ShopTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// табБар контроллер
class ShopTabBarController: UITabBarController {
    private let catalogViewController = CatalogViewController()
    private let catalogTabBarItem = UITabBarItem(
        title: "Каталог",
        image: UIImage(named: "list"),
        tag: 0
    )

    private let shoppingCartViewController = ShoppingCartViewController()
    private let shoppingCartTabBarItem = UITabBarItem(
        title: "Корзина",
        image: UIImage(named: "bag"),
        selectedImage: UIImage(named: "fillBag")
    )
    private let profileViewController = ProfileViewController()
    private let profileTabBarItem = UITabBarItem(
        title: "Профиль",
        image: UIImage(named: "person"),
        tag: 2
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    func setupTabBar() {
        let catalogNavigationController = UINavigationController(rootViewController: catalogViewController)
        catalogNavigationController.tabBarItem = catalogTabBarItem
        let shoppingCartNavigationController = UINavigationController(rootViewController: shoppingCartViewController)
        shoppingCartNavigationController.tabBarItem = shoppingCartTabBarItem
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = profileTabBarItem
        viewControllers = [
            catalogNavigationController,
            shoppingCartNavigationController,
            profileNavigationController
        ]

        tabBar.tintColor = UIColor(
            red: 225.0 / 255.0,
            green: 24.0 / 255.0,
            blue: 131.0 / 255.0,
            alpha: 1
        )
        tabBar.barTintColor = .clear
    }
}
