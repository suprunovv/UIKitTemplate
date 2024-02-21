// HistoryTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с ячейками историй
final class HistoryTableViewCell: UITableViewCell {
    // MARK: - private property

    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Public methods

    func configure(with historys: [HistoryView]) {
        setConstraints()
        contentView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        selectionStyle = .none
        var startLeading: CGFloat = 0
        for (index, history) in historys.enumerated() {
            if index == 0 {
                history.isMyStory()
            }
            mainScrollView.addSubview(history)
            history.leadingAnchor.constraint(
                equalTo: mainScrollView.leadingAnchor, constant: startLeading
            ).isActive = true
            history.topAnchor.constraint(equalTo: topAnchor).isActive = true
            history.widthAnchor.constraint(equalToConstant: 84).isActive = true
            history.heightAnchor.constraint(equalToConstant: 75).isActive = true
            startLeading += 85
        }
        mainScrollView.contentSize.width = startLeading
    }

    // MARK: - Private methods

    private func setConstraints() {
        contentView.addSubview(mainScrollView)
        mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
