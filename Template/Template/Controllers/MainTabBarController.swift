// MainTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// основной таб бар приложения
final class MainTabBarController: UITabBarController {
    // MARK: - Constants

    enum Constants {
        static let newslineTitle = "Лента"
        static let newslineImage = UIImage(named: "newsline")
        static let profileTitle = "Профиль"
        static let profileImage = UIImage(named: "profile")
        static let notificationsTitle = "Уведомлени"
        static let notificationsImage = UIImage(named: "notifications")
    }

    // MARK: - Private properties

    private let newslineNavigationController = UINavigationController(rootViewController: NewslineViewController())
    private let newslineTabBarItem = UITabBarItem(
        title: Constants.newslineTitle, image: Constants.newslineImage, tag: 0
    )

    private let notificationsNavigationController = UINavigationController(
        rootViewController: NotificationsViewController()
    )
    private let notificationsTabBarItem = UITabBarItem(
        title: Constants.notificationsTitle, image: Constants.notificationsImage, tag: 1
    )

    private let profileNavigationController = UINavigationController(
        rootViewController: ProfileViewController()
    )
    private let profileTabBarItem = UITabBarItem(
        title: Constants.profileTitle, image: Constants.profileImage, tag: 2
    )

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }

    // MARK: - Private methods

    private func setTabBar() {
        newslineNavigationController.tabBarItem = newslineTabBarItem
        notificationsNavigationController.tabBarItem = notificationsTabBarItem
        profileNavigationController.tabBarItem = profileTabBarItem
        setViewControllers(
            [
                newslineNavigationController,
                notificationsNavigationController,
                profileNavigationController
            ],
            animated: true
        )
    }
}
