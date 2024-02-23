// ProfileTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol LinkDelegate: AnyObject {
    /// метод для открытия вебВью по нажатию на лейбл
    func openWebView()
}

/// Ячейка с данными профиля
final class ProfileTableViewCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = "ProfileTableViewCell"

    enum Constants {
        static let publicationText = "публикации"
        static let subscribersText = "подписчики"
        static let subscriptionText = "подписки"
        static let changeButtonText = "Изменить"
        static let shareButtonText = "Поделиться профилем"
        static let addFriendButtonImage = UIImage(named: "personPlus")
        static let plusButtonImage = UIImage(named: "plusButton")
        static let linkText = "📎www.spacex.com"
        static let publication = "10"
        static let subscribers = "124"
        static let subscription = "217"
        static let fullName = "Антон Супрунов"
        static let descriptionText = "Верните 2017"
        static let avatarImage = UIImage(named: "vibe4")
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.layer.cornerRadius = 40
        imageView.image = Constants.avatarImage
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let publicationCountLabel: UILabel = {
        let label = UILabel()
        label.font = .verdanaBold14
        label.text = Constants.publication
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let publicationLabel: UILabel = {
        let label = UILabel()
        label.font = .verdana10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.publicationText
        return label
    }()

    private let subscribersCountLabel: UILabel = {
        let label = UILabel()
        label.font = .verdanaBold14
        label.text = Constants.subscribers
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.font = .verdana10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribersText
        return label
    }()

    private let subscriptionsCountLabel: UILabel = {
        let label = UILabel()
        label.font = .verdanaBold14
        label.textAlignment = .center
        label.text = Constants.subscription
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscriptionsLabel: UILabel = {
        let label = UILabel()
        label.font = .verdana10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscriptionText
        return label
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = .verdanaBold14
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.fullName
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .verdana14
        label.text = Constants.descriptionText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let linkLabel: UILabel = {
        let label = UILabel()
        label.font = .verdana14
        label.text = Constants.linkText
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.changeButtonText, for: .normal)
        button.titleLabel?.font = .verdanaBold10
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.shareButtonText, for: .normal)
        button.titleLabel?.font = .verdanaBold10
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let addFriendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.addFriendButtonImage, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(Constants.plusButtonImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Public Property

    weak var delegate: LinkDelegate?

    // MARK: - Initialisator

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
        addSubviews()
        setAvatarImageViewConstraints()
        setCountedLabels()
        setStatisticLabel()
        setFullNameLabel()
        setDescriptionLabelConstraint()
        setLinkLabelConstraint()
        setButtonsConstraint()
        setAddFriendButtonConstraint()
        setPlusButtonConstraint()
        addGestureRecognizer()
        contentView.heightAnchor.constraint(equalToConstant: 228).isActive = true
    }

    // MARK: - Private methods

    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(descriptionLabel)
        addSubview(linkLabel)
        addSubview(addFriendButton)
        addSubview(plusButton)
    }

    private func addGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(openWeb)
        )
        linkLabel.isUserInteractionEnabled = true
        linkLabel.addGestureRecognizer(recognizer)
    }

    private func setPlusButtonConstraint() {
        plusButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 27).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 68).isActive = true
        plusButton.topAnchor.constraint(equalTo: topAnchor, constant: 66).isActive = true
    }

    private func setAddFriendButtonConstraint() {
        addFriendButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        addFriendButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addFriendButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 335).isActive = true
        addFriendButton.topAnchor.constraint(equalTo: linkLabel.bottomAnchor, constant: 15).isActive = true
    }

    private func setButtonsConstraint() {
        var startLeaingConstant: CGFloat = 15
        for button in [changeButton, shareButton] {
            contentView.addSubview(button)
            button.heightAnchor.constraint(equalToConstant: 27).isActive = true
            button.widthAnchor.constraint(equalToConstant: 155).isActive = true
            button.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: startLeaingConstant
            ).isActive = true
            button.topAnchor.constraint(equalTo: linkLabel.bottomAnchor, constant: 15).isActive = true
            startLeaingConstant += 160
        }
    }

    private func setLinkLabelConstraint() {
        linkLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        linkLabel.widthAnchor.constraint(equalToConstant: 298).isActive = true
        linkLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        linkLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6).isActive = true
    }

    private func setDescriptionLabelConstraint() {
        descriptionLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 298).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 11).isActive = true
    }

    private func setAvatarImageViewConstraints() {
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    }

    private func setFullNameLabel() {
        fullNameLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        fullNameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 9).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    }

    private func setCountedLabels() {
        var startLeadingConstant: CGFloat = -33
        [
            publicationCountLabel,
            subscribersCountLabel,
            subscriptionsCountLabel
        ].forEach { label in
            addSubview(label)
            label.heightAnchor.constraint(equalToConstant: 17).isActive = true
            label.widthAnchor.constraint(equalToConstant: 50).isActive = true
            label.topAnchor.constraint(equalTo: topAnchor, constant: 22).isActive = true
            label.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: startLeadingConstant
            ).isActive = true
            startLeadingConstant += -70
        }
    }

    private func setStatisticLabel() {
        var startLeadingConstant: CGFloat = -23
        [
            publicationLabel,
            subscribersLabel,
            subscriptionsLabel
        ].forEach { label in
            addSubview(label)
            label.heightAnchor.constraint(equalToConstant: 12).isActive = true
            label.widthAnchor.constraint(equalToConstant: 70).isActive = true
            label.topAnchor.constraint(equalTo: topAnchor, constant: 41).isActive = true
            label.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: startLeadingConstant
            ).isActive = true
            startLeadingConstant += -70
        }
    }

    @objc private func openWeb() {
        delegate?.openWebView()
    }
}
