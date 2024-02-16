// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Профиль вьюКонтроллер
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let titleText = "Профиль"
    }

    // MARK: - Private properties

    private let mainView = ProfileControllerView()

    // MARK: - Life cycle

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addGestureMainView()
        setView()
    }

    // MARK: - Private methods

    private func setView() {
        title = Constants.titleText
    }

    private func addGestureMainView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToPersonData))
        mainView.addTargetMyDataLabel(gesture)
    }

    @objc private func goToPersonData() {
        let personDataViewController = PersonDataViewController()
        navigationController?.pushViewController(personDataViewController, animated: true)
    }
}
