// CoffeRoastView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью экрана с выбором обжарки
class CoffeRoastView: UIView {
    /// заглавный лейбл
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 294, height: 30))
        label.text = "Уточните обжарку зеренъ"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()

    /// имеджВью/кнопка темной обжарки
    var blackButtonRoastView: ButtonCell = {
        let button = ButtonCell(frame: CGRect(
            x: 15,
            y: 102,
            width: 165,
            height: 165
        ))
        button.textLabel.text = "Темная\nобжарка"
        return button
    }()

    /// имеджВью/кнопка светлой обжарки
    var whiteButtonRoastView: ButtonCell = {
        let button = ButtonCell(frame: CGRect(
            x: 195,
            y: 102,
            width: 165,
            height: 165
        ))
        button.imageView.image = UIImage(named: "светлаяОбж")
        button.textLabel.text = "Свѣтлая\nобжарка"
        return button
    }()

    let cancelButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setViews() {
        addSubview(blackButtonRoastView)
        addSubview(whiteButtonRoastView)
        addSubview(titleLabel)
        addSubview(cancelButton)
    }
}
