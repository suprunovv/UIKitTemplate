// ThankViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран спасибо за заказ
class ThankViewController: UIViewController {
    // MARK: - Visual Components

    private let goodButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 632, width: 345, height: 44))
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 89, green: 190, blue: 199, alpha: 1)
        button.setTitle("Хорошо", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(nil, action: #selector(goodButtonTapped), for: .touchUpInside)
        return button
    }()

    private let flowersImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 92, y: 58, width: 200, height: 87))
        imageView.image = UIImage(named: "Flowers")
        return imageView
    }()

    private let thankLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 75, y: 184, width: 235, height: 128))
        label.text = "спасибо за заказъ"
        label.numberOfLines = 2
        label.textAlignment = .center
        if let font = UIFont(name: "AmaticSC-Bold", size: 50) {
            label.font = font
        } else {
            label.font = .boldSystemFont(ofSize: 50)
        }

        return label
    }()

    private let wishLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 362, width: 315, height: 89))
        label.text = "Разскажи о насъ другу, отправь ему промокодъ на безплатный напитокъ "
            + "и получи скидку 10% на слѣдующій заказъ."
        label.numberOfLines = 4
        label.textColor = UIColor(red: 156, green: 161, blue: 168, alpha: 1)
        label.textAlignment = .center
        return label
    }()

    // MARK: - Public Properties

    var mainNavigationController: UINavigationController?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(goodButton)
        view.addSubview(flowersImageView)
        view.addSubview(thankLabel)
        view.addSubview(wishLabel)
    }

    @objc private func goodButtonTapped() {
        mainNavigationController?.popToRootViewController(animated: true)
        dismiss(animated: true)
    }
}
