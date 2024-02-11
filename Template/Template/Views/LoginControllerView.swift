// LoginControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с эллементами экрана входа
final class LoginControllerView: UIView {
    // MARK: - Public Properties

    /// Создание текстовых полей для воода пароля и логина
    /// поле ввода email
    let emailTextFiled = UITextField(
        placeholder: "Typing email",
        style: .none,
        frame: CGRect(
            x: 20,
            y: 345,
            width: 175,
            height: 21
        )
    )
    /// поле ввода пароля
    let passwordTextFiled = UITextField(
        placeholder: "Typing password",
        style: .none,
        frame: CGRect(
            x: 20,
            y: 420,
            width: 175,
            height: 21
        )
    )
    /// создание кнопки для скрытия/открытия пароля
    let securePasswordButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 332, y: 419, width: 22, height: 19))
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()

    /// создание кнопки login
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor(named: "loginButtonColor")
        button.layer.cornerRadius = 12
        button.alpha = 0.5
        button.isEnabled = false
        return button
    }()

    // MARK: - Private Properties

    /// создание имеджВью с картинкой торта
    private let titleImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 125, y: 70, width: 125, height: 125))
        imageView.image = UIImage(named: "торт")
        return imageView
    }()

    /// создание лейбла с названием приложения
    private let applicationNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 175, height: 44))
        label.text = "Birthday \nReminder"
        label.textColor = UIColor(named: "applicatinNameColor")
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    /// создание лейблов поля регистрации
    /// лейбл sign in
    private let signInLabel = UILabel(
        text: "Sign in",
        font: .boldSystemFont(ofSize: 26),
        alignment: .left,
        numberOfLines: 1,
        textColor: UIColor(
            named: "registerTextColor"
        ),
        frame: CGRect(
            x: 20,
            y: 266,
            width: 175,
            height: 31
        )
    )
    /// лейбл email
    private let emaleLabel = UILabel(
        text: "Email",
        font: .boldSystemFont(ofSize: 16),
        alignment: .left,
        numberOfLines: 1,
        textColor: UIColor(named: "registerTextColor"),
        frame: CGRect(
            x: 20,
            y: 318,
            width: 175,
            height: 19
        )
    )
    /// лейбл password
    private let passwordLabel = UILabel(
        text: "Password",
        font: .boldSystemFont(ofSize: 16),
        alignment: .left,
        numberOfLines: 1,
        textColor: UIColor(named: "registerTextColor"),
        frame: CGRect(
            x: 20,
            y: 393,
            width: 175,
            height: 19
        )
    )

    /// создание лейбла face id
    private let faceIdLabel = UILabel(
        text: "Use FaceID",
        font: .boldSystemFont(ofSize: 15),
        alignment: .center,
        numberOfLines: 1,
        textColor: .black,
        frame: CGRect(
            x: 100,
            y: 544,
            width: 150,
            height: 35
        )
    )
    /// создание свитча face id
    private let faceIdSwitch: UISwitch = {
        let idSwitch = UISwitch(frame: CGRect(x: 220, y: 544, width: 54, height: 35))
        return idSwitch
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        createLine()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setViews() {
        backgroundColor = .white
        addSubview(titleImageView)
        addSubview(applicationNameLabel)
        addSubview(signInLabel)
        addSubview(emaleLabel)
        addSubview(passwordLabel)
        addSubview(emailTextFiled)
        addSubview(passwordTextFiled)
        addSubview(securePasswordButton)
        addSubview(loginButton)
        addSubview(faceIdLabel)
        addSubview(faceIdSwitch)
        passwordTextFiled.isSecureTextEntry = true
    }

    /// Отрисовываем линии под регистрационными полями
    private func createLine() {
        var startY = 372
        for _ in 0 ... 1 {
            let line = UIView()
            line.backgroundColor = .systemGray4
            line.frame = CGRect(x: 20, y: startY, width: 335, height: 1)
            addSubview(line)
            startY += 76
        }
    }
}
