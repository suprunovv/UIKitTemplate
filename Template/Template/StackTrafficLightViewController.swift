// StackTrafficLightViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер светофора в стекВью
final class StackTrafficLightViewController: UIViewController {
    // MARK: - Visual component

    private let redView: UIView = {
        let redView = UIView()
        redView.clipsToBounds = true
        redView.backgroundColor = .systemRed
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()

    private let yellowView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = .systemYellow
        return yellowView
    }()

    private let greenView: UIView = {
        let greenView = UIView()
        greenView.backgroundColor = .systemGreen
        return greenView
    }()

    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGray
        return backgroundView
    }()

    private var stackView = UIStackView()

    // MARK: - Initializators

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setStackView()
        setBacgroundViewConstraint()
        setCorner()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { [weak self] _ in
            guard let self = self else { return }
            if size.height > size.width {
                for view in self.stackView.arrangedSubviews {
                    view.layer.cornerRadius = 57
                }
            } else {
                for view in self.stackView.arrangedSubviews {
                    view.layer.cornerRadius = 40
                }
            }
        }
    }

    // MARK: - Private methods

    private func setupView() {
        view.backgroundColor = .white
    }

    private func addSubviews() {
        view.addSubview(backgroundView)
    }

    private func setStackView() {
        stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 376).isActive = true
        let secondHeight = stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        secondHeight.priority = .defaultHigh
        secondHeight.isActive = true
        stackView.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.31).isActive = true
    }

    private func setBacgroundViewConstraint() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -10).isActive = true
        backgroundView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -10).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
    }

    private func setCorner() {
        for view in stackView.arrangedSubviews {
            view.layer.cornerRadius = 57
        }
    }
}
