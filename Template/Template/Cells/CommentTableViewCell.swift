// CommentTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с кнопкой подписаться
final class CommentTableViewCell: UITableViewCell {
    // MARK: - Types Properties

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
        label.font = UIFont.verdana12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let likedImageImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        selectionStyle = .none
        heightAnchor.constraint(equalToConstant: 56).isActive = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public methods

    func configureCell(comment: Comment) {
        avatarImageView.image = UIImage(named: comment.avatarImageName)
        actionLabel.attributedText = getAtributedText(
            nikname: comment.nikname,
            action: comment.action.rawValue,
            comment: comment.comment,
            time: comment.time
        )
        likedImageImageView.image = UIImage(named: comment.postImageName)
    }

    // MARK: - Private methods

    private func getAtributedText(
        nikname: String,
        action: String,
        comment: String,
        time: String
    ) -> NSAttributedString {
        let fullText = "\(nikname) \(action) \(comment) \(time)"

        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.black,
            range: (fullText as NSString).range(of: nikname)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.boldSystemFont(ofSize: 12),
            range: (fullText as NSString).range(of: nikname)
        )

        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.gray,
            range: (fullText as NSString).range(of: time)
        )
        return attributedString
    }

    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(actionLabel)
        addSubview(likedImageImageView)
    }

    private func setConstraints() {
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -323).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        actionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 59).isActive = true
        actionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -76).isActive = true
        actionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        actionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        likedImageImageView.translatesAutoresizingMaskIntoConstraints = false
        likedImageImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 323).isActive = true
        likedImageImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        likedImageImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        likedImageImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
}
