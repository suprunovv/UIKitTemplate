// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: Вью контроллер

/// контроллер страницы входа
final class LoginViewController: UIViewController {
    // MARK: - Публичные свойства

    @IBOutlet private var eyeButton: UIButton!
    @IBOutlet private var emailTextFiled: UITextField!
    @IBOutlet private var registerButton: UIButton!
    @IBOutlet private var passwordTextFiled: UITextField!

    // MARK: - Инициализаторы

    override func viewDidLoad() {
        super.viewDidLoad()
        setSetngs()
    }

    // MARK: - Приватные методы

    private func setSetngs() {
        emailTextFiled.delegate = self
        passwordTextFiled.delegate = self
    }

    private func createAlert(title: String?, message: String?) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @IBAction private func entranceButton(_ sender: UIButton) {
        guard let email = emailTextFiled.text,
              let password = passwordTextFiled.text else { return }

        if email.count < 5 || !email.contains("@") || !email.contains(".") {
            createAlert(
                title: "Ошибка",
                message: "введите корректный email"
            )
        } else if password.count < 6 {
            createAlert(
                title: "Ошибка",
                message: "пароль должен быть минимум 6 символов"
            )
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyboard.instantiateViewController(
                withIdentifier: "orderVC"
            )
            RegisterModel.shared.updateValue(password: password, email: email)
            navigationController?.pushViewController(secondVC, animated: true)
        }
    }

    @IBAction private func securePassword(_ sender: UIButton) {
        switch passwordTextFiled.isSecureTextEntry {
        case true:
            eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            passwordTextFiled.isSecureTextEntry = false
        case false:
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            passwordTextFiled.isSecureTextEntry = true
        }
    }
}

// MARK: - extension

/// Расширение добавляет textfiledDelegate

extension LoginViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let password = passwordTextFiled.text ?? ""
        let email = passwordTextFiled.text ?? ""
        if password.count > 1, email.count > 1 {
            registerButton.alpha = 1
            registerButton.isUserInteractionEnabled = true
        } else {
            registerButton.alpha = 0.5
            registerButton.isUserInteractionEnabled = false
        }
        return true
    }
}
