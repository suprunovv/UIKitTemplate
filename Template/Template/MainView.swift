// MainView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главная вьюха экрана, с лейблами и кнопками
final class MainView: UIView {
    // MARK: - Публичные свойства

    let startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 406, width: 335, height: 44))
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "startButtonColor")
        return button
    }()

    let firstLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 106, width: 275, height: 57))
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "Вы ввели слово"
        return label
    }()

    let secondLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 282, width: 275, height: 57))
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "А вот что получится, если \nчитать справа налево"
        return label
    }()

    let originalWordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 163, width: 275, height: 57))
        label.textColor = .systemGray3
        label.font = .italicSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    let reversWordLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 50, y: 339, width: 275, height: 57))
        label.textColor = .systemGray3
        label.font = .italicSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    // MARK: - Инициализаторы

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Приватные методы

    private func setView() {
        backgroundColor = .white
        addSubview(startButton)
        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(originalWordLabel)
        addSubview(reversWordLabel)
        firstLabel.isHidden = true
        secondLabel.isHidden = true
        originalWordLabel.isHidden = true
        reversWordLabel.isHidden = true
    }
}
