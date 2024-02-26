// StroyboardTrafficLightViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Контроллер светофора на сториборде
final class StroyboardTrafficLightViewController: UIViewController {
    // MARK: - Private property

    @IBOutlet private var colorViews: [UIView]!

    // MARK: - Initializators

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setCornerRadius()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setCornerRadius()
    }

    // MARK: - Private methods

    private func setCornerRadius() {
        for colorView in colorViews {
            colorView.layer.cornerRadius = colorView.bounds.height / 2
        }
    }
}
