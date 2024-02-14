// SmsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран с кодом из смс
class SmsViewController: UIViewController {
    // MARK: - Visual Components

    private let descriptionSmsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 146, width: 315, height: 44))
        label.text = "Введите кодъ изъ смс, чтобы подтвердить оплату"
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    private let smsTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 61, y: 217, width: 262, height: 44))
        textField.font = .boldSystemFont(ofSize: 18)
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 196, green: 196, blue: 196, alpha: 1).cgColor
        textField.textAlignment = .center
        textField.addTarget(nil, action: #selector(textDidChange), for: .editingChanged)
        return textField
    }()

    private let sendSmsButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 109, y: 288, width: 167, height: 36))
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 249, green: 247, blue: 247, alpha: 1)
        button.setTitle("Отправить снова", for: .normal)
        button.setTitleColor(UIColor(red: 89, green: 190, blue: 190, alpha: 1), for: .normal)
        button.addTarget(nil, action: #selector(sendSmsButtonTapped), for: .touchUpInside)
        return button
    }()

    private let confirmButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 632, width: 345, height: 44))
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 89, green: 190, blue: 199, alpha: 1)
        button.setTitle("Подтвердить", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(nil, action: #selector(confirmButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(named: "Backbutton")
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "Кодъ из СМС"

        confirmButton.alpha = 0.3
        view.addSubview(descriptionSmsLabel)
        view.addSubview(smsTextField)
        view.addSubview(sendSmsButton)
        view.addSubview(confirmButton)
    }

    @objc private func textDidChange() {
        guard let smsText = smsTextField.text
        else {
            return
        }
        confirmButton.isEnabled = !smsText.isEmpty
        confirmButton.alpha = confirmButton.isEnabled ? 1.0 : 0.3
    }

    @objc private func sendSmsButtonTapped() {}

    @objc private func confirmButtonTapped() {
        let nextViewController = ThankViewController()
        nextViewController.mainNavigationController = navigationController
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: false, completion: nil)
    }
}
