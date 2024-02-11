// AppendPersonControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью экрана с добавлением человека
final class AppendPersonControllerView: UIView {
    // MARK: - Public Properties

    /// кнопка добавить фото
    let changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 125, y: 199, width: 125, height: 20)
        button.setTitle("Change photo", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()

    /// кнопка закрыть
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 15, width: 50, height: 20)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()

    /// кнопка добваить
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 325, y: 15, width: 30, height: 20)
        button.setTitle("add", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()

    /// создаю текстфилд с именем
    let nameTextFiled = UITextField(
        placeholder: "Typing Name Surname",
        style: .none,
        frame: CGRect(
            x: 20,
            y: 268,
            width: 250,
            height: 18
        )
    )

    /// создаю текстфилд с  датой дня рождения
    let birthdayTextFiled = UITextField(
        placeholder: "Typing Date of Birth",
        style: .none,
        frame: CGRect(
            x: 20,
            y: 343,
            width: 250,
            height: 18
        )
    )

    /// создаю текстфилд с возрастом
    let ageTextFiled = UITextField(
        placeholder: "Typing age",
        style: .none,
        frame: CGRect(
            x: 20,
            y: 418,
            width: 250,
            height: 18
        )
    )

    /// создаю текстфилд с гендером
    let genderTextFiled = UITextField(
        placeholder: "Indicate Gender",
        style: .none, frame: CGRect(
            x: 20,
            y: 491,
            width: 250,
            height: 18
        )
    )

    /// создаю текстфилд с телеграммом
    let telegramTextFiled = UITextField(
        placeholder: "Typing Telegram",
        style: .none, frame: CGRect(
            x: 20,
            y: 566,
            width: 250,
            height: 18
        )
    )

    // MARK: - Private Properties

    /// создаю имедж вью для аватарки
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 125,
            y: 66,
            width: 125,
            height: 125
        ))
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "дефолтАва")
        imageView.layer.cornerRadius = imageView.frame.width / 2
        return imageView
    }()

    /// названия всех лейблов
    private let labelNames = [
        "Name Surname",
        "Birthday",
        "Age",
        "Gender",
        "Telegram"
    ]

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        addLabels()
        setViews()
        createLine()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    /// добавляю вью на главный вью
    private func setViews() {
        backgroundColor = .white
        addSubview(avatarImageView)
        addSubview(changePhotoButton)
        addSubview(cancelButton)
        addSubview(addButton)
        addSubview(nameTextFiled)
        addSubview(birthdayTextFiled)
        addSubview(ageTextFiled)
        addSubview(genderTextFiled)
        addSubview(telegramTextFiled)
    }

    /// добавляю лейблы через цикл
    private func addLabels() {
        var startY = 239
        for text in labelNames {
            let label = UILabel(
                text: text,
                font: .boldSystemFont(ofSize: 16),
                alignment: .left,
                numberOfLines: 1,
                textColor: .black,
                frame: CGRect(
                    x: 20,
                    y: startY,
                    width: 175,
                    height: 19
                )
            )
            addSubview(label)
            startY += 75
        }
    }

    /// Отрисовываем линии под текстФилдами
    private func createLine() {
        var startY = 293
        for _ in 0 ... 4 {
            let line = UIView()
            line.backgroundColor = .systemGray4
            line.frame = CGRect(x: 20, y: startY, width: 335, height: 1)
            addSubview(line)
            startY += 75
        }
    }
}
