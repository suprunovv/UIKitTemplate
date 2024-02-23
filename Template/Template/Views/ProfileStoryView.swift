// ProfileStoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ProfileStoryDelegate: AnyObject {
    /// Метод для передачи модели истории
    func setStoryScreen(story: Story)
}

/// вью истории в профиле
final class ProfileStoryView: UIView {
    // MARK: - Visual components

    private let backgroundStoryView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 55 / 2
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 49 / 2
        imageView.clipsToBounds = true
        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyNameLabel: UILabel = {
        let label = UILabel()
        label.font = .verdana10
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    // MARK: - Public property

    weak var delegate: ProfileStoryDelegate?

    // MARK: - Private property

    private var story: Story?

    // MARK: - Initializators

    convenience init(story: Story) {
        self.init()
        self.story = story
        setupView(image: story.imageName, nikname: story.storyName)
        addGestureRecognizer()
        addSubviews()
        setStoryImageViewConstraint()
        setBackgroundStoryViewConstraint()
        setStoryNameLabelConstraint()
    }

    // MARK: - Private methods

    private func setupView(image: String, nikname: String) {
        translatesAutoresizingMaskIntoConstraints = false
        storyImageView.image = UIImage(named: image)
        storyNameLabel.text = nikname
        isUserInteractionEnabled = true
    }

    private func addGestureRecognizer() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openStory))
        addGestureRecognizer(gesture)
    }

    private func addSubviews() {
        backgroundStoryView.addSubview(storyImageView)
        addSubview(backgroundStoryView)
        addSubview(storyNameLabel)
    }

    private func setStoryNameLabelConstraint() {
        storyNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        storyNameLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        storyNameLabel.topAnchor.constraint(
            equalTo: backgroundStoryView.bottomAnchor, constant: 4
        ).isActive = true
        storyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    }

    private func setBackgroundStoryViewConstraint() {
        backgroundStoryView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        backgroundStoryView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        backgroundStoryView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundStoryView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }

    private func setStoryImageViewConstraint() {
        storyImageView.heightAnchor.constraint(equalToConstant: 49).isActive = true
        storyImageView.widthAnchor.constraint(equalToConstant: 49).isActive = true
        storyImageView.centerXAnchor.constraint(equalTo: backgroundStoryView.centerXAnchor).isActive = true
        storyImageView.centerYAnchor.constraint(
            equalTo: backgroundStoryView.centerYAnchor
        ).isActive = true
    }

    @objc private func openStory() {
        guard let story = story else {
            return
        }
        delegate?.setStoryScreen(story: story)
    }
}
