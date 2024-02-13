// CustomButtonView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// универсальная вьюха под кнопку
final class CustomButtonView: UIView {
    // MARK: - Visual Components

    /// лейбл с текстом
    let textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 117, width: 165, height: 34))
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    /// имеджВью
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 31,
            y: 17,
            width: 100,
            height: 100
        ))
        imageView.image = UIImage(named: "темнаяОбж")
        return imageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    /// метод добавляет вью на главный влю
    private func setViews() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 12
        addSubview(textLabel)
        addSubview(imageView)
        isUserInteractionEnabled = true
    }
}
