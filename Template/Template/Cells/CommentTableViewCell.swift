// CommentTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка с кнопкой подписаться
final class CommentTableViewCell: UITableViewCell {
    // MARK: - Statik let

    static let reuseID = "CommentTableViewCell"

    // MARK: - Visual Content

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()

    private let actionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = Fonts.verdana12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let likedImageImageView = UIImageView()

    // MARK: - Public methods

    func setCell(comment: Comment) {
        setConstraints()
        selectionStyle = .none
        heightAnchor.constraint(equalToConstant: 56).isActive = true
        avatarImageView.image = UIImage(named: comment.avatarImageName)
//        actionLabel.text = "\(comment.nikname) \(comment.action.rawValue)  \(comment.comment) \(comment.time)"
        actionLabel.attributedText = getAtributedText(
            nik: comment.nikname,
            action: comment.action.rawValue,
            comment: comment.comment,
            time: comment.time
        )
        likedImageImageView.image = UIImage(named: comment.postImageName)
    }

    // MARK: - Private methods

    private func getAtributedText(
        nik: String,
        action: String,
        comment: String,
        time: String
    ) -> NSAttributedString {
        let fullText = "\(nik) \(action) \(comment) \(time)"

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

        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.gray,
            range: (fullText as NSString).range(of: time)
        )
        return attributedString
    }

    private func setConstraints() {
        addSubview(avatarImageView)
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -323).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        addSubview(actionLabel)
        actionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 59).isActive = true
        actionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -76).isActive = true
        actionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        actionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        addSubview(likedImageImageView)
        likedImageImageView.translatesAutoresizingMaskIntoConstraints = false
        likedImageImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 323).isActive = true
        likedImageImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        likedImageImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        likedImageImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
}
