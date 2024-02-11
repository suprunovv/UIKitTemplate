// StartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// тут находится стартовый контроллер
final class StartViewController: UIViewController {
    // MARK: - Приватные свойства

    private var mainView = MainView()
    private var name = String()
    private var calculateResult = Int()
    private var randomNumber = 5

    // MARK: - Методы жизненного цикла

    override func loadView() {
        view = mainView
    }

    override func viewDidAppear(_ animated: Bool) {
        addRegisterAlert(title: "Пожалуйста, \nпредставтесь", message: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionPlayButton()
    }

    // MARK: - Приватные методы

    /// Функция создает алерт, который просит ввести имя
    private func addRegisterAlert(title: String, message: String?) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addTextField { textFiled in
            textFiled.placeholder = "введите ваше имя"
        }
        alert.addAction(UIAlertAction(
            title: "Готово",
            style: .default,
            handler: { [weak self] _ in
                guard let self = self else { return }
                self.name = alert.textFields?.first?.text ?? ""
                self.mainView.titleLabel.isHidden = false
                self.mainView.backgroundImageView.frame = CGRect(x: 0, y: 37, width: 375, height: 775)
                self.mainView.titleLabel.text = "Приветствую, \n\(self.name)!"
            }
        ))
        present(alert, animated: true, completion: nil)
    }

    /// добавляем действия кнопкам
    private func addActionPlayButton() {
        mainView.calculateButton.addTarget(
            self,
            action: #selector(calculation),
            for: .touchUpInside
        )
        mainView.playRundomNumberButton.addTarget(
            self,
            action: #selector(addTargetRandomNumber),
            for: .touchUpInside
        )
    }

    /// Функция вызывает алерт с результатом вычисений
    private func createResultAlert() {
        let resultAlert = UIAlertController(
            title: "Ваш результат",
            message: "\(calculateResult)",
            preferredStyle: .alert
        )
        resultAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        resultAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(resultAlert, animated: true, completion: nil)
    }

    /// функция создает алерт экшены с математическими действиями
    private func createCalculateAction(_ operation: CalculateOperation, numOne: Int, numTwo: Int) -> UIAlertAction {
        switch operation {
        case .fold:
            return UIAlertAction(title: "Сложить", style: .default) { _ in
                self.calculateResult = numOne + numTwo
                self.createResultAlert()
            }
        case .subtract:
            return UIAlertAction(title: "Вычесть", style: .default) { _ in
                self.calculateResult = numOne - numTwo
                self.createResultAlert()
            }
        case .multiply:
            return UIAlertAction(title: "Умножить", style: .default) { _ in
                self.calculateResult = numOne * numTwo
                self.createResultAlert()
            }
        case .divide:
            guard numTwo != 0 else {
                return UIAlertAction(title: "Делить", style: .default) { _ in
                    self.calculateResult = 1 / numTwo
                    self.createResultAlert()
                }
            }
            return UIAlertAction(title: "Делить", style: .default) { _ in
                self.calculateResult = numOne / numTwo
                self.createResultAlert()
            }
        case .cancel:
            return UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        }
    }

    // MARK: - objc методы

    /// метод для с алертами калькулятора
    @objc private func calculation() {
        let alert = UIAlertController(
            title: "Введите ваши числа",
            message: nil,
            preferredStyle: .alert
        )
        alert.addTextField { textFiled in
            textFiled.placeholder = "Число 1"
        }
        alert.addTextField { textFiled in
            textFiled.placeholder = "Число 2"
        }
        alert.addAction(UIAlertAction(
            title: "Выбрать операцию",
            style: .default,
            handler: { _ in
                guard let numOne = Int(alert.textFields?[0].text ?? "0"),
                      let numTwo = Int(alert.textFields?[1].text ?? "0")
                else {
                    return
                }
                let operationAlert = UIAlertController(
                    title: "Выберите математическую операцию",
                    message: nil,
                    preferredStyle: .alert
                )
                for operation in CalculateOperation.allCases {
                    operationAlert.addAction(self.createCalculateAction(operation, numOne: numOne, numTwo: numTwo))
                }
                self.present(operationAlert, animated: true, completion: nil)
            }
        ))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    /// Логика угадывания числа и всплывающих алертов
    @objc private func addTargetRandomNumber() {
        let mainAlert = UIAlertController(title: "Угадайте число от 1 до 10", message: nil, preferredStyle: .alert)
        let mainAlertActionOk = UIAlertAction(title: "Ок", style: .default, handler: { _ in
            guard let number = Int(mainAlert.textFields?[0].text ?? "0") else { return }
            if number == self.randomNumber {
                let resultAlert = UIAlertController(title: "Поздравляю!", message: "Вы угадали", preferredStyle: .alert)
                resultAlert.addAction(UIAlertAction(title: "Ок", style: .default))
                self.randomNumber = Int.random(in: 1 ... 10)
                self.present(resultAlert, animated: true, completion: nil)
            } else if number > self.randomNumber {
                mainAlert.title = "Попробуйте еще раз"
                mainAlert.message = "Вы ввели слишком большое число"
                self.present(mainAlert, animated: true, completion: nil)
            } else {
                mainAlert.title = "Попробуйте еще раз"
                mainAlert.message = "Вы ввели слишком маленькое число"
                self.present(mainAlert, animated: true, completion: nil)
            }
        })
        mainAlert.addTextField { textFiled in
            textFiled.placeholder = "Введите число"
        }
        mainAlert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        mainAlert.addAction(mainAlertActionOk)
        present(mainAlert, animated: true, completion: nil)
    }
}
