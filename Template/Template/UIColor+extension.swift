// UIColor+extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение UIColor, инициация своего цвета RGB
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        let alphaValue = alpha
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
}
