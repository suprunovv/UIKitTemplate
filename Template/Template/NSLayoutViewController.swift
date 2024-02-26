// NSLayoutViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Светофор через NSLayout
final class NSLayoutViewController: UIViewController {
    // MARK: - Visual component

    private let redView: ColorView = {
        let view = ColorView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yellowView: ColorView = {
        let view = ColorView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let greenView: ColorView = {
        let view = ColorView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initializators

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setYellowViewConstraint()
        setRedViewConstraint()
        setGreenViewConstraint()
        setBacgroundViewConstraint()
    }

    // MARK: - Private methods

    private func addSubviews() {
        view.addSubview(backgroundView)
        view.addSubview(yellowView)
        view.addSubview(redView)
        view.addSubview(greenView)
    }

    private func setYellowViewConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .height,
                relatedBy: .lessThanOrEqual,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 100
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .width,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .height,
                multiplier: 1,
                constant: 0
            )
        ])

        let secondHeight = NSLayoutConstraint(
            item: yellowView,
            attribute: .height,
            relatedBy: .equal,
            toItem: view,
            attribute: .height,
            multiplier: 0.25,
            constant: 0
        )
        secondHeight.priority = .defaultLow
        NSLayoutConstraint.activate([secondHeight])
    }

    private func setRedViewConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: redView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .top,
                multiplier: 1,
                constant: -10
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .height,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .height,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .width,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .width,
                multiplier: 1,
                constant: 0
            )
        ])
    }

    private func setGreenViewConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: greenView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .top,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .bottom,
                multiplier: 1,
                constant: 10
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .height,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .height,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .width,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .width,
                multiplier: 1,
                constant: 0
            )
        ])
    }

    private func setBacgroundViewConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: backgroundView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: redView,
                attribute: .leading,
                multiplier: 1,
                constant: -10
            ),
            NSLayoutConstraint(
                item: backgroundView,
                attribute: .top,
                relatedBy: .equal,
                toItem: redView,
                attribute: .top,
                multiplier: 1,
                constant: -10
            ),
            NSLayoutConstraint(
                item: backgroundView,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: redView,
                attribute: .trailing,
                multiplier: 1,
                constant: 10
            ),
            NSLayoutConstraint(
                item: backgroundView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: greenView,
                attribute: .bottom,
                multiplier: 1,
                constant: 10
            )
        ])
    }
}
