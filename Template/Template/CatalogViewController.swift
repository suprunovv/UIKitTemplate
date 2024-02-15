// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// каталог вьюКонтроллер
class CatalogViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    enum Constants {
        static let catalogLabelText = "Каталог"
        static let manNewsImage = "manNews"
        static let manSalesImage = "manSales"
        static let womanNewsImage = "womanNews"
        static let womanSalesImage = "womanSales"
        static let childNewsImage = "childNews"
        static let childSalesImage = "childSales"
        static let brendsImage = "brends"
        static let shoesManImage = "shoesMan"
        static let bagManImage = "bagMan"
        static let shoesChildImage = "shoesChild"
        static let bagChildImage = "bagChild"
        static let shoesWomanImage = "shoesWoman"
        static let bagWomanImage = "bagWoman"
        static let brendsLabelText = "Бренды"
        static let shoesLabelText = "Обувь"
        static let bagLabelText = "Сумки"
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

    private let catalogLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.catalogLabelText
        label.font = Constants.verdanaBold16
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let personsSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Женщинам", "Мужчинам", "Детям"])
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(nil, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    private let internalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.manNewsImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let salesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.manSalesImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let brandView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "appLightGrey")
        view.layer.cornerRadius = 12
        return view
    }()

    private let brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.brendsLabelText
        label.font = Constants.verdanaBold14
        return label
    }()

    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.brendsImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let shoesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "appLightGrey")
        view.layer.cornerRadius = 12
        return view
    }()

    private let shoesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.addTarget(nil, action: #selector(shoesButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 12
        return button
    }()

    private let shoesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.shoesLabelText
        label.font = Constants.verdanaBold14
        return label
    }()

    private let shoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.shoesManImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let bagView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "appLightGrey")
        view.layer.cornerRadius = 12
        return view
    }()

    private let bagLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.bagLabelText
        label.font = Constants.verdanaBold14
        return label
    }()

    private let bagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.bagManImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            newsImageView.image = UIImage(named: Constants.womanNewsImage)
            salesImageView.image = UIImage(named: Constants.womanSalesImage)
            shoesImageView.image = UIImage(named: Constants.shoesWomanImage)
            bagImageView.image = UIImage(named: Constants.bagWomanImage)
            shoesButton.isEnabled = true
        } else if sender.selectedSegmentIndex == 1 {
            newsImageView.image = UIImage(named: Constants.manNewsImage)
            salesImageView.image = UIImage(named: Constants.manSalesImage)
            shoesImageView.image = UIImage(named: Constants.shoesManImage)
            bagImageView.image = UIImage(named: Constants.bagManImage)
            shoesButton.isEnabled = false
        } else if sender.selectedSegmentIndex == 2 {
            newsImageView.image = UIImage(named: Constants.childNewsImage)
            salesImageView.image = UIImage(named: Constants.childSalesImage)
            shoesImageView.image = UIImage(named: Constants.shoesChildImage)
            bagImageView.image = UIImage(named: Constants.bagChildImage)
            shoesButton.isEnabled = false
        }
    }

    private func configureCatalogLabel() {
        view.addSubview(catalogLabel)
        catalogLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 53).isActive = true
        catalogLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
        catalogLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        catalogLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    fileprivate func configurePersonsSegmentedControl() {
        view.addSubview(personsSegmentedControl)
        personsSegmentedControl.topAnchor.constraint(equalTo: catalogLabel.bottomAnchor, constant: 25).isActive = true
        personsSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        personsSegmentedControl.widthAnchor.constraint(equalToConstant: 345).isActive = true
        personsSegmentedControl.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    private func configureBrandView() {
        internalView.addSubview(brandView)
        brandView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 20).isActive = true
        brandView.leftAnchor.constraint(equalTo: internalView.leftAnchor).isActive = true
        brandView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        brandView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        brandView.addSubview(brandLabel)
        brandLabel.topAnchor.constraint(equalTo: brandView.topAnchor, constant: 31).isActive = true
        brandLabel.leftAnchor.constraint(equalTo: brandView.leftAnchor, constant: 20).isActive = true
        brandLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        brandLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        brandView.addSubview(brandImageView)
        brandImageView.topAnchor.constraint(equalTo: brandView.topAnchor).isActive = true
        brandImageView.rightAnchor.constraint(equalTo: brandView.rightAnchor).isActive = true
        brandImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        brandImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func configureShoesView() {
        internalView.addSubview(shoesView)
        shoesView.topAnchor.constraint(equalTo: brandView.bottomAnchor, constant: 20).isActive = true
        shoesView.leftAnchor.constraint(equalTo: internalView.leftAnchor).isActive = true
        shoesView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        shoesView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        internalView.addSubview(shoesButton)
        shoesButton.topAnchor.constraint(equalTo: brandView.bottomAnchor, constant: 20).isActive = true
        shoesButton.leftAnchor.constraint(equalTo: internalView.leftAnchor).isActive = true
        shoesButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        shoesButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        shoesView.addSubview(shoesLabel)
        shoesLabel.topAnchor.constraint(equalTo: shoesView.topAnchor, constant: 31).isActive = true
        shoesLabel.leftAnchor.constraint(equalTo: shoesView.leftAnchor, constant: 20).isActive = true
        shoesLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoesLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        shoesView.addSubview(shoesImageView)
        shoesImageView.topAnchor.constraint(equalTo: shoesView.topAnchor).isActive = true
        shoesImageView.rightAnchor.constraint(equalTo: shoesView.rightAnchor).isActive = true
        shoesImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        shoesImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func configureBagView() {
        internalView.addSubview(bagView)
        bagView.topAnchor.constraint(equalTo: shoesView.bottomAnchor, constant: 20).isActive = true
        bagView.leftAnchor.constraint(equalTo: internalView.leftAnchor).isActive = true
        bagView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        bagView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        bagView.addSubview(bagLabel)
        bagLabel.topAnchor.constraint(equalTo: bagView.topAnchor, constant: 31).isActive = true
        bagLabel.leftAnchor.constraint(equalTo: bagView.leftAnchor, constant: 20).isActive = true
        bagLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        bagLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        bagView.addSubview(bagImageView)
        bagImageView.topAnchor.constraint(equalTo: bagView.topAnchor).isActive = true
        bagImageView.rightAnchor.constraint(equalTo: bagView.rightAnchor).isActive = true
        bagImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        bagImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func configureManView() {
        view.addSubview(internalView)
        internalView.topAnchor.constraint(equalTo: personsSegmentedControl.bottomAnchor, constant: 20).isActive = true
        internalView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        internalView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        internalView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true

        internalView.addSubview(newsImageView)
        newsImageView.topAnchor.constraint(equalTo: internalView.topAnchor).isActive = true
        newsImageView.leftAnchor.constraint(equalTo: internalView.leftAnchor).isActive = true
        newsImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        internalView.addSubview(salesImageView)
        salesImageView.topAnchor.constraint(equalTo: newsImageView.topAnchor).isActive = true
        salesImageView.rightAnchor.constraint(equalTo: internalView.rightAnchor).isActive = true
        salesImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        salesImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        configureBrandView()
        configureShoesView()
        configureBagView()
    }

    private func configureUI() {
        view.backgroundColor = .white
        configureCatalogLabel()
        configurePersonsSegmentedControl()
        configureManView()
    }

    @objc private func shoesButtonTapped() {
        let shoeViewController = ShoeViewController()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(shoeViewController, animated: true)
    }
}
