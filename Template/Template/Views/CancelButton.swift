// CancelButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// кнопка выход с крестиком

final class CancelButton: UIButton {
    // MARK: - Initializators

    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(systemName: "xmark"), for: .normal)
        tintColor = .black
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
