// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран каталог
class CatalogViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - IBOutlets

    // MARK: - Visual Components

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 49, width: 175, height: 50))
        imageView.image = UIImage(named: "LogoCoffe")
        return imageView
    }()

    private let helloLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        label.text = "Добро пожаловать, Гость"
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8)
        return label
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        imageView.image = UIImage(named: "avatar")
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
        label.text = "Адреса кофеен"
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()

    private let accessAdressLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 318, width: 260, height: 30))
        label.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни "
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 2
        label.textColor = UIColor(red: 156, green: 161, blue: 168, alpha: 1)
        return label
    }()

    private let locationIconImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 309, y: 307, width: 20, height: 29))
        imageView.image = UIImage(named: "LocationIcon")
        return imageView
    }()

    private let cakeView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 464, width: 335, height: 80))
        view.backgroundColor = UIColor(red: 225, green: 194, blue: 160, alpha: 0.7)
        view.layer.cornerRadius = 16
        return view
    }()

    private let teaView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 564, width: 335, height: 80))
        view.backgroundColor = UIColor(red: 225, green: 194, blue: 160, alpha: 0.7)
        view.layer.cornerRadius = 16
        return view
    }()

    private let coffeView: UIView = {
        let view = UIView(frame: CGRect(x: 20, y: 664, width: 335, height: 80))
        view.backgroundColor = UIColor(red: 225, green: 194, blue: 160, alpha: 0.7)
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
        label.text = "Минью"

        label.textAlignment = .center
        if let font = UIFont(name: "AmaticSC-Bold", size: 25) {
            label.font = font
        } else {
            label.font = .boldSystemFont(ofSize: 25)
        }

        return label
    }()

    private let underMenuImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 137, y: 410, width: 100, height: 40))
        imageView.image = UIImage(named: "UnderMenu")
        return imageView
    }()

    private let cakeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 272, y: 469, width: 70, height: 70))
        imageView.image = UIImage(named: "Cake")
        return imageView
    }()

    private let teaImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 272, y: 584, width: 70, height: 70))
        imageView.image = UIImage(named: "Tea")
        return imageView
    }()

    private let coffeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 272, y: 669, width: 70, height: 70))
        imageView.image = UIImage(named: "Coffe")
        return imageView
    }()

    private let cakeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 495, width: 220, height: 19))
        label.text = "Пти пате аля «РюсЪ»"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let teaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 594, width: 180, height: 19))
        label.text = "Горячiя напитки"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let coffeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 695, width: 180, height: 19))
        label.text = "Кофий"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = UIColor(red: 120, green: 84, blue: 49, alpha: 1.0)
        view.addSubview(logoImageView)
        view.addSubview(helloLabel)
        view.addSubview(avatarImageView)
        view.addSubview(menuView)
        view.addSubview(adressView)
        view.addSubview(cakeView)
        view.addSubview(teaView)
        view.addSubview(coffeView)
        view.addSubview(adressLabel)
        view.addSubview(accessAdressLabel)
        view.addSubview(locationIconImageView)
        view.addSubview(menuLabel)
        view.addSubview(underMenuImageView)
        view.addSubview(cakeLabel)
        view.addSubview(teaLabel)
        view.addSubview(coffeLabel)
        view.addSubview(cakeImageView)
        view.addSubview(teaImageView)
        view.addSubview(coffeImageView)
        view.addSubview(coffeButton)
    }

    @objc private func coffeButtonTapped() {
        let detailViewController = SmsViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
