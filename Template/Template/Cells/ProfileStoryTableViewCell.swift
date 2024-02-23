// ProfileStoryTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с историями
final class ProfileStoryTableViewCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = "ProfileStoryTableViewCell"

    private let mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.isScrollEnabled = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    // MARK: - Initializators

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubviews()
        setMainScrollViewConstraint()
        contentView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        selectionStyle = .none
    }

    // MARK: - Public Methods

    func configureCell(storys: [ProfileStoryView], delegate: ProfileStoryDelegate) {
        var startLeadingConstant: CGFloat = 15
        for storyView in storys {
            storyView.delegate = delegate
            mainScrollView.addSubview(storyView)
            storyView.heightAnchor.constraint(equalToConstant: 71).isActive = true
            storyView.widthAnchor.constraint(equalToConstant: 55).isActive = true
            storyView.leadingAnchor.constraint(
                equalTo: mainScrollView.leadingAnchor,
                constant: startLeadingConstant
            ).isActive = true
            storyView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
            startLeadingConstant += 71
        }
        mainScrollView.contentSize.width = startLeadingConstant
    }

    // MARK: - Private methods

    private func addSubviews() {
        contentView.addSubview(mainScrollView)
    }

    private func setMainScrollViewConstraint() {
        mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
