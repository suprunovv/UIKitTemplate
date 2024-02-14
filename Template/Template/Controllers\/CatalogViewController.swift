// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран каталог
final class CatalogViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let helloText = "Добро пожаловать, Гость"
        static let adressText = "Адреса кофеен"
        static let accessAdressText = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни "
        static let menuText = "Минью"
        static let cakeText = "Пти пате аля «РюсЪ»"
        static let teaText = "Горячiя напитки"
        static let coffeText = "Кофий"
        static let verdanaBold16 = UIFont(name: "Verdana-Bold", size: 16)
        static let verdanaBold26 = UIFont(name: "Verdana-Bold", size: 26)
        static let verdanaBold12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdana14 = UIFont(name: "Verdana", size: 14)
        static let verdana12 = UIFont(name: "Verdana", size: 12)
        static let amaticSCBold25 = UIFont(name: "AmaticSC-Bold", size: 25)
        static let verdanaBoldItalic16 = UIFont(name: "Verdana-BoldItalic", size: 16)
        static let logoCoffe = UIImage(named: "LogoCoffe")
        static let avatar = UIImage(named: "avatar")
        static let locationIcon = UIImage(named: "LocationIcon")
        static let underMenu = UIImage(named: "UnderMenu")
        static let cake = UIImage(named: "cake")
        static let tea = UIImage(named: "Tea")
        static let coffe = UIImage(named: "coffe")
    }

    // MARK: - Visual Components

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 49, width: 175, height: 50))
        imageView.image = Constants.logoCoffe
        return imageView
    }()

    private let helloLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        label.text = Constants.helloText
        label.font = Constants.verdanaBold16
        label.numberOfLines = 2
        label.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        return label
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        imageView.image = Constants.avatar
        return imageView
    }()

    private let menuView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 564))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private let adressView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 288, width: 335, height: 70))
        view.backgroundColor = UIColor(red: 235, green: 246, blue: 247, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()

    private let adressLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 300, width: 150, height: 15))
        label.text = Constants.adressText
        label.font = Constants.verdanaBold12
        return label
    }()

    private let accessAdressLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 318, width: 260, height: 30))
        label.text = Constants.accessAdressText
        label.font = Constants.verdana12
        label.numberOfLines = 2
        label.textColor = .lightGray
        return label
    }()

    private let locationIconImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 309, y: 307, width: 20, height: 29))
        imageView.image = Constants.locationIcon
        return imageView
    }()

    private let cakeView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 464, width: 335, height: 80))
        view.backgroundColor = UIColor(named: "appLightCoffe")
        view.alpha = 0.7
        view.layer.cornerRadius = 16
        return view
    }()

    private let teaView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 564, width: 335, height: 80))
        view.backgroundColor = UIColor(named: "appLightCoffe")
        view.alpha = 0.7
        view.layer.cornerRadius = 16
        return view
    }()

    private let coffeView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 664, width: 335, height: 80))
        view.backgroundColor = UIColor(named: "appLightCoffe")
        view.alpha = 0.7
        view.layer.cornerRadius = 16
        return view
    }()

    private let coffeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 664, width: 335, height: 80))
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(red: 89, green: 190, blue: 199, alpha: 0)
        button.addTarget(nil, action: #selector(coffeButtonTapped), for: .touchUpInside)
        return button
    }()

    private let menuLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 125, y: 370, width: 125, height: 40))
        label.text = Constants.menuText

        label.textAlignment = .center
        if let font = Constants.amaticSCBold25 {
            label.font = font
        } else {
            label.font = .boldSystemFont(ofSize: 25)
        }

        return label
    }()

    private let underMenuImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 137, y: 410, width: 100, height: 40))
        imageView.image = Constants.underMenu
        return imageView
    }()

    private let cakeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 272, y: 469, width: 70, height: 70))
        imageView.image = Constants.cake
        return imageView
    }()

    private let teaImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 272, y: 584, width: 70, height: 70))
        imageView.image = Constants.tea
        return imageView
    }()

    private let coffeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 272, y: 669, width: 70, height: 70))
        imageView.image = Constants.coffe
        return imageView
    }()

    private let cakeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 495, width: 220, height: 19))
        label.text = Constants.cakeText
        label.font = Constants.verdanaBoldItalic16
        return label
    }()

    private let teaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 594, width: 180, height: 19))
        label.text = Constants.teaText
        label.font = Constants.verdanaBoldItalic16
        return label
    }()

    private let coffeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 695, width: 180, height: 19))
        label.text = Constants.coffeText
        label.font = Constants.verdanaBoldItalic16
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = UIColor(red: 120, green: 84, blue: 49, alpha: 1.0)
        [
            logoImageView,
            helloLabel,
            avatarImageView,
            menuView,
            adressView,
            cakeView,
            teaView,
            coffeView,
            adressLabel,
            accessAdressLabel,
            locationIconImageView,
            menuLabel,
            underMenuImageView,
            cakeLabel,
            teaLabel,
            coffeLabel,
            cakeImageView,
            teaImageView,
            coffeImageView,
            coffeButton,
        ].forEach { view.addSubview($0) }
    }

    @objc private func coffeButtonTapped() {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
