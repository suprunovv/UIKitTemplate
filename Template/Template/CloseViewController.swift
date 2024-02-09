// CloseViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Последний вью контроллер с спасибо
class CloseViewController: UIViewController {
    // MARK: - Публичные свойства

    weak var delegate: BackProtocol?

    // MARK: - Приваные свойства

    @IBOutlet private var titleLabel: UILabel!

    // MARK: - Инициализаторы

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleLabel()
    }

    // MARK: - Приватные методы

    private func setTitleLabel() {
        titleLabel.text = "Электронный чек отправили Вам на почту \(RegisterModel.shared.email)"
    }

    @IBAction private func closeVC(_ sender: UIButton) {
        delegate?.goBack()
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func closeVCTwo(_ sender: UIButton) {
        delegate?.goBack()
        dismiss(animated: true, completion: nil)
    }
}
