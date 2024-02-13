// SmsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран с кодом из смс
class SmsViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - IBOutlets

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(named: "Backbutton")
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Кодъ из СМС"
    }
}
