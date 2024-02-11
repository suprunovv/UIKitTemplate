// PersonCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// кастомная вью для ячейки с человеком
final class PersonCell: UIView {
    // MARK: - Public Properties

    /// создание имеджВью для аватарки
    var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 8, y: 11, width: 75, height: 75))
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()

    /// создание лейбла с именем
    var nameLabel = UILabel(
        text: "name lastname",
        font: .boldSystemFont(ofSize: 16),
        alignment: .left,
        numberOfLines: 1,
        textColor: .black,
        frame: CGRect(
            x: 91,
            y: 25,
            width: 180,
            height: 20
        )
    )

    /// создание лейбла с датой дня рождения
    var birthdayDayLabel = UILabel(
        text: "27.11.1999",
        font: .systemFont(ofSize: 14),
        alignment: .left,
        numberOfLines: 1,
        textColor: .black,
        frame: CGRect(
            x: 91,
            y: 53,
            width: 180,
            height: 20
        )
    )

    /// создание имэдж вью с картинкой торта)
    var cakeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 279, y: 25, width: 44, height: 44))
        imageView.image = UIImage(named: "cake")
        imageView.isHidden = true
        return imageView
    }()

    /// создание лейбла с отображением дней до дня рождения
    var daysToBirthdayLabel = UILabel(
        text: "  25\nDays",
        font: .boldSystemFont(ofSize: 16),
        alignment: .center,
        numberOfLines: 2,
        textColor: .blue,
        frame: CGRect(
            x: 279,
            y: 25,
            width: 42,
            height: 44
        )
    )

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Properties

    /// метод добавляет вью на главный вью
    private func setView() {
        addSubview(avatarImageView)
        addSubview(nameLabel)
        addSubview(birthdayDayLabel)
        addSubview(cakeImageView)
        addSubview(daysToBirthdayLabel)
    }
}
