// OptionsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран с выбором дополнительных опций
final class OptionsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let milk = "Молоко"
        static let milkPrice = 50
        static let syrop = "Сироп"
        static let syropPrice = 20
        static let soyMilk = "Молоко соевое"
        static let soyMilkPrice = 50
        static let almondMilk = "Молоко миндальное"
        static let almondMilkPrice = 70
        static let espresso = "Эспрессо"
        static let espressoPrice = 50
    }

    // MARK: - Private Properties

    let mainView = OptionsControllerView()
    var coffeModel = CoffeModel()
    weak var delegate: CoffeModelDelegate?

    // MARK: - Live Cycle

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }

    // MARK: - Private Methods

    /// метод добавляет таргет к каждому свитчу
    private func addTargets() {
        mainView.milkSwitch.addTarget(
            self,
            action: #selector(testSwit(_:)),
            for: .valueChanged
        )
        mainView.syropSwitch.addTarget(
            self,
            action: #selector(testSwit(_:)),
            for: .valueChanged
        )
        mainView.espressoSwitch.addTarget(
            self,
            action: #selector(testSwit(_:)),
            for: .valueChanged
        )
        mainView.soyMilkSwitch.addTarget(
            self,
            action: #selector(testSwit(_:)),
            for: .valueChanged
        )
        mainView.almondMilkSwitch.addTarget(
            self,
            action: #selector(testSwit(_:)),
            for: .valueChanged
        )
        mainView.cancelButton.addTarget(
            self,
            action: #selector(goBack),
            for: .touchUpInside
        )
    }

    /// метод для обработки нажатий на свитчи
    /// добавляет в словарь модели ключи и значения
    /// а так же удаляет их если свитч выключен
    @objc private func testSwit(_ sender: UISwitch) {
        switch sender {
        case mainView.milkSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(
                    Constants.milkPrice,
                    forKey: Constants.milk
                )
            } else {
                coffeModel.optionsMap.removeValue(forKey: Constants.milk)
            }
        case mainView.syropSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(
                    Constants.syropPrice,
                    forKey: Constants.syrop
                )
            } else {
                coffeModel.optionsMap.removeValue(forKey: Constants.syrop)
            }
        case mainView.soyMilkSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(
                    Constants.soyMilkPrice,
                    forKey: Constants.soyMilk
                )
            } else {
                coffeModel.optionsMap.removeValue(forKey: Constants.soyMilk)
            }
        case mainView.almondMilkSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(
                    Constants.almondMilkPrice,
                    forKey: Constants.almondMilk
                )
            } else {
                coffeModel.optionsMap.removeValue(forKey: Constants.almondMilk)
            }
        case mainView.espressoSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(
                    Constants.espressoPrice,
                    forKey: Constants.espresso
                )
            } else {
                coffeModel.optionsMap.removeValue(forKey: Constants.espresso)
            }
        default: break
        }
    }

    @objc private func goBack() {
        delegate?.transfer(model: coffeModel)
        dismiss(animated: true)
    }
}
