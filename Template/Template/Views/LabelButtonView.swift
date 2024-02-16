// LabelButtonView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// кастомная вью с лейблом, кнопкой и линией
final class LabelButtonView: UIView {
    enum Constants {
        static let labelText = "Мои данные"
    }

    // MARK: - Visual content

    private let label = UILabel(
        text: Constants.labelText,
        font: Fonts.verdana16,
        textColor: .black
    )

    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "personBook"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray3
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    // MARK: - Initializators

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public methods

    func setupView(text: String, imageName: String) {
        label.text = text
        imageView.image = UIImage(named: imageName)
    }

    // MARK: - Private methods

    private func setConstraints() {
        addSubview(label)
        addSubview(imageView)
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 23).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 57).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
        addSubview(line)
        line.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        line.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 1).isActive = true
        line.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
