// SmsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран с кодом из смс
final class SmsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let enterCodeText = "Введите кодъ изъ смс, чтобы подтвердить оплату"
        static let sendText = "Отправить снова"
        static let confirmText = "Подтвердить"
        static let codeText = "Кодъ из СМС"
    }

    enum Fonts {
        static let verdanaBold18 = UIFont(name: "Verdana-Bold", size: 18)
        static let verdanaBold16 = UIFont(name: "Verdana-Bold", size: 16)
        static let verdanaBold26 = UIFont(name: "Verdana-Bold", size: 26)
        static let verdanaBold12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdana16 = UIFont(name: "Verdana", size: 16)
        static let verdana14 = UIFont(name: "Verdana", size: 14)
        static let verdana12 = UIFont(name: "Verdana", size: 12)
        static let amaticSCBold25 = UIFont(name: "AmaticSC-Bold", size: 25)
        static let verdanaBoldItalic16 = UIFont(name: "Verdana-BoldItalic", size: 16)
    }

    enum Images {
        static let backButton = UIImage(named: "Backbutton")
    }

    // MARK: - Visual Components

    private let descriptionSmsLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 35, y: 146, width: 315, height: 44))
        label.text = Constants.enterCodeText
        label.font = Fonts.verdana16
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    private let smsTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 61, y: 217, width: 262, height: 44))
        textField.font = Fonts.verdanaBold18
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
        button.setTitle(Constants.sendText, for: .normal)
        button.setTitleColor(UIColor(red: 89, green: 190, blue: 190, alpha: 1), for: .normal)
        button.addTarget(nil, action: #selector(sendSmsButtonTapped), for: .touchUpInside)
        return button
    }()

    private let confirmButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 632, width: 345, height: 44))
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 89, green: 190, blue: 199, alpha: 1)
        button.setTitle(Constants.confirmText, for: .normal)
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

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.image = Images.backButton
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = Constants.codeText

        confirmButton.alpha = 0.3
        [
            descriptionSmsLabel,
            smsTextField,
            sendSmsButton,
            confirmButton,
        ].forEach { view.addSubview($0) }
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
