// BirthdayListControllerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Основной вью с отображением людей и их дней рождений
final class BirthdayListControllerView: UIView {
    // MARK: - Private Properties

    /// лейбл с названием приложения
    private let titleLabel = UILabel(
        text: "Birthday Reminder",
        font: .boldSystemFont(ofSize: 18),
        alignment: .center,
        numberOfLines: 1,
        textColor: .black,
        frame: CGRect(
            x: 110,
            y: 65,
            width: 209,
            height: 20
        )
    )

    /// экземпляр ячейки человека
    private let personCell = PersonCell()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    /// метод отрисовывает ячейки
    func createPersonCell(person: Person, sizeY: Int) {
        let personCell = PersonCell()
        personCell.nameLabel.text = person.fullName
        personCell.avatarImageView.image = UIImage(named: person.avatarImage)
        personCell.birthdayDayLabel.text = "\(person.birthday) - turns \(person.futureAge)"
        personCell.daysToBirthdayLabel.text = "  \(person.dayTillBirthday)\nDays"
        if person.dayTillBirthday == 0 {
            personCell.cakeImageView.isHidden = false
            personCell.daysToBirthdayLabel.isHidden = true
            personCell.birthdayDayLabel.text = "\(person.birthday) - turns \(person.futureAge)!"
        }
        personCell.frame = CGRect(x: 20, y: sizeY, width: 335, height: 94)
        addSubview(personCell)
    }

    // MARK: - Private Methods

    /// метод  настраивает вью
    private func setViews() {
        backgroundColor = .white
        addSubview(titleLabel)
    }
}
