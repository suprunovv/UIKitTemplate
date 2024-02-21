// HistoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка одной истории
final class HistoryView: UIView {
    // MARK: - Constants

    enum Constants {
        static let plusImage = UIImage(systemName: "plus")
    }

    // MARK: - Visual content

    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nikNameLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.plusImage, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()

    // MARK: - Inicializators

    convenience init(history: User) {
        self.init()
        titleImageView.image = UIImage(named: history.imageName)
        nikNameLabel.text = history.nikName
        translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }

    // MARK: - Public methods

    func isMyStory() {
        plusButton.isHidden = false
        nikNameLabel.textColor = .gray
    }

    // MARK: - Private methods

    private func setConstraints() {
        addSubview(titleImageView)
        titleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        titleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        titleImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        addSubview(nikNameLabel)
        nikNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        nikNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        nikNameLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 5).isActive = true
        nikNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        addSubview(plusButton)
        plusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 52).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        plusButton.topAnchor.constraint(equalTo: topAnchor, constant: 41).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: nikNameLabel.topAnchor, constant: -4).isActive = true
    }
}
