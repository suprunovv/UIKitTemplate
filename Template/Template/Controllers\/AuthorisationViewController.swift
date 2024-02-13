// AuthorisationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран регистрации
class AuthorisationViewController: UIViewController {
    // MARK: - Visual Components

    private let authorisationView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 812))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 103, width: 175, height: 50))
        imageView.image = UIImage(named: "LogoCoffe")
        return imageView
    }()

    private let passwordVisibleButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 332, y: 433, width: 22, height: 19))
        button.alpha = 0
        button.setTitle("", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(nil, action: #selector(passwordVisibleButtonTouched), for: .touchUpInside)
        return button
    }()

    private let signLabel: UILabel = {
        let signLabel = UILabel(frame: CGRect(x: 20, y: 280, width: 195, height: 31))
        signLabel.text = "Авторизация"
        signLabel.font = .boldSystemFont(ofSize: 26)
        return signLabel
    }()

    private let loginLabel: UILabel = {
        let emailLabel = UILabel(frame: CGRect(x: 20, y: 332, width: 175, height: 19))
        emailLabel.text = "Логин"
        emailLabel.font = .boldSystemFont(ofSize: 16)
        return emailLabel
    }()

    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel(frame: CGRect(x: 20, y: 407, width: 175, height: 19))
        passwordLabel.text = "Пароль"
        passwordLabel.font = .boldSystemFont(ofSize: 16)
        return passwordLabel
    }()

    private let loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 361, width: 175, height: 17))
        textField.placeholder = "Введите логин"
        textField.font = .systemFont(ofSize: 14)
        textField.addTarget(nil, action: #selector(textDidChange(_:)), for: .editingChanged)
        return textField
    }()

    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: CGRect(x: 20, y: 436, width: 175, height: 17))
        passwordTextField.placeholder = "Введите пароль"
        passwordTextField.font = .systemFont(ofSize: 14)
        passwordTextField.addTarget(nil, action: #selector(textDidChange(_:)), for: .editingChanged)
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()

    private let lineloginView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 386, width: 335, height: 1))
        lineView.backgroundColor = .lightGray
        return lineView
    }()

    private let linePasswordView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 462, width: 335, height: 1))
        lineView.backgroundColor = .lightGray
        return lineView
    }()

    private let loginButton: UIButton = {
        let loginButton = UIButton(frame: CGRect(x: 20, y: 664, width: 335, height: 44))
        loginButton.layer.cornerRadius = 12
        loginButton.backgroundColor = UIColor(red: 89, green: 190, blue: 199, alpha: 1)
        loginButton.setTitle("Войти", for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        loginButton.addTarget(nil, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.isEnabled = false
        return loginButton
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    private var isVisiblePassword = false

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = UIColor(red: 120, green: 84, blue: 49, alpha: 1.0)
        view.backgroundColor = UIColor(named: "AppCoffe")
            
        passwordVisibleButton.setImage(UIImage(named: "LoginInvisible"), for: .normal)
        loginButton.alpha = 0.3
        [
            authorisationView,
            logoImageView,
            signLabel,
            loginLabel,
            passwordLabel,
            loginTextField,
            passwordTextField,
            lineloginView,
            linePasswordView,
            loginButton,
            passwordVisibleButton,
        ].forEach { view.addSubview($0) }
    }

    @objc private func textDidChange(_ textField: UITextField) {
        guard let loginText = loginTextField.text,
              let passwordText = passwordTextField.text
        else {
            return
        }
        loginButton.isEnabled = !loginText.isEmpty && !passwordText.isEmpty
        loginButton.alpha = loginButton.isEnabled ? 1.0 : 0.3
    }

    @objc func loginButtonTapped() {
        let nextViewController = CatalogViewController()
        let navigationController = UINavigationController(rootViewController: nextViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: false, completion: nil)
    }

    @objc func passwordVisibleButtonTouched() {
        if isVisiblePassword {
            passwordVisibleButton.setImage(UIImage(named: "LoginInvisible"), for: .normal)
            isVisiblePassword = false
            passwordTextField.isSecureTextEntry = true
        } else {
            passwordVisibleButton.setImage(UIImage(named: "LoginVisible"), for: .normal)
            isVisiblePassword = true
            passwordTextField.isSecureTextEntry = false
        }
    }
}
