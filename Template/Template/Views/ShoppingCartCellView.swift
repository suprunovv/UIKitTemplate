// ShoppingCartCellView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка для элементов в корзине
final class ShoppingCartCellView: UIView {
    // MARK: - Constants

    enum Constnts {
        static let countText = "Количество"
        static let sizeText = "Размер"
        static let priceText = "Цена"
        static let startLeft = 199
        static let buttonSpase = 35
        static let plusImage = UIImage(named: "plus")
        static let minusImage = UIImage(named: "minus")
        static let basketImage = UIImage(named: "basket")
    }

    // MARK: - Visual Content

    private let backGroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        return view
    }()

    private let shoesImageView = UIImageView()
    private let nameLabel = UILabel(text: "", font: Fonts.verdana12, textColor: .black)
    private let countLabel = UILabel(text: Constnts.countText, font: Fonts.verdana12, textColor: .black)
    private let sizeLabel = UILabel(text: Constnts.sizeText, font: Fonts.verdana12, textColor: .black)
    private let priceTextLabel = UILabel(text: Constnts.priceText, font: Fonts.verdana12, textColor: .black)
    private let priceLabel = UILabel(text: "", font: Fonts.verdanaBold10, textColor: .black)
    private let countedLabel = UILabel(text: "1", font: Fonts.verdana12, textColor: .black)

    private let sizeButon35: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray6
        button.setTitle("35", for: .normal)
        button.titleLabel?.font = Fonts.verdana10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 7
        return button
    }()

    private let sizeButon36: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray6
        button.setTitle("36", for: .normal)
        button.titleLabel?.font = Fonts.verdana10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 7
        return button
    }()

    private let sizeButon37: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray6
        button.setTitle("37", for: .normal)
        button.titleLabel?.font = Fonts.verdana10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 7
        return button
    }()

    private let sizeButon38: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray6
        button.setTitle("38", for: .normal)
        button.titleLabel?.font = Fonts.verdana10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 7
        return button
    }()

    private let sizeButon39: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray6
        button.setTitle("39", for: .normal)
        button.titleLabel?.font = Fonts.verdana10
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 7
        return button
    }()

    private let plusButon: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 7
        button.setImage(Constnts.plusImage, for: .normal)
        return button
    }()

    private let basketButon: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 7
        button.setImage(Constnts.basketImage, for: .normal)
        return button
    }()

    private let minusButon: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 7
        button.setImage(Constnts.minusImage, for: .normal)
        return button
    }()

    // MARK: - Private properties

    private var count = 1 {
        didSet {
            countedLabel.text = "\(count)"
        }
    }

    private var price = 0

    // MARK: - Initializators

    init(shoes: Shoes) {
        super.init(frame: .zero)
        shoesImageView.image = UIImage(named: shoes.imageName)
        nameLabel.text = shoes.name
        priceLabel.text = "\(shoes.price) ₽"
        price = shoes.price
        setViewAndImageView()
        setLabelConstraints()
        setSizeButtons()
        setPlusMinusButton()
        setPriceLabel()
        setBasketButton()
        setCountedLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private methods

    private func setCountedLabel() {
        addSubview(countedLabel)
        countedLabel.translatesAutoresizingMaskIntoConstraints = false
        countedLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 317).isActive = true
        countedLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        countedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 44).isActive = true
        countedLabel.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }

    private func setBasketButton() {
        addSubview(basketButon)
        basketButon.translatesAutoresizingMaskIntoConstraints = false
        basketButon.leftAnchor.constraint(equalTo: leftAnchor, constant: 147).isActive = true
        basketButon.rightAnchor.constraint(equalTo: rightAnchor, constant: -208).isActive = true
        basketButon.topAnchor.constraint(equalTo: topAnchor, constant: 11.5).isActive = true
        basketButon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -126.5).isActive = true
    }

    private func setPriceLabel() {
        addSubview(priceLabel)
        priceLabel.textAlignment = .right
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 296).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 144).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func setViewAndImageView() {
        addSubview(backGroundView)
        addSubview(shoesImageView)
        backGroundView.translatesAutoresizingMaskIntoConstraints = false
        shoesImageView.translatesAutoresizingMaskIntoConstraints = false
        backGroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        backGroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -198).isActive = true
        backGroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backGroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        shoesImageView.leftAnchor.constraint(equalTo: backGroundView.leftAnchor, constant: 28).isActive = true
        shoesImageView.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -28).isActive = true
        shoesImageView.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 28).isActive = true
        shoesImageView.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -28).isActive = true
    }

    private func setPlusMinusButton() {
        addSubview(plusButon)
        plusButon.addTarget(self, action: #selector(apendCount(_:)), for: .touchUpInside)
        minusButon.addTarget(self, action: #selector(apendCount(_:)), for: .touchUpInside)
        addSubview(minusButon)
        plusButon.translatesAutoresizingMaskIntoConstraints = false
        minusButon.translatesAutoresizingMaskIntoConstraints = false
        minusButon.leftAnchor.constraint(equalTo: leftAnchor, constant: 295).isActive = true
        minusButon.widthAnchor.constraint(equalToConstant: 15).isActive = true
        minusButon.topAnchor.constraint(equalTo: topAnchor, constant: 46).isActive = true
        minusButon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        plusButon.leftAnchor.constraint(equalTo: leftAnchor, constant: 333).isActive = true
        plusButon.rightAnchor.constraint(equalTo: rightAnchor, constant: -27).isActive = true
        plusButon.topAnchor.constraint(equalTo: topAnchor, constant: 46).isActive = true
        plusButon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -96).isActive = true
    }

    private func setSizeButtons() {
        let buttons = [sizeButon35, sizeButon36, sizeButon37, sizeButon38]
        var startLeft = Constnts.startLeft
        for button in buttons {
            addSubview(button)
            button.tintColor = .black
            button.addTarget(self, action: #selector(selectionSize(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat(startLeft)).isActive = true
            button.topAnchor.constraint(equalTo: topAnchor, constant: 97).isActive = true
            button.widthAnchor.constraint(equalToConstant: 31).isActive = true
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -43).isActive = true
            startLeft += Constnts.buttonSpase
        }
        addSubview(sizeButon39)
        sizeButon39.translatesAutoresizingMaskIntoConstraints = false
        sizeButon39.tintColor = .black
        sizeButon39.addTarget(self, action: #selector(selectionSize(_:)), for: .touchUpInside)
        sizeButon39.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat(Constnts.startLeft)).isActive = true
        sizeButon39.topAnchor.constraint(equalTo: topAnchor, constant: 118).isActive = true
        sizeButon39.widthAnchor.constraint(equalToConstant: 31).isActive = true
        sizeButon39.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22).isActive = true
    }

    private func setLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 193).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -72).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -124).isActive = true
        addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 193).isActive = true
        countLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -110).isActive = true
        countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -97).isActive = true
        addSubview(sizeLabel)
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 193).isActive = true
        sizeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -138).isActive = true
        sizeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 72).isActive = true
        sizeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -70).isActive = true
        addSubview(priceTextLabel)
        priceTextLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTextLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 193).isActive = true
        priceTextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -150).isActive = true
        priceTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 142).isActive = true
        priceTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func setButtonBorder(_ buttonn: UIButton) {
        let buttons = [sizeButon35, sizeButon36, sizeButon37, sizeButon38, sizeButon39]
        for button in buttons {
            if button == buttonn {
                button.layer.borderWidth = 1.5
            } else {
                button.layer.borderWidth = 0
            }
        }
    }

    @objc private func apendCount(_ sender: UIButton) {
        switch sender {
        case plusButon:
            if count < 9 {
                count += 1
                price += price
            }
        case minusButon:
            if count > 1 {
                count -= 1
                price -= price
            }
        default: break
        }
    }

    @objc private func selectionSize(_ sender: UIButton) {
        setButtonBorder(sender)
    }
}
