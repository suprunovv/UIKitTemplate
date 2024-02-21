// RecommendationsTabelCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка рекомендуемых профилей
final class RecommendationsTabelCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let backgroundColor = UIColor(red: 210 / 255, green: 223 / 255, blue: 238 / 255, alpha: 1)
        static let recommendationText = "Рекомендуем вам"
        static let moreButtonText = "Все"
    }

    // MARK: - Visual Content

    private let recommendationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recommendationText
        label.font = UIFont.verdanaBold10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.moreButtonText, for: .normal)
        button.titleLabel?.font = UIFont.verdanaBold10
        button.contentHorizontalAlignment = .right
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializators

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = Constants.backgroundColor
        contentView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        addSubviews()
        setMainScrollViewConstraints()
        setLabelConstraints()
        setMoreButtonConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public methods

    func setRecommendation(profiles: [RecommendationProfileView]) {
        guard !profiles.isEmpty else { return }
        var startLeading: CGFloat = 17
        for profile in profiles {
            mainScrollView.addSubview(profile)
            profile.leadingAnchor.constraint(
                equalTo: mainScrollView.leadingAnchor,
                constant: startLeading
            ).isActive = true
            profile.heightAnchor.constraint(equalToConstant: 200).isActive = true
            profile.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
            profile.widthAnchor.constraint(equalToConstant: 185).isActive = true
            startLeading += 205
        }
        mainScrollView.contentSize.width = startLeading
    }

    // MARK: - Private methods

    private func addSubviews() {
        contentView.addSubview(mainScrollView)
        addSubview(recommendationLabel)
        addSubview(moreButton)
    }

    private func setMainScrollViewConstraints() {
        mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
    }

    private func setLabelConstraints() {
        recommendationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        recommendationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -256).isActive = true
        recommendationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        recommendationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -246).isActive = true
    }

    private func setMoreButtonConstraints() {
        moreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 258).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        moreButton.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        moreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -246).isActive = true
    }
}
