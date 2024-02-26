// AnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Светофор через якоря
final class AnchorViewController: UIViewController {
    // MARK: - Visual components

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
        setYellowViewConstraints()
        setRedViewConstraints()
        setGreenViewConstraints()
        setBackgroundConstraints()
    }

    // MARK: - Private methods

    private func addSubviews() {
        view.addSubview(backgroundView)
        view.addSubview(yellowView)
        view.addSubview(redView)
        view.addSubview(greenView)
    }

    private func setYellowViewConstraints() {
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        let secondHightAnchor = yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        secondHightAnchor.priority = .defaultLow
        secondHightAnchor.isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }

    private func setRedViewConstraints() {
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -10).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
    }

    private func setGreenViewConstraints() {
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 10).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
    }

    private func setBackgroundConstraints() {
        backgroundView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -10).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 10).isActive = true
        backgroundView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
    }
}
