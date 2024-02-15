// SizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// контроллер с выбором размера
class SizeViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    enum Constants {
        static let titleText = "Выберите размер"
        static let eu35 = "35 EU"
        static let eu36 = "36 EU"
        static let eu37 = "37 EU"
        static let eu38 = "38 EU"
        static let eu39 = "39 EU"
        static let verdanaBold18 = UIFont(name: "Verdana-Bold", size: 18)
        static let verdanaBold16 = UIFont(name: "Verdana-Bold", size: 16)
        static let verdanaBold26 = UIFont(name: "Verdana-Bold", size: 26)
        static let verdanaBold12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdanaBold14 = UIFont(name: "Verdana-Bold", size: 14)
        static let verdana16 = UIFont(name: "Verdana", size: 16)
        static let verdana14 = UIFont(name: "Verdana", size: 14)
        static let verdana12 = UIFont(name: "Verdana", size: 12)
    }

    // MARK: - IBOutlets

    // MARK: - Visual Components

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleText
        label.font = Constants.verdanaBold16
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(nil, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var eu35Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle(Constants.eu35, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Constants.verdana16
        button.addTarget(nil, action: #selector(eu35ButtonTapped), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var eu36Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle(Constants.eu36, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Constants.verdana16
        button.addTarget(nil, action: #selector(eu36ButtonTapped), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var eu37Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle(Constants.eu37, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Constants.verdana16
        button.addTarget(nil, action: #selector(eu37ButtonTapped), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var eu38Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle(Constants.eu38, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Constants.verdana16
        button.addTarget(nil, action: #selector(eu38ButtonTapped), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var eu39Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle(Constants.eu39, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Constants.verdana16
        button.addTarget(nil, action: #selector(eu39ButtonTapped), for: .touchUpInside)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let divider35View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    private let divider36View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    private let divider37View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    private let divider38View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    private let divider39View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    var shoe: Shoes?

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 11).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func configureCloseButton() {
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 26).isActive = true
        closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }

    private func configureSizeButtons() {
        view.addSubview(eu35Button)
        eu35Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 77).isActive = true
        eu35Button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        eu35Button.widthAnchor.constraint(equalToConstant: 278).isActive = true
        eu35Button.heightAnchor.constraint(equalToConstant: 19).isActive = true

        view.addSubview(eu36Button)
        eu36Button.topAnchor.constraint(equalTo: eu35Button.bottomAnchor, constant: 18).isActive = true
        eu36Button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        eu36Button.widthAnchor.constraint(equalToConstant: 278).isActive = true
        eu36Button.heightAnchor.constraint(equalToConstant: 19).isActive = true

        view.addSubview(eu37Button)
        eu37Button.topAnchor.constraint(equalTo: eu36Button.bottomAnchor, constant: 18).isActive = true
        eu37Button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        eu37Button.widthAnchor.constraint(equalToConstant: 278).isActive = true
        eu37Button.heightAnchor.constraint(equalToConstant: 19).isActive = true

        view.addSubview(eu38Button)
        eu38Button.topAnchor.constraint(equalTo: eu37Button.bottomAnchor, constant: 18).isActive = true
        eu38Button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        eu38Button.widthAnchor.constraint(equalToConstant: 278).isActive = true
        eu38Button.heightAnchor.constraint(equalToConstant: 19).isActive = true

        view.addSubview(eu39Button)
        eu39Button.topAnchor.constraint(equalTo: eu38Button.bottomAnchor, constant: 18).isActive = true
        eu39Button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        eu39Button.widthAnchor.constraint(equalToConstant: 278).isActive = true
        eu39Button.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }

    private func configureDividers() {
        view.addSubview(divider35View)
        divider35View.topAnchor.constraint(equalTo: eu35Button.bottomAnchor, constant: 7).isActive = true
        divider35View.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        divider35View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        divider35View.heightAnchor.constraint(equalToConstant: 1).isActive = true

        view.addSubview(divider36View)
        divider36View.topAnchor.constraint(equalTo: eu36Button.bottomAnchor, constant: 7).isActive = true
        divider36View.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        divider36View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        divider36View.heightAnchor.constraint(equalToConstant: 1).isActive = true

        view.addSubview(divider37View)
        divider37View.topAnchor.constraint(equalTo: eu37Button.bottomAnchor, constant: 7).isActive = true
        divider37View.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        divider37View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        divider37View.heightAnchor.constraint(equalToConstant: 1).isActive = true

        view.addSubview(divider38View)
        divider38View.topAnchor.constraint(equalTo: eu38Button.bottomAnchor, constant: 7).isActive = true
        divider38View.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        divider38View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        divider38View.heightAnchor.constraint(equalToConstant: 1).isActive = true

        view.addSubview(divider39View)
        divider39View.topAnchor.constraint(equalTo: eu39Button.bottomAnchor, constant: 7).isActive = true
        divider39View.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        divider39View.widthAnchor.constraint(equalToConstant: 335).isActive = true
        divider39View.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    private func configureUI() {
        view.backgroundColor = .white
        configureTitleLabel()
        configureCloseButton()
        configureSizeButtons()

        configureDividers()
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func eu35ButtonTapped() {
        if let likedShoe = shoe {
            likedShoe.size = .eu35
            LikeListShoes.shared.addLikeShoes(shoes: likedShoe)
        }
        dismiss(animated: true)
    }

    @objc private func eu36ButtonTapped() {
        if let likedShoe = shoe {
            likedShoe.size = .eu36
            LikeListShoes.shared.addLikeShoes(shoes: likedShoe)
        }
        dismiss(animated: true)
    }

    @objc private func eu37ButtonTapped() {
        if let likedShoe = shoe {
            likedShoe.size = .eu37
            LikeListShoes.shared.addLikeShoes(shoes: likedShoe)
        }
        dismiss(animated: true)
    }

    @objc private func eu38ButtonTapped() {
        if let likedShoe = shoe {
            likedShoe.size = .eu38
            LikeListShoes.shared.addLikeShoes(shoes: likedShoe)
        }
        dismiss(animated: true)
    }

    @objc private func eu39ButtonTapped() {
        if let likedShoe = shoe {
            likedShoe.size = .eu39
            LikeListShoes.shared.addLikeShoes(shoes: likedShoe)
        }
        dismiss(animated: true)
    }
}
