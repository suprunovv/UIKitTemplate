// OptionsControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью экнана с доп опциями
final class OptionsControllerView: UIView {
    // MARK: - Visual Components

    /// заглавный лейбл
    private let titleLabel = UILabel(
        text: "Выберите дополнительные\nингредіенты",
        color: .black,
        aligment: .center,
        font: .boldSystemFont(ofSize: 18),
        lines: 2,
        frame: CGRect(
            x: 40,
            y: 53,
            width: 295,
            height: 44
        )
    )
    /// тут свитчи для каждого доп компонента
    let milkSwitch = UISwitch(frame: CGRect(
        x: 301,
        y: 124,
        width: 54,
        height: 35
    ))
    let syropSwitch = UISwitch(frame: CGRect(
        x: 301,
        y: 174,
        width: 54,
        height: 35
    ))
    let soyMilkSwitch = UISwitch(frame: CGRect(
        x: 301,
        y: 224,
        width: 54,
        height: 35
    ))
    let almondMilkSwitch = UISwitch(frame: CGRect(
        x: 301,
        y: 274,
        width: 54,
        height: 35
    ))
    let espressoSwitch = UISwitch(frame: CGRect(
        x: 301,
        y: 324,
        width: 54,
        height: 35
    ))

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

    /// метод добавляет вью на главный вью
    private func setViews() {
        backgroundColor = .white
        addSubview(titleLabel)
        setOptionsLabel()
        addSubview(cancelButton)
        addSubview(milkSwitch)
        addSubview(syropSwitch)
        addSubview(soyMilkSwitch)
        addSubview(almondMilkSwitch)
        addSubview(espressoSwitch)
    }

    /// метод отрисовывает лейлы с названиями компонентов и их ценой
    private func setOptionsLabel() {
        let labelTexts = [
            "Молоко + 50 руб",
            "Сироп + 20 руб",
            "Молоко соевое + 50 руб",
            "Молоко миндальное + 70 руб",
            "Эспрессо 50мл + 50 руб"
        ]
        var startY = 124
        for text in labelTexts {
            let label = UILabel(
                text: text,
                color: .black,
                aligment: .left,
                font: .systemFont(ofSize: 18),
                lines: 1,
                frame: CGRect(
                    x: 20,
                    y: startY,
                    width: 275,
                    height: 35
                )
            )
            startY += 50
            addSubview(label)
        }
    }
}
