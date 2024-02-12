// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// протокол для передачи данных об обжарке
protocol RoastTypeDelegate: AnyObject {
    func transfer(_ imageName: String, text: String)
}

// экран с выбором деталей заказа
class DetailViewController: UIViewController {
    var roastImageName = "темнаяОбж" {
        didSet {
            mainView.buttonRoastView.imageView.image = UIImage(named: roastImageName)
        }
    }

    var roastText = "Темная\nобжарка" {
        didSet {
            mainView.buttonRoastView.textLabel.text = roastText
        }
    }

    let mainView = DetailControllerView()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addRecognizer()
    }

    func addRecognizer() {
        let roastGesture = UITapGestureRecognizer()
        roastGesture.addTarget(self, action: #selector(goToCoffeRoastVC))
        mainView.buttonRoastView.addGestureRecognizer(roastGesture)
    }

    @objc func goToCoffeRoastVC() {
        let secondVC = CoffeRoastViewController()
        switch roastImageName {
        case "темнаяОбж":
            secondVC.mainView.blackButtonRoastView.layer.borderWidth = 1
            secondVC.mainView.blackButtonRoastView.layer.borderColor = UIColor.gray.cgColor
        case "светлаяОбж":
            secondVC.mainView.whiteButtonRoastView.layer.borderWidth = 1
            secondVC.mainView.whiteButtonRoastView.layer.borderColor = UIColor.gray.cgColor
        default: break
        }
        secondVC.delegate = self
        present(secondVC, animated: true)
    }
}

/// подписываю на делегат и реализую замену варианта обжарки
extension DetailViewController: RoastTypeDelegate {
    func transfer(_ imageName: String, text: String) {
        roastImageName = imageName
        roastText = text
    }
}
