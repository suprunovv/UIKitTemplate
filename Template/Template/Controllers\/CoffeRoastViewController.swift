// CoffeRoastViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран с выбором обжарки
final class CoffeRoastViewController: UIViewController {
    // MARK: - Public Properties

    let mainView = CoffeRoastView()
    weak var delegate: RoastTypeDelegate?

    // MARK: - Live Cycle

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTargetButton()
    }

    /// метод добавляет нажатия на кнопки вариантов обжарки
    private func setTargetButton() {
        let blackRecognizer = UITapGestureRecognizer()
        blackRecognizer.addTarget(self, action: #selector(transferBlack))
        let whiteRecognizer = UITapGestureRecognizer()
        whiteRecognizer.addTarget(self, action: #selector(transferWhite))
        mainView.blackButtonRoastView.addGestureRecognizer(blackRecognizer)
        mainView.whiteButtonRoastView.addGestureRecognizer(whiteRecognizer)
        mainView.cancelButton.addTarget(
            self,
            action: #selector(cancelButton),
            for: .touchUpInside
        )
    }

    // MARK: - Private Methods

    /// метод для передачи темной обжарки делегату
    @objc private func transferBlack() {
        delegate?.transfer("темнаяОбж", text: "Темная\nобжарка")
        mainView.blackButtonRoastView.layer.borderWidth = 1
        mainView.whiteButtonRoastView.layer.borderWidth = 0
    }

    /// метод для передачи светлой обжарки делегату
    @objc private func transferWhite() {
        delegate?.transfer("светлаяОбж", text: "Свѣтлая\nобжарка")
        mainView.blackButtonRoastView.layer.borderWidth = 0
        mainView.whiteButtonRoastView.layer.borderWidth = 1
    }

    @objc private func cancelButton() {
        dismiss(animated: true)
    }
}
