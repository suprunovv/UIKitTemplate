// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol BackProtocol: AnyObject {
    func goBack()
}

/// Класс с чеком
final class CheckViewController: UIViewController {
    // MARK: - Приватные методы

    @IBAction private func goByeButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondVc = storyboard.instantiateViewController(withIdentifier: "lastVC") as? CloseViewController {
            secondVc.delegate = self
            present(secondVc, animated: true, completion: nil)
        }
    }

    @IBAction private func goCezarDetails(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secVC = storyboard.instantiateViewController(withIdentifier: "detailsVC") as? DetailsViewController {
            secVC.productImage = "цезарь"
            secVC.name = "Цезарь"
            secVC.compound = """
            Грудка куриная
            Капуста пекинская
            Помидоры черри
            Сыр твердый
            Хлеб белый
            Соль
            Масло оливковое
            Перец черный молотый
            Чеснок
            Майонез
            """
            present(secVC, animated: true, completion: nil)
        }
    }

    @IBAction private func goGrecheskyDetails(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secVC = storyboard.instantiateViewController(withIdentifier: "detailsVC") as? DetailsViewController {
            secVC.productImage = "греческий"
            secVC.name = "Греческий"
            secVC.compound = """
            Помидоры
            Огурцы свежие
            Лук красный
            Перец болгарский
            Сыр фета
            Оливки
            Лимон
            Масло оливковое
            Соль
            Перец черный молотый
            """
            present(secVC, animated: true, completion: nil)
        }
    }
}

// расширение с подпиской на делегат (что бы сразу переходить на 2 экрана назад)

extension CheckViewController: BackProtocol {
    func goBack() {
        navigationController?.popViewController(animated: false)
    }
}
