// OptionsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран с выбором дополнительных опций
class OptionsViewController: UIViewController {
    let mainView = OptionsControllerView()
    var coffeModel = CoffeModel()
    weak var delegate: CoffeModelDelegate?

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetSwitch()
    }

    /// метод добавляет таргет к каждому свитчу
    func addTargetSwitch() {
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
    }

    /// метод для обработки нажатий на свитчи
    /// добавляет в словарь модели ключи и значения
    /// а так же удаляет их если свитч выключен
    @objc func testSwit(_ sender: UISwitch) {
        switch sender {
        case mainView.milkSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(50, forKey: "Молоко")
            } else {
                coffeModel.optionsMap.removeValue(forKey: "Молоко")
            }
        case mainView.syropSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(20, forKey: "Сироп")
            } else {
                coffeModel.optionsMap.removeValue(forKey: "Сироп")
            }
        case mainView.soyMilkSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(50, forKey: "Молоко соевое")
            } else {
                coffeModel.optionsMap.removeValue(forKey: "Молоко соевое")
            }
        case mainView.almondMilkSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(70, forKey: "Молоко миндальное")
            } else {
                coffeModel.optionsMap.removeValue(forKey: "Молоко миндальное")
            }
        case mainView.espressoSwitch:
            if sender.isOn {
                coffeModel.optionsMap.updateValue(50, forKey: "Эспрессо")
            } else {
                coffeModel.optionsMap.removeValue(forKey: "Эспрессо")
            }
        default: break
        }
    }
}
