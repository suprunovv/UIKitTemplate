// ProfileControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью экрана профиля
final class ProfileControllerView: UIView {
    // MARK: - Constants

    enum Constants {
        static let titleText = "Профиль"
        static let personalDataText = "Личные данные"
        static let myDataText = "Мои данные"
        static let getFriendText = "Приведи друга"
        static let feedBackText = "Обратная связь"
        static let lineSpase = 52
        static let startLineTopAnchorConstant = 403
        static let likePersonImageName = "personLike"
        static let feedBaackImageName = "sms"
    }

    // MARK: - Visual Components

    private let plasticCardView = PlasticCardView()

    private let personalDataTextLabel = UILabel(
        text: Constants.personalDataText,
        font: Fonts.verdanaBold16,
        textColor: .black
    )
    private let lineOne: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    private let lineTwo: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    private let lineThre: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    private let myDataLabel = LabelButtonView()
    private let getFriendsLabelView: LabelButtonView = {
        let view = LabelButtonView()
        view.setupView(
            text: Constants.getFriendText,
            imageName: Constants.likePersonImageName
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let feedBackLabelView: LabelButtonView = {
        let view = LabelButtonView()
        view.setupView(text: Constants.feedBackText, imageName: Constants.feedBaackImageName)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
        setLabelViewConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func addTargetMyDataLabel(_ gesture: UITapGestureRecognizer) {
        myDataLabel.isUserInteractionEnabled = true
        myDataLabel.addGestureRecognizer(gesture)
    }

    // MARK: - Private Methods

    private func setLabelViewConstraint() {
        addSubview(myDataLabel)
        myDataLabel.translatesAutoresizingMaskIntoConstraints = false
        myDataLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        myDataLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        myDataLabel.topAnchor.constraint(equalTo: topAnchor, constant: 372).isActive = true
        myDataLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -408).isActive = true
        addSubview(getFriendsLabelView)
        getFriendsLabelView.translatesAutoresizingMaskIntoConstraints = false
        getFriendsLabelView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        getFriendsLabelView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        getFriendsLabelView.topAnchor.constraint(equalTo: topAnchor, constant: 424).isActive = true
        getFriendsLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -356).isActive = true
        addSubview(feedBackLabelView)
        feedBackLabelView.translatesAutoresizingMaskIntoConstraints = false
        feedBackLabelView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        feedBackLabelView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        feedBackLabelView.topAnchor.constraint(equalTo: topAnchor, constant: 476).isActive = true
        feedBackLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -303).isActive = true
    }

    private func setConstraints() {
        addSubview(plasticCardView)
        plasticCardView.translatesAutoresizingMaskIntoConstraints = false
        plasticCardView.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 20
        ).isActive = true
        plasticCardView.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: -20
        ).isActive = true
        plasticCardView.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 120
        ).isActive = true
        plasticCardView.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -512
        ).isActive = true
        addSubview(personalDataTextLabel)
        personalDataTextLabel.translatesAutoresizingMaskIntoConstraints = false
        personalDataTextLabel.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 20
        ).isActive = true
        personalDataTextLabel.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: -192
        ).isActive = true
        personalDataTextLabel.topAnchor.constraint(
            equalTo: plasticCardView.bottomAnchor,
            constant: 28
        ).isActive = true
        personalDataTextLabel.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: -462
        ).isActive = true
    }
}
