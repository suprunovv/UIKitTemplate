// MainView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Основной вью
final class MainView: UIView {
    // MARK: - Публичные свойства

    /// Заглавный лейбл с именем и приветствием
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.backgroundColor = UIColor(named: "SkyBlue")
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemGray6.cgColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    /// Кнопка для первой игры
    let playRundomNumberButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 82, y: 301, width: 150, height: 150))
        button.setTitle("Угадай \nчисло", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "gameOneColor")
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(named: "gameOneBorder")?.cgColor
        return button
    }()

    /// Кнопка для калькулятора
    let calculateButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 132, y: 507, width: 200, height: 200))
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "gameTwoColor")
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(named: "gameTwoBorder")?.cgColor
        return button
    }()

    let backgroundImageView = UIImageView(image: UIImage(named: "Background"))

    // MARK: - Инициализаторы

    override init(frame: CGRect) {
        super.init(frame: frame)
        setBacgroundView()
        setTitleLabel()
        setButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - приватные методы

    private func setBacgroundView() {
        backgroundColor = .white
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 375, height: 860)
        backgroundImageView.contentMode = .scaleAspectFit
        addSubview(backgroundImageView)
    }

    private func setTitleLabel() {
        titleLabel.frame = CGRect(x: 0, y: 37, width: 375, height: 82)
        addSubview(titleLabel)
        titleLabel.isHidden = true
    }

    private func setButton() {
        addSubview(playRundomNumberButton)
        addSubview(calculateButton)
    }
}
