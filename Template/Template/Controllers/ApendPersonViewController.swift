// ApendPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// контроллер экрана с добавлением нового персонажа
final class ApendPersonViewController: UIViewController {
    // MARK: - Public Properties

    /// делегат для передачи данных с этого экрана на предыдущий
    weak var delegate: PersonInfoDelegate?

    // MARK: - Private Properties

    /// экземпляр главного вью экрана
    private let mainView = AppendPersonControllerView()
    /// пикеры ( названы понятно )
    private let agePicker = UIPickerView()
    private let genderPicker = UIPickerView()
    private let dataPicker = UIDatePicker()
    /// массив возможных гендеров
    private let genders = ["Male", "Female"]
    private var name = ""
    private var age = Int()
    private var birthdayDate = ""
    private var avatarImageName = "дефолтАва"

    // MARK: - Initializers

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setPicker()
        setTextFiledDelegate()
        setButtonAction()
    }

    // MARK: - Private Methods

    /// функция с настройкой пикеров
    private func setPicker() {
        dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.datePickerMode = .date
        agePicker.delegate = self
        agePicker.dataSource = self
        genderPicker.delegate = self
        genderPicker.dataSource = self
    }

    /// метод в котором подписываю текстфилды на делегат
    private func setTextFiledDelegate() {
        mainView.ageTextFiled.delegate = self
        mainView.genderTextFiled.delegate = self
        mainView.birthdayTextFiled.delegate = self
        mainView.telegramTextFiled.delegate = self
    }

    /// метод с добавлением действий по нажатию на кнопку
    private func setButtonAction() {
        mainView.addButton.addTarget(self, action: #selector(addPerson), for: .touchUpInside)
        mainView.cancelButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }

    /// метод с созданием тулбара (универсальный +-)
    private func setToolBar(title: String, textFiled: UITextField, action: Selector) {
        let toolBar = UIToolbar()
        let barButton = UIBarButtonItem(title: title, style: .done, target: self, action: action)
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([space, barButton], animated: true)
        toolBar.sizeToFit()
        textFiled.inputAccessoryView = toolBar
    }

    /// метод создает алерт в который можно вписать телеграмм
    private func createTelegramAlert() {
        let alert = UIAlertController(
            title: "Please enter Telegram",
            message: nil,
            preferredStyle: .alert
        )
        alert.addTextField { textFiled in
            textFiled.placeholder = "Typing Telegram"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default
        ) { [weak self] _ in
            guard let text = alert.textFields?.first?.text else { return }
            self?.mainView.telegramTextFiled.text = text
        }
        alert.addAction(okAction)
        alert.preferredAction = okAction
        present(alert, animated: true, completion: nil)
    }

    /// метод убирает выбор с текущего текстфилда
    @objc private func resign() {
        mainView.ageTextFiled.resignFirstResponder()
        mainView.genderTextFiled.resignFirstResponder()
    }

    /// метод сохраняет  и форматирует дату из пикера в текстФилд с датой
    @objc private func safeDate() {
        let dateFormater = DateFormatter()
        let secondDateFormater = DateFormatter()
        secondDateFormater.dateFormat = "dd.MM"
        dateFormater.dateFormat = "dd.MM.YYYY"
        mainView.birthdayTextFiled.text = dateFormater.string(from: dataPicker.date)
        birthdayDate = secondDateFormater.string(from: dataPicker.date)
        mainView.birthdayTextFiled.resignFirstResponder()
    }

    /// метод передает данные на предыдущий экран и закрывает экран
    @objc private func addPerson() {
        name = mainView.nameTextFiled.text ?? ""
        age = Int(mainView.ageTextFiled.text ?? "0") ?? 0
        let person = Person(
            fullName: name,
            birthday: birthdayDate,
            futureAge: age + 1,
            avatarImage: avatarImageName,
            dayTillBirthday: Int.random(in: 1 ... 365)
        )
        delegate?.person(person)
        dismiss(animated: true, completion: nil)
    }

    /// метод закрывающий экрывающий экран
    @objc private func back() {
        dismiss(animated: true)
    }
}

/// подписываю контроллер на текстфилд делегат
extension ApendPersonViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case mainView.ageTextFiled:
            mainView.ageTextFiled.inputView = agePicker
            setToolBar(title: "OK", textFiled: mainView.ageTextFiled, action: #selector(resign))
        case mainView.genderTextFiled:
            mainView.genderTextFiled.inputView = genderPicker
            setToolBar(title: "OK", textFiled: mainView.genderTextFiled, action: #selector(resign))
        case mainView.birthdayTextFiled:
            mainView.birthdayTextFiled.inputView = dataPicker
            setToolBar(title: "Done", textFiled: mainView.birthdayTextFiled, action: #selector(safeDate))
        case mainView.telegramTextFiled:
            createTelegramAlert()
        default: break
        }
    }
}

/// подписываю контроллер на пикер датасорс
extension ApendPersonViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case agePicker:
            return 100
        case genderPicker:
            return genders.count
        default: return 1
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case agePicker:
            mainView.ageTextFiled.text = "\(row)"
        case genderPicker:
            mainView.genderTextFiled.text = genders[row]
        default: break
        }
    }
}

/// подписываю контроллер на пикер делегат
extension ApendPersonViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case agePicker:
            return "\(row)"
        case genderPicker:
            return genders[row]
        default: return ""
        }
    }
}
