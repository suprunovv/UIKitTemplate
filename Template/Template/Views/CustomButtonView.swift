// CustomButtonView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// универсальная вьюха под кнопку
class CustomButtonView: UIView {
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        layer.cornerRadius = 12
        addSubview(textLabel)
        addSubview(imageView)
        isUserInteractionEnabled = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
