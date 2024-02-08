// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер с составлением заказа
final class OrderViewController: UIViewController {
    // MARK: - Приватные методы

    @IBAction private func getCheck(_ sender: UIButton) {
        let alert = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Чек", style: .default, handler: { _ in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyboard.instantiateViewController(withIdentifier: "second")
            self.navigationController?.pushViewController(secondVC, animated: true)
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.preferredAction = okAction
        present(alert, animated: true, completion: nil)
    }
}
