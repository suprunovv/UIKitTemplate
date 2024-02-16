// PlasticCardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// енам с шрифтами
enum Fonts {
    static let verdana14 = UIFont(name: "Verdana", size: 14)
    static let verdanaBold16 = UIFont(name: "Verdana-Bold", size: 16)
    static let verdanaBold10 = UIFont(name: "Verdana-Bold", size: 10)
    static let verdana16 = UIFont(name: "Verdana", size: 16)
    static let verdana12 = UIFont(name: "Verdana", size: 12)
    static let verdana10 = UIFont(name: "Verdana", size: 10)
}

/// вью пластиковой карты
final class PlasticCardView: UIView {
    // MARK: - Constants

    enum Constants {
        static let cardLogoImage = UIImage(named: "logoCard")
        static let qrCodeImage = UIImage(systemName: "qrcode")
        static let informationImage = UIImage(named: "information")
        static let numberCard = "1000 0001 0102"
        static let sellText = "15%"
    }

    // MARK: - Visual Components

    private let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.numberCard
        label.font = Fonts.verdana14
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.sellText
        label.font = Fonts.verdanaBold16
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: Constants.cardLogoImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let qrCodeButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.qrCodeImage, for: .normal)
        button.backgroundColor = .darkGray
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let informationButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.informationImage, for: .normal)
        button.backgroundColor = .darkGray
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func setupViews() {
        backgroundColor = .black
        layer.cornerRadius = 20
    }

    private func setConstraints() {
        addSubview(cardNumberLabel)
        cardNumberLabel.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 14
        ).isActive = true
        cardNumberLabel.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: -203
        ).isActive = true
        cardNumberLabel.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 142
        ).isActive = true
        cardNumberLabel.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -21
        ).isActive = true
        addSubview(discountLabel)
        discountLabel.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 14
        ).isActive = true
        discountLabel.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: -277
        ).isActive = true
        discountLabel.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 116
        ).isActive = true
        discountLabel.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -45
        ).isActive = true
        addSubview(logoImageView)
        logoImageView.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 8
        ).isActive = true
        logoImageView.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: -247
        ).isActive = true
        logoImageView.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 16
        ).isActive = true
        logoImageView.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -84
        ).isActive = true
        addSubview(qrCodeButton)
        qrCodeButton.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 292
        ).isActive = true
        qrCodeButton.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: -13
        ).isActive = true
        qrCodeButton.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 13
        ).isActive = true
        qrCodeButton.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -137
        ).isActive = true
        addSubview(informationButton)
        informationButton.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 292
        ).isActive = true
        informationButton.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: -13
        ).isActive = true
        informationButton.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 130
        ).isActive = true
        informationButton.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -20
        ).isActive = true
    }
}
