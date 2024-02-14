// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран с итоговой суммой
final class OrderViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let startFrameY = 191
        static let frameYSpace = 36
        static let rubel = "Руб"
        static let syrop = "Сироп"
        static let syropPrice = 20
    }

    // MARK: - Public Properties

    var model = CoffeModel()
    var coffeName = String()
    weak var pushDelegate: PushDelegate?

    // MARK: - Private Properties

    private let mainView = OrderControllerView()

    // MARK: - Live Cycle

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addOtionsLabels()
        setLabelText()
        addTargets()
    }

    // MARK: - Private Methods

    /// передаю информацию на лейблы
    private func setLabelText() {
        mainView.coffeNameLabel.text = coffeName
        mainView.priceLabel.text = "Цѣна - \(model.totalPrice) \(Constants.rubel)"
    }

    /// метод добавляет таргет кнопке cancel
    private func addTargets() {
        mainView.cancelButton.addTarget(
            self,
            action: #selector(goBack),
            for: .touchUpInside
        )
        mainView.payButton.addTarget(
            self,
            action: #selector(goToSmsVC),
            for: .touchUpInside
        )
    }

    /// метод отрисовывает лейблы с опциями  и их ценой которые пришли в модели
    private func addOtionsLabels() {
        var startFrameY = Constants.startFrameY
        for (name, price) in model.optionsMap {
            let optionNameLabel = UILabel(
                text: name,
                color: .black,
                aligment: .left,
                font: .systemFont(ofSize: 16),
                lines: 1,
                frame: CGRect(
                    x: 20,
                    y: startFrameY,
                    width: 160,
                    height: 30
                )
            )
            let priceLabel = UILabel(
                text: "\(price) \(Constants.rubel)",
                color: .black,
                aligment: .right,
                font: .systemFont(ofSize: 16),
                lines: 1,
                frame: CGRect(
                    x: 225,
                    y: startFrameY,
                    width: 130,
                    height: 30
                )
            )
            view.addSubview(optionNameLabel)
            view.addSubview(priceLabel)
            startFrameY += Constants.frameYSpace
        }
    }

    @objc private func goBack() {
        dismiss(animated: true)
    }

    /// переход на следующий экран
    @objc private func goToSmsVC() {
        dismiss(animated: false)
        pushDelegate?.pushVC()
    }
}
