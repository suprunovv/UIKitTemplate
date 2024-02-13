// Extension_UILabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение лейла с окрашиванием части строки
extension UILabel {
    convenience init(
        text: String,
        color: UIColor,
        aligment: NSTextAlignment,
        font: UIFont,
        lines: Int,
        frame: CGRect
    ) {
        self.init(frame: frame)
        self.text = text
        textColor = color
        self.font = font
        textAlignment = aligment
        numberOfLines = lines

        /// задаю цвет отдельным частям текста в лейбле
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: "+ 50 руб")
        let range2 = (text as NSString).range(of: "+ 70 руб")
        let range3 = (text as NSString).range(of: "+ 20 руб")
        attributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.systemGreen,
            range: range
        )
        attributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.systemGreen,
            range: range2
        )
        attributedString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.systemGreen,
            range: range3
        )
        attributedText = attributedString
    }
}
