// extensionTextFiled.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение текстФилда с удобными инициализаторами
extension UITextField {
    convenience init(placeholder: String, style: BorderStyle, frame: CGRect) {
        self.init(frame: frame)
        self.placeholder = placeholder
        borderStyle = style
    }
}
