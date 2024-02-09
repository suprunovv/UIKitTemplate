// DetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с составом салата
final class DetailsViewController: UIViewController {
    // MARK: - Публичные свойства

    var name = ""
    var productImage = ""
    var compound = ""

    // MARK: - Приваные свойства

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var productImageView: UIImageView!
    @IBOutlet private var compoundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setDetails()
    }

    // MARK: - Приватные методы

    private func setDetails() {
        nameLabel.text = name
        productImageView.image = UIImage(named: productImage)
        compoundLabel.text = compound
    }
}
