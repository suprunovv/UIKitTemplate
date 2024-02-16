// FootSizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// контроллер с выбором размера
final class FootSizeViewController: UIViewController {
    // MARK: - Constants

    enum Constnts {
        static let sizes = [36, 37, 38, 39]
        static let saveButtonText = "Сохранить"
    }

    // MARK: - Visual Components

    private let pickerFoodSize = UIPickerView()
    private let bottomView = UIView()
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle(Constnts.saveButtonText, for: .normal)
        button.titleLabel?.font = Fonts.verdanaBold16
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.5
        button.addTarget(self, action: #selector(transferSize), for: .touchUpInside)
        return button
    }()

    // MARK: - Public Properties

    weak var delegate: SizeDelegate?

    // MARK: - Private Properties

    private var footSize = Int()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupView()
        setupPicker()
        setupSaveButton()
    }

    // MARK: - Private Methods

    private func setupSaveButton() {
        bottomView.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 61).isActive = true
        saveButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -61).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -31).isActive = true
        saveButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 208).isActive = true
    }

    private func setupPicker() {
        pickerFoodSize.dataSource = self
        pickerFoodSize.delegate = self
        bottomView.addSubview(pickerFoodSize)
        pickerFoodSize.translatesAutoresizingMaskIntoConstraints = false
        pickerFoodSize.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 11).isActive = true
        pickerFoodSize.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -11).isActive = true
        pickerFoodSize.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -120).isActive = true
        pickerFoodSize.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 75).isActive = true
    }

    private func setupView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .white
        bottomView.layer.cornerRadius = 20
        bottomView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 1).isActive = true
        bottomView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -17).isActive = true
        bottomView.topAnchor.constraint(equalTo: view.topAnchor, constant: 512).isActive = true
        bottomView.layer.shadowColor = UIColor.black.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 1)
        bottomView.layer.shadowRadius = 400
        bottomView.layer.shadowOpacity = 100
    }

    @objc func transferSize() {
        delegate?.transfer(size: footSize)
        dismiss(animated: true)
    }
}

/// подписался на делегат и датасорс пикера
extension FootSizeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(Constnts.sizes[row])"
    }
}

extension FootSizeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Constnts.sizes.count
    }

    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        footSize = Constnts.sizes[row]
    }
}
