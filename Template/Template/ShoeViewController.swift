// ShoeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// контроллер с выбором размера
class ShoeViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let brownShoe = "brownShoe"
        static let blackShoe = "blackShoe"
        static let yellowShoe = "yellowShoe"
        static let pinkShoe = "pinkShoe"
        static let whiteShoe = "whiteShoe"
        static let basketImage = "basket"
    }

    // MARK: - Visual Components

    private let brownShoeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "appLightGrey")
        view.layer.cornerRadius = 20
        return view
    }()

    private let brownShoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.brownShoe)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let blackShoeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "appLightGrey")
        view.layer.cornerRadius = 20
        return view
    }()

    private let blackShoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.blackShoe)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let yellowShoeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "appLightGrey")
        view.layer.cornerRadius = 20
        return view
    }()

    private let yellowShoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.yellowShoe)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let pinkShoeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "appLightGrey")
        view.layer.cornerRadius = 20
        return view
    }()

    private let pinkShoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.pinkShoe)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let whiteShoeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "appLightGrey")
        view.layer.cornerRadius = 20
        return view
    }()

    private let whiteShoeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.whiteShoe)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let basketBrownShoeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.basketImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let basketBlackShoeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.basketImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let basketYellowShoeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.basketImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let basketPinkShoeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.basketImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let basketWhiteShoeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.basketImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    private var shoe: Shoes?

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    fileprivate func configureShoeCells() {
        view.addSubview(brownShoeView)
        brownShoeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        brownShoeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        brownShoeView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        brownShoeView.heightAnchor.constraint(equalToConstant: 157).isActive = true

        view.addSubview(brownShoeImageView)
        brownShoeImageView.topAnchor.constraint(equalTo: brownShoeView.topAnchor, constant: 27).isActive = true
        brownShoeImageView.leftAnchor.constraint(equalTo: brownShoeView.leftAnchor, constant: 29).isActive = true
        brownShoeImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        brownShoeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        view.addSubview(basketBrownShoeButton)
        basketBrownShoeButton.topAnchor.constraint(equalTo: brownShoeView.topAnchor, constant: 11).isActive = true
        basketBrownShoeButton.rightAnchor.constraint(equalTo: brownShoeView.rightAnchor, constant: -11).isActive = true
        basketBrownShoeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        basketBrownShoeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        view.addSubview(blackShoeView)
        blackShoeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        blackShoeView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        blackShoeView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        blackShoeView.heightAnchor.constraint(equalToConstant: 157).isActive = true

        view.addSubview(blackShoeImageView)
        blackShoeImageView.topAnchor.constraint(equalTo: blackShoeView.topAnchor, constant: 27).isActive = true
        blackShoeImageView.leftAnchor.constraint(equalTo: blackShoeView.leftAnchor, constant: 29).isActive = true
        blackShoeImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blackShoeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        view.addSubview(basketBlackShoeButton)
        basketBlackShoeButton.topAnchor.constraint(equalTo: blackShoeView.topAnchor, constant: 11).isActive = true
        basketBlackShoeButton.rightAnchor.constraint(equalTo: blackShoeView.rightAnchor, constant: -11).isActive = true
        basketBlackShoeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        basketBlackShoeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        view.addSubview(pinkShoeView)
        pinkShoeView.topAnchor.constraint(equalTo: brownShoeView.bottomAnchor, constant: 16).isActive = true
        pinkShoeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        pinkShoeView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        pinkShoeView.heightAnchor.constraint(equalToConstant: 157).isActive = true

        view.addSubview(pinkShoeImageView)
        pinkShoeImageView.topAnchor.constraint(equalTo: pinkShoeView.topAnchor, constant: 27).isActive = true
        pinkShoeImageView.leftAnchor.constraint(equalTo: pinkShoeView.leftAnchor, constant: 29).isActive = true
        pinkShoeImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pinkShoeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        view.addSubview(basketPinkShoeButton)
        basketPinkShoeButton.topAnchor.constraint(equalTo: pinkShoeView.topAnchor, constant: 11).isActive = true
        basketPinkShoeButton.rightAnchor.constraint(equalTo: pinkShoeView.rightAnchor, constant: -11).isActive = true
        basketPinkShoeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        basketPinkShoeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        view.addSubview(yellowShoeView)
        yellowShoeView.topAnchor.constraint(equalTo: blackShoeView.bottomAnchor, constant: 16).isActive = true
        yellowShoeView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        yellowShoeView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        yellowShoeView.heightAnchor.constraint(equalToConstant: 157).isActive = true

        view.addSubview(yellowShoeImageView)
        yellowShoeImageView.topAnchor.constraint(equalTo: yellowShoeView.topAnchor, constant: 27).isActive = true
        yellowShoeImageView.leftAnchor.constraint(equalTo: yellowShoeView.leftAnchor, constant: 29).isActive = true
        yellowShoeImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        yellowShoeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        view.addSubview(basketYellowShoeButton)
        basketYellowShoeButton.topAnchor.constraint(equalTo: yellowShoeView.topAnchor, constant: 11).isActive = true
        basketYellowShoeButton.rightAnchor.constraint(
            equalTo: yellowShoeView.rightAnchor,

            constant: -11
        ).isActive = true
        basketYellowShoeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        basketYellowShoeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        view.addSubview(whiteShoeView)
        whiteShoeView.topAnchor.constraint(equalTo: pinkShoeView.bottomAnchor, constant: 16).isActive = true
        whiteShoeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        whiteShoeView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        whiteShoeView.heightAnchor.constraint(equalToConstant: 157).isActive = true

        view.addSubview(whiteShoeImageView)
        whiteShoeImageView.topAnchor.constraint(equalTo: whiteShoeView.topAnchor, constant: 16).isActive = true
        whiteShoeImageView.leftAnchor.constraint(equalTo: whiteShoeView.leftAnchor, constant: 29).isActive = true
        whiteShoeImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        whiteShoeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        view.addSubview(basketWhiteShoeButton)
        basketWhiteShoeButton.topAnchor.constraint(equalTo: whiteShoeView.topAnchor, constant: 11).isActive = true
        basketWhiteShoeButton.rightAnchor.constraint(equalTo: whiteShoeView.rightAnchor, constant: -11).isActive = true
        basketWhiteShoeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        basketWhiteShoeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Обувь"

        configureShoeCells()
    }
}
