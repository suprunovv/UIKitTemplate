// StartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый контроллер
final class StartViewController: UIViewController {
    // MARK: - Private methods

    @IBAction private func goToStackViewViewController(_ sender: UIButton) {
        let stackViewController = StackTrafficLightViewController()
        navigationController?.pushViewController(stackViewController, animated: true)
    }

    @IBAction private func goToAnchorViewControll(_ sender: UIButton) {
        let anchorViewController = AnchorViewController()
        navigationController?.pushViewController(anchorViewController, animated: true)
    }

    @IBAction private func goToNSViewController(_ sender: UIButton) {
        let nsViewController = NSLayoutViewController()
        navigationController?.pushViewController(nsViewController, animated: true)
    }
}
