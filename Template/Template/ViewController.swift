// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: Вью контроллер

/// Контроллер главного экрана
final class ViewController: UIViewController {
    // MARK: - Приватные свойства

    private let mainView = MainView()

    // MARK: - Инициализаторы

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionStartButton()
    }

    // MARK: - Приватные методы

    private func addActionStartButton() {
        mainView.startButton.addTarget(
            self,
            action: #selector(reversWord),
            for: .touchUpInside
        )
    }

    // MARK: - Приватные objc методы

    /// тут создается алерт и логика
    @objc private func reversWord() {
        let alert = UIAlertController(
            title: "Введите ваше слово",
            message: nil,
            preferredStyle: .alert
        )
        alert.addTextField { textFiled in
            textFiled.placeholder = "Введите слово"
        }
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(
            title: "Ок",
            style: .default,
            handler: { [weak self] _ in
                guard let self = self else { return }
                if let originText = alert.textFields?[0].text {
                    let revers = Revers()
                    self.mainView.originalWordLabel.text = originText
                    self.mainView.reversWordLabel.text = revers.reversWord(originText)
                    self.mainView.secondLabel.isHidden = false
                    self.mainView.firstLabel.isHidden = false
                    self.mainView.reversWordLabel.isHidden = false
                    self.mainView.originalWordLabel.isHidden = false
                    self.mainView.startButton.frame = CGRect(
                        x: 20,
                        y: 598,
                        width: 335,
                        height: 44
                    )
                }
            }
        ))
        present(alert, animated: true, completion: nil)
    }
}
