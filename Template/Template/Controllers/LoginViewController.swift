// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер отвечающий за экран входа
final class LoginViewController: UIViewController {
    // MARK: - Public Properties

    /// экземпляр главной вью экрана
    private let mainView = LoginControllerView()

    // MARK: - Initializers

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonsAction()
        addTextFiledDelegate()
    }

    // MARK: - Private Methods

    /// метод добавляющий экшены кнопкам
    private func addButtonsAction() {
        mainView.securePasswordButton.addTarget(self, action: #selector(securePassword), for: .touchUpInside)
        mainView.loginButton.addTarget(self, action: #selector(goSecVC), for: .touchUpInside)
    }

    /// метод подписывает  на делегат текстфилда
    private func addTextFiledDelegate() {
        mainView.emailTextFiled.delegate = self
        mainView.passwordTextFiled.delegate = self
    }

    /// метод для логики кнопки скрыть/показать пароль
    @objc private func securePassword() {
        switch mainView.passwordTextFiled.isSecureTextEntry {
        case true:
            mainView.securePasswordButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            mainView.passwordTextFiled.isSecureTextEntry = false
        case false:
            mainView.securePasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            mainView.passwordTextFiled.isSecureTextEntry = true
        }
    }

    /// метод с переходом на следующий экран
    @objc private func goSecVC() {
        let vc = BirthdayListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

/// расширение для текстФилд делегат ( логика неактивной кнопки login пока не заполнены поля пароль и логин )
extension LoginViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let email = mainView.emailTextFiled.text ?? ""
        let password = mainView.passwordTextFiled.text ?? ""

        if email.count > 5, password.count > 5 {
            mainView.loginButton.isEnabled = true
            mainView.loginButton.alpha = 1
        } else {
            mainView.loginButton.isEnabled = false
            mainView.loginButton.alpha = 0.5
        }
        return true
    }
}
