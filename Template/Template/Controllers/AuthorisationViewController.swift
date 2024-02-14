// AuthorisationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран регистрации
final class AuthorisationViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let authorisationText = "Авторизация"
        static let loginText = "Логин"
        static let passwordText = "Пароль"
        static let loginPlaceholder = "Введите логин"
        static let passwordPlaceholder = "Введите пароль"
        static let loginButtonText = "Войти"
        static let verdanaBold16 = UIFont(name: "Verdana-Bold", size: 16)
        static let verdanaBold26 = UIFont(name: "Verdana-Bold", size: 26)
        static let verdana14 = UIFont(name: "Verdana", size: 14)
        static let logoCoffe = UIImage(named: "LogoCoffe")
        static let LoginInvisible = UIImage(named: "LoginInvisible")
        static let LoginVisible = UIImage(named: "LoginVisible")
    }
    // MARK: - Visual Components

    private let authorisationView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 375, height: 812))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 103, width: 175, height: 50))
        imageView.image = Constants.logoCoffe
        return imageView
    }()

    private let passwordVisibleButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 332, y: 433, width: 22, height: 19))
        button.alpha = 1
        button.setTitle("", for: .normal)
        button.titleLabel?.font = Constants.verdanaBold16
        button.addTarget(nil, action: #selector(passwordVisibleButtonTouched), for: .touchUpInside)
        return button
    }()

    private let signLabel: UILabel = {
        let signLabel = UILabel(frame: CGRect(x: 20, y: 280, width: 195, height: 31))
        signLabel.text = Constants.authorisationText
        signLabel.font = Constants.verdanaBold26
        return signLabel
    }()

    private let loginLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 332, width: 175, height: 19))
        label.text = Constants.loginText
        label.font = Constants.verdanaBold16
        return label
    }()

    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel(frame: CGRect(x: 20, y: 407, width: 175, height: 19))
        passwordLabel.text = Constants.passwordText
        passwordLabel.font = Constants.verdanaBold16
        return passwordLabel
    }()

    private let loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 361, width: 175, height: 17))
        textField.placeholder = Constants.loginPlaceholder
        textField.font = Constants.verdana14
        textField.addTarget(nil, action: #selector(textDidChange(_:)), for: .editingChanged)
        return textField
    }()

    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: CGRect(x: 20, y: 436, width: 175, height: 17))
        passwordTextField.placeholder = Constants.passwordPlaceholder
        passwordTextField.font = Constants.verdana14
        passwordTextField.addTarget(nil, action: #selector(textDidChange(_:)), for: .editingChanged)
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()

    private let dividerLoginView: UIView = {
        let dividerView = UIView(frame: CGRect(x: 20, y: 386, width: 335, height: 1))
        dividerView.backgroundColor = .lightGray
        return dividerView
    }()

    private let dividerPasswordView: UIView = {
        let dividerView = UIView(frame: CGRect(x: 20, y: 462, width: 335, height: 1))
        dividerView.backgroundColor = .lightGray
        return dividerView
    }()

    private let loginButton: UIButton = {
        let loginButton = UIButton(frame: CGRect(x: 20, y: 664, width: 335, height: 44))
        loginButton.layer.cornerRadius = 12
        loginButton.backgroundColor = UIColor(red: 89, green: 190, blue: 199, alpha: 1)
        loginButton.setTitle(Constants.loginButtonText, for: .normal)
        loginButton.titleLabel?.font = Constants.verdanaBold16
        loginButton.addTarget(nil, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.isEnabled = false
        return loginButton
    }()

    // MARK: - Private Properties

    private var isVisiblePassword = false

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = UIColor(red: 120, green: 84, blue: 49, alpha: 1.0)
        view.backgroundColor = UIColor(named: "appCoffe")

        loginButton.alpha = 0.3
        [
            authorisationView,
            logoImageView,
            signLabel,
            loginLabel,
            passwordLabel,
            loginTextField,
            passwordTextField,
            dividerLoginView,
            dividerPasswordView,
            loginButton,
            passwordVisibleButton,
        ].forEach { view.addSubview($0) }
        passwordVisibleButton.setImage(Constants.LoginInvisible, for: .normal)
    }

    @objc private func textDidChange(_ textField: UITextField) {
        guard let loginText = loginTextField.text,
              let passwordText = passwordTextField.text
        else { return }
        loginButton.isEnabled = !loginText.isEmpty && !passwordText.isEmpty
        loginButton.alpha = loginButton.isEnabled ? 1.0 : 0.3
    }

    @objc private func loginButtonTapped() {
        let catalogViewController = CatalogViewController()
        let navigationController = UINavigationController(rootViewController: catalogViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: false, completion: nil)
    }

    @objc private func passwordVisibleButtonTouched() {
        let image = isVisiblePassword ? Constants.LoginInvisible : Constants.LoginVisible
        passwordVisibleButton.setImage(image, for: .normal)
        passwordTextField.isSecureTextEntry = isVisiblePassword
        isVisiblePassword.toggle()
    }
}
