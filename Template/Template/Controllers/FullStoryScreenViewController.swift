// FullStoryScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран истории
final class FullStoryScreenViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let cancelButtonImage = UIImage(systemName: "xmark")
    }

    // MARK: - Visual components

    private let backgroundStoryView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30 / 2
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 27 / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyNameLabel: UILabel = {
        let label = UILabel()
        label.font = .verdana10
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        return imageView
    }()

    private let progressView: UIProgressView = {
        let progres = UIProgressView()
        progres.translatesAutoresizingMaskIntoConstraints = false
        progres.tintColor = .white
        progres.progressTintColor = .white
        progres.backgroundColor = .gray
        return progres
    }()

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(Constants.cancelButtonImage, for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()

    // MARK: - Private property

    private var timer = Timer()

    // MARK: - Initializators

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupView()
        configureTimer()
    }

    // MARK: - Public methods

    func configureScreen(story: Story) {
        storyNameLabel.text = story.storyName
        storyImageView.image = UIImage(named: story.imageName)
        backgroundImageView.image = UIImage(named: story.storyImageName)
    }

    // MARK: - Private methods

    private func configureTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1 / 30,
            target: self,
            selector: #selector(updateProgresView),
            userInfo: nil,
            repeats: true
        )
    }

    private func setupView() {
        view.backgroundColor = .white
        setImageViewConstraint()
        setBackgroundStoryViewConstraint()
        setStoryNameLabelConstraint()
        setBackgroundImageViewConstraint()
        setProgressViewConstraint()
        setCancelButtonConstraint()
    }

    private func addSubviews() {
        view.addSubview(backgroundImageView)
        backgroundStoryView.addSubview(storyImageView)
        view.addSubview(backgroundStoryView)
        view.addSubview(storyNameLabel)
        view.addSubview(progressView)
        view.addSubview(cancelButton)
    }

    private func setCancelButtonConstraint() {
        cancelButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }

    private func setBackgroundImageViewConstraint() {
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setProgressViewConstraint() {
        progressView.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
    }

    private func setImageViewConstraint() {
        storyImageView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        storyImageView.widthAnchor.constraint(equalToConstant: 27).isActive = true
        storyImageView.centerXAnchor.constraint(equalTo: backgroundStoryView.centerXAnchor).isActive = true
        storyImageView.centerYAnchor.constraint(
            equalTo: backgroundStoryView.centerYAnchor
        ).isActive = true
    }

    private func setStoryNameLabelConstraint() {
        storyNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        storyNameLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        storyNameLabel.leadingAnchor.constraint(
            equalTo: backgroundStoryView.trailingAnchor, constant: 7
        ).isActive = true
        storyNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    }

    private func setBackgroundStoryViewConstraint() {
        backgroundStoryView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        backgroundStoryView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backgroundStoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        backgroundStoryView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 21
        ).isActive = true
    }

    @objc private func goBack() {
        timer.invalidate()
        dismiss(animated: true, completion: nil)
    }

    @objc private func updateProgresView() {
        progressView.progress += 0.005
        if progressView.progress == 1 {
            timer.invalidate()
            dismiss(animated: true)
        }
    }
}
