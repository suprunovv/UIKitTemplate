// PersonDataViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol SizeDelegate: AnyObject {
    func transfer(size: Int)
}

/// контроллер с данными человека
final class PersonDataViewController: UIViewController {
    // MARK: - Constants

    /// перечисление с плейсхолдерами
    enum Constants {
        static let nameText = "Имя"
        static let lastnameText = "Фамилия"
        static let phoneText = "Номер телефона"
        static let sizeText = "Размер ноги"
        static let birthdayText = "Дата рождения"
        static let mailText = "Почта"
        static let startTopAnchor = 113
        static let textFiledSpace = 54
        static let maxNumberCount = 18
        static let saveButtonColor = UIColor(red: 225.0 / 255.0, green: 24.0 / 255.0, blue: 131.0 / 255.0, alpha: 1)
        static let backImage = UIImage(systemName: "chevron.left")
    }

    // MARK: - Visual Components

    private let nameTextFiled = PersonDataTextFiled(placeholder: Constants.nameText)
    private let lastnameTextFiled = PersonDataTextFiled(placeholder: Constants.lastnameText)
    private let phoneTextFiled = PersonDataTextFiled(placeholder: Constants.phoneText)
    private let footSizeFiled = PersonDataTextFiled(placeholder: Constants.sizeText)
    private let birthdayTextFiled = PersonDataTextFiled(placeholder: Constants.birthdayText)
    private let mailTextFiled = PersonDataTextFiled(placeholder: Constants.mailText)
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.titleLabel?.font = Fonts.verdanaBold16
        button.tintColor = .white
        button.backgroundColor = Constants.saveButtonColor
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.5
        button.isHidden = true
        return button
    }()

    private let datePicker = UIDatePicker()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFileds()
        setView()
        setSaveButton()
        setBackButtonItem()
    }

    // MARK: - Private Methods

    private func setBackButtonItem() {
        let backButton = UIBarButtonItem(
            image: Constants.backImage,
            style: .done,
            target: self,
            action: #selector(goBack)
        )
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    private func setView() {
        view.backgroundColor = .white
        title = "Мои данные"
    }

    private func regularExpression() -> NSRegularExpression {
        var reg = NSRegularExpression()
        do {
            reg = try NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
        } catch {
            print("Error")
        }
        return reg
    }

    private func setSaveButton() {
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114).isActive = true
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 654).isActive = true
    }

    private func setTextFileds() {
        let textFileds = [
            nameTextFiled,
            lastnameTextFiled,
            phoneTextFiled,
            footSizeFiled,
            birthdayTextFiled,
            mailTextFiled
        ]
        var startY = Constants.startTopAnchor
        for textFiled in textFileds {
            view.addSubview(textFiled)
            textFiled.delegate = self
            textFiled.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            textFiled.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
            textFiled.heightAnchor.constraint(equalToConstant: 44).isActive = true
            textFiled.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(startY)).isActive = true
            startY += Constants.textFiledSpace
        }
    }

    private func goToSizeViewController() {
        footSizeFiled.resignFirstResponder()
        let sizeViewController = FootSizeViewController()
        sizeViewController.delegate = self
        sizeViewController.modalPresentationStyle = .overFullScreen
        sizeViewController.modalTransitionStyle = .crossDissolve
        present(sizeViewController, animated: true, completion: nil)
    }

    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regularExpression().stringByReplacingMatches(
            in: phoneNumber, options: [], range: range, withTemplate: ""
        )
        if number.count > Constants.maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: Constants.maxNumberCount)
            number = String(number[number.startIndex ..< maxIndex])
        }
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex ..< maxIndex])
        }
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex ..< maxIndex
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3",
                options: .regularExpression,
                range: regRange
            )
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3-$4-$5",
                options: .regularExpression,
                range: regRange
            )
        }
        return "+ \(number)"
    }

    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension PersonDataViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        var text = ""
        text += string
        if !text.isEmpty {
            saveButton.isHidden = false
        } else {
            saveButton.isHidden = true
        }
        switch textField {
        case phoneTextFiled:
            let fullText = (phoneTextFiled.text ?? "") + string
            textField.text = format(phoneNumber: fullText, shouldRemoveLastDigit: range.length == 1)
            if phoneTextFiled.text?.count ?? 1 > Constants.maxNumberCount {
                phoneTextFiled.resignFirstResponder()
                goToSizeViewController()
            }
            return false
        default: return true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextFiled:
            lastnameTextFiled.becomeFirstResponder()
        case lastnameTextFiled:
            phoneTextFiled.becomeFirstResponder()
        case phoneTextFiled:
            phoneTextFiled.resignFirstResponder()
        case mailTextFiled:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case birthdayTextFiled:
            birthdayTextFiled.inputView = datePicker
            datePicker.preferredDatePickerStyle = .inline
            datePicker.datePickerMode = .date
        case footSizeFiled:
            footSizeFiled.resignFirstResponder()
        case phoneTextFiled:
            phoneTextFiled.keyboardType = .numberPad
        default: break
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case birthdayTextFiled:
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "dd.MM.YYYY"
            textField.text = dateFormater.string(from: datePicker.date)
        case phoneTextFiled:
            footSizeFiled.resignFirstResponder()
            phoneTextFiled.resignFirstResponder()
            goToSizeViewController()
        default: break
        }
    }
}

extension PersonDataViewController: SizeDelegate {
    /// метод принимает размер и вставляет его в текстфилд
    func transfer(size: Int) {
        footSizeFiled.text = "\(size)"
        birthdayTextFiled.becomeFirstResponder()
    }
}
