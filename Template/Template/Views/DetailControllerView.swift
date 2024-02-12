// DetailControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью экрана с деталями
class DetailControllerView: UIView {
    /// массив названий картинок с коффе
    let coffeImages = ["кофе", "капучино", "латте"]

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

    lazy var coffeSegmentControl: UISegmentedControl = {
        var segment = UISegmentedControl(items: [
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
        segment.addTarget(
            self,
            action: #selector(segmentedImage),
            for: .valueChanged
        )
        return segment
    }()

    /// лейбл с текстом "Модификация"
    let modificationLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 15,
            y: 432,
            width: 200,
            height: 30
        ))
        label.text = "Модификация"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()

    /// кнопка/вьюха с вариантом обжарки
    var buttonRoastView: ButtonCell = {
        let button = ButtonCell(frame: CGRect(
            x: 15,
            y: 482,
            width: 165,
            height: 165
        ))
        button.textLabel.text = "Темная\nобжарка"
        return button
    }()

    /// кнопка/вьюха с ингридиентами
    var ingridientsRoastView: ButtonCell = {
        let button = ButtonCell(frame: CGRect(
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
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setViews() {
        backgroundColor = .white
        addSubview(backGroundView)
        addSubview(titleImageView)
        addSubview(coffeSegmentControl)
        addSubview(modificationLabel)
        addSubview(buttonRoastView)
        addSubview(ingridientsRoastView)
        addSubview(addPriceLabel(price: 100))
        addSubview(orderButton)
    }

    /// метод создает лейбл с ценой
    func addPriceLabel(price: Int) -> UILabel {
        let label = UILabel(frame: CGRect(
            x: 15,
            y: 669,
            width: 345,
            height: 30
        ))
        label.text = "Цѣна - \(price) руб"
        label.textColor = .black
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }

    /// метод меняет картинку кофе в зависимости от выбранного названия в сегментКонтроллере
    @objc func segmentedImage() {
        titleImageView.image = UIImage(named: coffeImages[coffeSegmentControl.selectedSegmentIndex])
    }
}
