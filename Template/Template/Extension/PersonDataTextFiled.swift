// PersonDataTextFiled.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Текстфилд для экрана с данными пользователя
class PersonDataTextFiled: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray6
        layer.cornerRadius = 12
        font = Fonts.verdana16
        let spaseView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 0))
        leftView = spaseView
        leftViewMode = .always
    }
}
