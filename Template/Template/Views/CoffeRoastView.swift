// CoffeRoastView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью экрана с выбором обжарки
final class CoffeRoastView: UIView {
    // MARK: - Constants

    enum Constants {
        static let titleLabelText = "Уточните обжарку зеренъ"
        static let blackRoastText = "Темная\nобжарка"
        static let whiteRoastImageName = "светлаяОбж"
        static let whiteRoastText = "Свѣтлая\nобжарка"
    }

    // MARK: - Visual Components

    /// заглавный лейбл
    private let titleLabel = UILabel(
        text: Constants.titleLabelText,
        color: .black,
        aligment: .center,
        font: .boldSystemFont(ofSize: 18),
        lines: 1,
        frame: CGRect(
            x: 40,
            y: 53,
            width: 294,
            height: 30
        )
    )

    /// имеджВью/кнопка темной обжарки
    var blackButtonRoastView: CustomButtonView = {
        let button = CustomButtonView(frame: CGRect(
            x: 15,
            y: 102,
            width: 165,
            height: 165
        ))
        button.textLabel.text = Constants.blackRoastText
        return button
    }()

    /// имеджВью/кнопка светлой обжарки
    var whiteButtonRoastView: CustomButtonView = {
        let button = CustomButtonView(frame: CGRect(
            x: 195,
            y: 102,
            width: 165,
            height: 165
        ))
        button.imageView.image = UIImage(named: Constants.whiteRoastImageName)
        button.textLabel.text = Constants.whiteRoastText
        return button
    }()

    /// кнопка закрыть экран
    let cancelButton = CancelButton(frame: CGRect(
        x: 20,
        y: 26,
        width: 14,
        height: 14
    ))

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    /// метод добавления вью на главный вью
    private func setViews() {
        backgroundColor = .white
        addSubview(blackButtonRoastView)
        addSubview(whiteButtonRoastView)
        addSubview(titleLabel)
        addSubview(cancelButton)
    }
}
