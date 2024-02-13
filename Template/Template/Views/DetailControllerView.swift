// DetailControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью экрана с деталями
final class DetailControllerView: UIView {
    // MARK: - Visual Components

    /// главная имеджВью с картинкой коффе
    let titleImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 112,
            y: 128,
            width: 150,
            height: 150
        ))
        imageView.image = UIImage(named: "кофе")
        return imageView
    }()

    /// вью сзади картинки с кофе в верхней части экрана
    let backGroundView: UIView = {
        let view = UIView(frame: CGRect(
            x: 0,
            y: -10,
            width: 375,
            height: 356
        ))
        view.backgroundColor = UIColor(named: "backColor")
        view.layer.cornerRadius = 20
        return view
    }()

    /// лейбл с текстом "Модификация"
    private let modificationLabel = UILabel(
        text: "Модификация",
        color: .black,
        aligment: .left,
        font: .boldSystemFont(ofSize: 18),
        lines: 1,
        frame: CGRect(
            x: 15,
            y: 432,
            width: 200,
            height: 30
        )
    )
    /// лейбл с ценой
    var priceLabel = UILabel(
        text: "Цѣна - 100 руб",
        color: .black,
        aligment: .right,
        font: .boldSystemFont(ofSize: 18),
        lines: 1,
        frame: CGRect(
            x: 15,
            y: 669,
            width: 345,
            height: 30
        )
    )

    // MARK: - Public Properties

    /// сегмент контрол с выбором кофе
    lazy var coffeSegmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: [
            "Американо",
            "Капучино",
            "Латте"
        ])
        segment.selectedSegmentIndex = 0
        segment.frame = CGRect(
            x: 15,
            y: 368,
            width: 345,
            height: 44
        )
        return segment
    }()

    /// кнопка/вьюха с вариантом обжарки
    var buttonRoastView: CustomButtonView = {
        let button = CustomButtonView(frame: CGRect(
            x: 15,
            y: 482,
            width: 165,
            height: 165
        ))
        button.textLabel.text = "Темная\nобжарка"
        return button
    }()

    /// кнопка/вьюха с ингридиентами
    var ingridientsRoastView: CustomButtonView = {
        let button = CustomButtonView(frame: CGRect(
            x: 195,
            y: 482,
            width: 165,
            height: 165
        ))
        button.imageView.image = UIImage(named: "pluss")
        button.imageView.frame = CGRect(
            x: 67.42,
            y: 56.42,
            width: 27.19,
            height: 27.19
        )
        button.textLabel.text = "Дополнительные\nингредіенты"
        return button
    }()

    /// кнопка заказать при нажатии на нее переходим на следующий экран
    let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(
            x: 15,
            y: 717,
            width: 345,
            height: 53
        )
        button.setTitle("Заказать", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 12
        return button
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

    /// метод добавляет все вью на главный вью
    private func setViews() {
        backgroundColor = .white
        addSubview(backGroundView)
        addSubview(titleImageView)
        addSubview(coffeSegmentControl)
        addSubview(modificationLabel)
        addSubview(buttonRoastView)
        addSubview(ingridientsRoastView)
        addSubview(orderButton)
        addSubview(priceLabel)
    }
}
