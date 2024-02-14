// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// протокол для передачи данных об обжарке
protocol RoastTypeDelegate: AnyObject {
    func transfer(_ imageName: String, text: String)
}

/// протокол для передачи модели
protocol CoffeModelDelegate: AnyObject {
    func transfer(model: CoffeModel)
}

/// протокол для пуша на экран смс
protocol PushDelegate: AnyObject {
    func pushVC()
}

// экран с выбором деталей заказа
final class DetailViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let coffeImageNames = ["кофе", "капучино", "латте"]
        static let blackRoastImageName = "темнаяОбж"
        static let whiteRoastImageName = "светлаяОбж"
        static let blackRoastText = "Темная\nобжарка"
        static let coffeNames = ["Американо", "Капучино", "Латте"]
        static let promocode = "vkusCoffe24"
        static let rubel = "Руб"
    }

    // MARK: - Public Properties

    /// название картинки в кнопке обжарки
    var roastImageName = Constants.blackRoastImageName {
        didSet {
            mainView.buttonRoastView.imageView.image = UIImage(named: roastImageName)
        }
    }

    /// текст в кнопке обжарки
    var roastText = Constants.blackRoastText {
        didSet {
            mainView.buttonRoastView.textLabel.text = roastText
        }
    }

    // MARK: - Private Properties

    /// экземплар главной вью
    private let mainView = DetailControllerView()
    /// модель с данными
    private var model = CoffeModel() {
        didSet {
            mainView.priceLabel.text = "Цѣна - \(model.totalPrice) \(Constants.rubel)"
        }
    }

    /// название кофе
    private var coffeName = Constants.coffeNames[0]

    /// кнопка share для нав бара
    private lazy var shareBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(
                systemName:
                "paperplane.fill"
            ),
            style: .done,
            target: self,
            action: #selector(share)
        )
        button.tintColor = .black
        return button
    }()

    /// кнопка назад для нав бара
    private lazy var backBarButton: UIView = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 10, y: 11, width: 24, height: 24)
        button.tintColor = .black
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.addSubview(button)
        return view
    }()

    // MARK: - Live Cycle

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addRecognizer()
        setTargets()
        setNavigationItems()
    }

    // MARK: - Private Methods

    /// установка айтемов в навигейшн бар
    private func setNavigationItems() {
        navigationItem.rightBarButtonItem = shareBarButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBarButton)
    }

    /// добавление таргетов к кнопкам
    private func setTargets() {
        mainView.coffeSegmentControl.addTarget(
            self,
            action: #selector(segmentedImage),
            for: .valueChanged
        )
        mainView.orderButton.addTarget(
            self,
            action: #selector(goOrderController),
            for: .touchUpInside
        )
    }

    /// добавление нажатий на мои кнопки-вьюхи
    private func addRecognizer() {
        let roastGesture = UITapGestureRecognizer()
        roastGesture.addTarget(self, action: #selector(goToCoffeRoastVC))
        let ingridientGesture = UITapGestureRecognizer()
        ingridientGesture.addTarget(self, action: #selector(goToOptionsVC))
        mainView.ingridientsView.addGestureRecognizer(ingridientGesture)
        mainView.buttonRoastView.addGestureRecognizer(roastGesture)
    }

    /// переход на экран с выбором обжарки
    @objc private func goToCoffeRoastVC() {
        let secondVC = CoffeRoastViewController()
        switch roastImageName {
        case Constants.blackRoastImageName:
            secondVC.mainView.blackButtonRoastView.layer.borderWidth = 1
            secondVC.mainView.blackButtonRoastView.layer.borderColor = UIColor.gray.cgColor
        case Constants.whiteRoastImageName:
            secondVC.mainView.whiteButtonRoastView.layer.borderWidth = 1
            secondVC.mainView.whiteButtonRoastView.layer.borderColor = UIColor.gray.cgColor
        default: break
        }
        secondVC.delegate = self
        present(secondVC, animated: true)
    }

    /// переход на экран с выбором доп компонентов
    @objc private func goToOptionsVC() {
        let secondVC = OptionsViewController()
        secondVC.delegate = self
        present(secondVC, animated: true)
    }

    /// метод меняет картинку кофе в зависимости от выбранного названия в сегментКонтроллере
    @objc private func segmentedImage() {
        mainView.titleImageView.image = UIImage(
            named:
            Constants.coffeImageNames[mainView.coffeSegmentControl.selectedSegmentIndex]
        )
        coffeName = Constants.coffeNames[mainView.coffeSegmentControl.selectedSegmentIndex]
    }

    /// переход на экран с чеком
    @objc private func goOrderController() {
        let secondVc = OrderViewController()
        secondVc.model = model
        secondVc.coffeName = coffeName
        secondVc.pushDelegate = self
        present(secondVc, animated: true)
    }

    ///  переход на предыдущий экран
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }

    /// метод вызывает активити контроллер
    @objc private func share() {
        let activity = UIActivityViewController(
            activityItems: [Constants.promocode],
            applicationActivities: nil
        )
        present(activity, animated: true)
    }
}

/// подписываю на делегат и реализую замену варианта обжарки
extension DetailViewController: RoastTypeDelegate {
    func transfer(_ imageName: String, text: String) {
        roastImageName = imageName
        roastText = text
    }
}

/// подписываю на делегат и реализую передачу модели
extension DetailViewController: CoffeModelDelegate {
    func transfer(model: CoffeModel) {
        self.model = model
        if self.model.optionsMap.isEmpty {
            mainView.ingridientsView.imageView.image = UIImage(named: "pluss")
        } else {
            mainView.ingridientsView.imageView.image = UIImage(named: "окк")
        }
    }
}

extension DetailViewController: PushDelegate {
    func pushVC() {
        let secondVS = SmsViewController()
        navigationController?.pushViewController(secondVS, animated: true)
    }
}
