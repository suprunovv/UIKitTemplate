// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран с итоговой суммой
final class OrderViewController: UIViewController {
    // MARK: - Public Properties

    var model = CoffeModel()
    var coffeName = ""
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
        mainView.priceLabel.text = "Цѣна - \(model.totalPrice) руб"
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

    /// метод отрисовывает лейблы с опциями которые пришли в модели
    private func addOtionsLabels() {
        var startY = 191
        for (name, price) in model.optionsMap {
            let optionNameLabel = UILabel(
                text: name,
                color: .black,
                aligment: .left,
                font: .systemFont(ofSize: 16),
                lines: 1,
                frame: CGRect(
                    x: 20,
                    y: startY,
                    width: 160,
                    height: 30
                )
            )
            let priceLabel = UILabel(
                text: "\(price) руб",
                color: .black,
                aligment: .right,
                font: .systemFont(ofSize: 16),
                lines: 1,
                frame: CGRect(
                    x: 225,
                    y: startY,
                    width: 130,
                    height: 30
                )
            )
            view.addSubview(optionNameLabel)
            view.addSubview(priceLabel)
            startY += 36
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
