// extensionUILabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение лейбла, с удобными инициализаторами
extension UILabel {
    convenience init(
        text: String,
        font: UIFont,
        alignment: NSTextAlignment,
        numberOfLines: Int,
        textColor: UIColor?,
        frame: CGRect
    ) {
        self.init(frame: frame)
        self.text = text
        self.font = font
        self.textColor = textColor ?? .black
        textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
