// ThankViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран спасибо за заказ
final class ThankViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let goodText = "Хорошо"
        static let thankText = "спасибо за заказъ"
        static let wishText = "Разскажи о насъ другу, отправь ему промокодъ на безплатный напитокъ "
            + "и получи скидку 10% на слѣдующій заказъ."
    }

    enum Fonts {
        static let verdanaBold18 = UIFont(name: "Verdana-Bold", size: 18)
        static let verdanaBold16 = UIFont(name: "Verdana-Bold", size: 16)
        static let verdanaBold26 = UIFont(name: "Verdana-Bold", size: 26)
        static let verdanaBold12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdana16 = UIFont(name: "Verdana", size: 16)
        static let verdana14 = UIFont(name: "Verdana", size: 14)
        static let verdana12 = UIFont(name: "Verdana", size: 12)
        static let amaticSCBold25 = UIFont(name: "AmaticSC-Bold", size: 25)
        static let amaticSCBold50 = UIFont(name: "AmaticSC-Bold", size: 50)
        static let verdanaBoldItalic16 = UIFont(name: "Verdana-BoldItalic", size: 16)
    }

    enum Images {
        static let flowers = UIImage(named: "Flowers")
    }

    // MARK: - Visual Components

    private let goodButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 632, width: 345, height: 44))
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 89, green: 190, blue: 199, alpha: 1)
        button.setTitle(Constants.goodText, for: .normal)
        button.titleLabel?.font = Fonts.verdanaBold16
        button.addTarget(nil, action: #selector(goodButtonTapped), for: .touchUpInside)
        return button
    }()

    private let flowersImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 92, y: 58, width: 200, height: 87))
        imageView.image = Images.flowers
        return imageView
    }()

    private let thankLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 75, y: 184, width: 235, height: 128))
        label.text = Constants.thankText
        label.numberOfLines = 2
        label.textAlignment = .center
        if let font = Fonts.amaticSCBold50 {
            label.font = font
        } else {
            label.font = .boldSystemFont(ofSize: 50)
        }

        return label
    }()

    private let wishLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 362, width: 315, height: 89))
        label.text = Constants.wishText
        label.numberOfLines = 4
        label.textColor = .lightGray
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
        [
            goodButton,
            flowersImageView,
            thankLabel,
            wishLabel,
        ].forEach { view.addSubview($0) }
    }

    @objc private func goodButtonTapped() {
        mainNavigationController?.popToRootViewController(animated: true)
        dismiss(animated: true)
    }
}
