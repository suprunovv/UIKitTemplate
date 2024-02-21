// RecommendationProfileView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка рекомендованного профился
final class RecommendationProfileView: UIView {
    // MARK: - Constants

    enum Constents {
        static let closeImage = UIImage(systemName: "xmark")
        static let subscribeTitle = "Подписаться"
        static let subscribeColor = UIColor(
            red: 0 / 255,
            green: 122 / 255,
            blue: 225 / 225,
            alpha: 1
        )
    }

    // MARK: - Visual content

    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 56
        return imageView
    }()

    private let nikNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(Constents.closeImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let subscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constents.subscribeTitle, for: .normal)
        button.tintColor = .white
        button.backgroundColor = Constents.subscribeColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializators

    convenience init(user: User) {
        self.init()
        titleImageView.image = UIImage(named: user.imageName)
        nikNameLabel.text = user.nikName
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        setConstraint()
    }

    // MARK: - Private methods

    private func setConstraint() {
        addSubview(titleImageView)
        titleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        titleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        titleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        titleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70).isActive = true
        addSubview(nikNameLabel)
        nikNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42).isActive = true
        nikNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -42).isActive = true
        nikNameLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 5).isActive = true
        nikNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -53).isActive = true
        addSubview(subscribeButton)
        subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        subscribeButton.topAnchor.constraint(equalTo: nikNameLabel.bottomAnchor, constant: 9).isActive = true
        subscribeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14).isActive = true
        addSubview(closeButton)
        closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 167).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6).isActive = true
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        closeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -178).isActive = true
    }
}
