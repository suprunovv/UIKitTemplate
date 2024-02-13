// OrderControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью экрана с ордером
final class OrderControllerView: UIView {
    // MARK: - Visual Components

    /// лейбл общая цена
    var priceLabel = UILabel(
        text: "Цѣна - 200 руб",
        color: .black,
        aligment: .center,
        font: .boldSystemFont(ofSize: 18),
        lines: 1,
        frame: CGRect(
            x: 80,
            y: 433,
            width: 231,
            height: 30
        )
    )

    /// лейбл с названием коффе
    var coffeNameLabel = UILabel(
        text: "Американо",
        color: .black,
        aligment: .left,
        font: .boldSystemFont(ofSize: 16),
        lines: 1,
        frame: CGRect(
            x: 20,
            y: 155,
            width: 150,
            height: 30
        )
    )

    /// лейбл с ценой кофе
    var coffePriceLabel = UILabel(
        text: "100 руб",
        color: .black,
        aligment: .right,
        font: .boldSystemFont(ofSize: 16),
        lines: 1,
        frame: CGRect(
            x: 225,
            y: 155,
            width: 130,
            height: 30
        )
    )

    /// кнопка для перехода на следующий экран
    let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(
            x: 15,
            y: 632,
            width: 345,
            height: 53
        )
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 12
        return button
    }()

    /// кнопка закрытия экрана
    let cancelButton = CancelButton(frame: CGRect(
        x: 20,
        y: 26,
        width: 14,
        height: 14
    ))

    // MARK: - Private Properties

    /// заглавный лейбл
    private let titleLabel = UILabel(
        text: "Вашъ Заказъ",
        color: .black,
        aligment: .center,
        font: .boldSystemFont(ofSize: 18),
        lines: 1,
        frame: CGRect(
            x: 120,
            y: 100,
            width: 140,
            height: 30
        )
    )
    private let leftImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 20,
            y: 47.29,
            width: 100,
            height: 72.71
        ))
        imageView.image = UIImage(named: "leftImage")
        return imageView
    }()

    private let bottomImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 145,
            y: 472,
            width: 100,
            height: 40
        ))
        imageView.image = UIImage(named: "bottomImage")
        return imageView
    }()

    private let rightImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 260,
            y: 47.29,
            width: 100,
            height: 72.71
        ))
        imageView.image = UIImage(named: "rightImage")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// метод добавляет вью на главный влю
    private func setViews() {
        backgroundColor = .white
        addSubview(cancelButton)
        addSubview(titleLabel)
        addSubview(leftImageView)
        addSubview(rightImageView)
        addSubview(bottomImageView)
        addSubview(coffeNameLabel)
        addSubview(coffePriceLabel)
        addSubview(priceLabel)
        addSubview(payButton)
    }
}
