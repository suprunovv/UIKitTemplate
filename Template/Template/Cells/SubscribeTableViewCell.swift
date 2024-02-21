// SubscribeTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка с кнопкой подписаться
final class SubscribeTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let subscribeTitle = "Подписаться"
        static let postSubscribeTitle = "Вы подписаны"
        static let subscribeButtonColor = UIColor(
            red: 0 / 255,
            green: 122 / 255,
            blue: 255 / 255,
            alpha: 1
        )
    }

    // MARK: - Static let

    static let reuseID = "SubscribeTableViewCell"

    // MARK: - Visual content

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    private let actionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.adjustsFontSizeToFitWidth = true
        label.font = Fonts.verdana12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscribeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.subscribeTitle, for: .normal)
        button.backgroundColor = Constants.subscribeButtonColor
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.titleLabel?.font = Fonts.verdanaBold10
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private property

    private var isSubscribe = false

    // MARK: - Public methods

    func setCell(comment: Comment) {
        selectionStyle = .none
        setConstraints()
        avatarImageView.image = UIImage(named: comment.avatarImageName)
        actionLabel.attributedText = getAtributedText(
            nik: comment.nikname,
            comment: comment.action.rawValue
        )
    }

    // MARK: - Private methods

    private func getAtributedText(
        nik: String,
        comment: String
    ) -> NSAttributedString {
        let fullText = "\(nik) \(comment)"

        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.black,
            range: (fullText as NSString).range(of: nik)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.boldSystemFont(ofSize: 12),
            range: (fullText as NSString).range(of: nik)
        )
        return attributedString
    }

    private func setConstraints() {
        contentView.heightAnchor.constraint(equalToConstant: 71).isActive = true
        addSubview(avatarImageView)
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -323).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -23).isActive = true
        addSubview(actionLabel)
        actionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 61).isActive = true
        actionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -160).isActive = true
        actionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        actionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        contentView.addSubview(subscribeButton)
        subscribeButton.addTarget(self, action: #selector(subscribe), for: .touchUpInside)
        subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 223).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        subscribeButton.topAnchor.constraint(equalTo: topAnchor, constant: 21).isActive = true
        subscribeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }

    @objc private func subscribe() {
        if isSubscribe {
            subscribeButton.setTitle(Constants.postSubscribeTitle, for: .normal)
            subscribeButton.tintColor = .gray
            subscribeButton.backgroundColor = .clear
            subscribeButton.layer.borderWidth = 2
            isSubscribe.toggle()
        } else {
            subscribeButton.setTitle(Constants.subscribeTitle, for: .normal)
            subscribeButton.tintColor = .white
            subscribeButton.backgroundColor = Constants.subscribeButtonColor
            subscribeButton.layer.borderWidth = 0
            isSubscribe.toggle()
        }
    }
}
