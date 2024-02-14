// DetailControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью экрана с деталями
final class DetailControllerView: UIView {
    // MARK: - Constants

    enum Constants {
        static let coffeImageNames = ["кофе", "капучино", "латте"]
        static let blackRoastText = "Темная\nобжарка"
        static let coffeNames = ["Американо", "Капучино", "Латте"]
        static let backgroundColor = "backColor"
        static let modificationLabelText = "Модификация"
        static let priceLabelText = "Цѣна - 100 руб"
        static let ingridientsViewText = "Дополнительные\nингредіенты"
        static let bottomButtonColorName = "buttonColor"
        static let bottomButtonText = "Заказать"
    }

    // MARK: - Visual Components

    /// главная имеджВью с картинкой коффе
    let titleImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 112,
            y: 128,
            width: 150,
            height: 150
        ))
        imageView.image = UIImage(named: Constants.coffeImageNames[0])
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
        view.backgroundColor = UIColor(named: Constants.backgroundColor)
        view.layer.cornerRadius = 20
        return view
    }()

    /// лейбл с текстом "Модификация"
    private let modificationLabel = UILabel(
        text: Constants.modificationLabelText,
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
        text: Constants.priceLabelText,
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
        let segment = UISegmentedControl(items: Constants.coffeNames)
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
        button.textLabel.text = Constants.blackRoastText
        return button
    }()

    /// кнопка/вьюха с ингридиентами
    var ingridientsView: CustomButtonView = {
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
        button.textLabel.text = Constants.ingridientsViewText
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
        button.setTitle(Constants.bottomButtonText, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: Constants.bottomButtonColorName)
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
        addSubview(ingridientsView)
        addSubview(orderButton)
        addSubview(priceLabel)
    }
}
