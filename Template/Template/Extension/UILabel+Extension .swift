// UILabel+Extension .swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение лейбла с удобным инициализатором
extension UILabel {
    convenience init(
        text: String,
        font: UIFont?,
        textColor: UIColor
    ) {
        self.init()
        self.text = text
        self.font = font ?? .systemFont(ofSize: 16)
        self.textColor = textColor
    }
}
