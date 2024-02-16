// ShoppingCartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// корзина ВьюКонтроллер
final class ShoppingCartViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let startTopConstant = 116
        static let shoesCellSpase = 160
        static let orderButtonText = "Оформить заказ"
        static let orderButtonColor = UIColor(red: 225.0 / 255.0, green: 24.0 / 255.0, blue: 131.0 / 255.0, alpha: 1)
        static let titleText = "Корзина"
    }

    // MARK: - Visual Components

    private let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("\(Constants.orderButtonText)", for: .normal)
        button.titleLabel?.font = Fonts.verdanaBold16
        button.tintColor = .white
        button.backgroundColor = Constants.orderButtonColor
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 0.5
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        createLikeShoesCells()
        setView()
        setOrderButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        remuveSubviews()
        createLikeShoesCells()
    }

    // MARK: - Private Methods

    private func setView() {
        view.backgroundColor = .white
        title = Constants.titleText
    }

    private func remuveSubviews() {
        for subview in view.subviews {
            if subview is ShoppingCartCellView {
                subview.removeFromSuperview()
            } else {
                continue
            }
        }
    }

    private func createLikeShoesCells() {
        var startTop = Constants.startTopConstant
        for shoes in LikeListShoes.shared.getLikeShoes() {
            let cell = ShoppingCartCellView(shoes: shoes)
            view.addSubview(cell)
            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            cell.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            cell.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(startTop)).isActive = true
            cell.heightAnchor.constraint(equalToConstant: 157).isActive = true
            startTop += Constants.shoesCellSpase
        }
    }

    private func setOrderButton() {
        view.addSubview(orderButton)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        orderButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        orderButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114).isActive = true
        orderButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 654).isActive = true
    }
}
