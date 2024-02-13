// CancelButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// кнопка выход с крестиком
class CancelButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(systemName: "xmark"), for: .normal)
        tintColor = .black
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
