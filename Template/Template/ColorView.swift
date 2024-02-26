// ColorView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для светофора c закруглением
final class ColorView: UIView {
    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 2
    }
}
