// BirthdayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// делегат для передачи персона
protocol PersonInfoDelegate: AnyObject {
    func person(_ person: Person)
}

/// контролеер управляющий вью со списком людей и их днями рождения
final class BirthdayListViewController: UIViewController {
    // MARK: - Private Properties

    private let mainView = BirthdayListControllerView()

    private var persons = [
        Person(
            fullName: "Helena Link",
            birthday: "10.03",
            futureAge: 25,
            avatarImage: "Эллипс1",
            dayTillBirthday: 0
        ),
        Person(
            fullName: "Verona Tusk",
            birthday: "20.03",
            futureAge: 39,
            avatarImage: "Эллипс2",
            dayTillBirthday: 10
        ),
        Person(
            fullName: "Alex Smith",
            birthday: "21.04",
            futureAge: 51,
            avatarImage: "Эллипс3",
            dayTillBirthday: 42
        ),
        Person(
            fullName: "Tom Johnson",
            birthday: "05.06",
            futureAge: 18,
            avatarImage: "Эллипс4",
            dayTillBirthday: 87
        )
    ] {
        didSet {
            addPersonCell()
        }
    }

    // MARK: - Initializers

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addPersonCell()
        addBarButton()
    }

    // MARK: - Private Methods

    /// метод добавляет ячейки на экран ( в зависимости сколько их в массиве )
    private func addPersonCell() {
        var startY = 94
        for person in persons {
            mainView.createPersonCell(person: person, sizeY: startY)
            startY += 95
        }
    }

    /// метод добавляет кнопку в навигейшн бар
    private func addBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(goToAppendController)
        )
    }

    /// переход на следующий экран
    @objc private func goToAppendController() {
        let secondVC = ApendPersonViewController()
        secondVC.delegate = self
        present(secondVC, animated: true, completion: nil)
    }
}

/// метод делегата добавляет в массив новго персона
extension BirthdayListViewController: PersonInfoDelegate {
    func person(_ person: Person) {
        persons.append(person)
    }
}
