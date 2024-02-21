// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// контроллер экрана уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nilHeaderText = "Запросы на подписку"
        static let toDayHeaderText = "Сегодня"
        static let thisWeakHeaderText = "На этой неделе"
    }

    // MARK: - Private properties

    private let mainTabelView = UITableView()
    private let sections: [NotificationSection] = [.header, .toDay, .thisWeak]
    private let cells: [NotificationCell] = [.empty, .comment, .subscribe]
    private let notifications = [
        Comment(
            nikname: "Vlad228",
            avatarImageName: "vladosAva",
            comment: "ЕЩКЕРЕЕЕ!!!",
            postImageName: "samkaViper",
            action: .like,
            time: "1 час",
            type: .comment
        ),
        Comment(
            nikname: "samkaInsta",
            avatarImageName: "samka",
            comment: "АХАХАХА ДАДА",
            postImageName: "sifi",
            action: .mention,
            time: "3 часа",
            type: .comment
        ),
        Comment(
            nikname: "samkaInsta",
            avatarImageName: "samka",
            comment: "Втф???",
            postImageName: "sifi",
            action: .like,
            time: "3 часа",
            type: .comment
        ),
        Comment(
            nikname: "Закат 99.1",
            avatarImageName: "sifi",
            comment: "",
            postImageName: "sifi",
            action: .newFolder,
            time: "3 часа",
            type: .subscribe
        ),
        Comment(
            nikname: "GikChel",
            avatarImageName: "liza",
            comment: "",
            postImageName: "samkaViper",
            action: .newFolder,
            time: "3 часа",
            type: .subscribe
        ),
        Comment(
            nikname: "samkaInsta",
            avatarImageName: "samka",
            comment: "***, face вот ты флексишь",
            postImageName: "sifi",
            action: .like,
            time: "3 часа",
            type: .comment
        ),
        Comment(
            nikname: "samkaInsta",
            avatarImageName: "samka",
            comment: "",
            postImageName: "vlad",
            action: .newFolder,
            time: "3 часа",
            type: .subscribe
        ),
        Comment(
            nikname: "samkaInsta",
            avatarImageName: "samka",
            comment: "",
            postImageName: "samka",
            action: .newFolder,
            time: "3 часа",
            type: .subscribe
        )
    ]

    private lazy var todayNotifications = Array(self.notifications.prefix(2))
    private lazy var thisWeakNotifications = Array(self.notifications.dropFirst(2))

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTabelView()
    }

    // MARK: - Private methods

    private func setView() {
        view.backgroundColor = .white
        navigationItem.title = "Уведомления"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setTabelView() {
        view.addSubview(mainTabelView)
        mainTabelView.translatesAutoresizingMaskIntoConstraints = false
        mainTabelView.delegate = self
        mainTabelView.dataSource = self
        mainTabelView.rowHeight = UITableView.automaticDimension
        mainTabelView.separatorStyle = .none
        mainTabelView.register(
            CommentTableViewCell.self,
            forCellReuseIdentifier: CommentTableViewCell.reuseID
        )
        mainTabelView.register(
            SubscribeTableViewCell.self,
            forCellReuseIdentifier: SubscribeTableViewCell.reuseID
        )
        mainTabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainTabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

/// настройка таблицы через датасорс
extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        switch section {
        case .header:
            return 0
        case .toDay:
            return todayNotifications.count
        case .thisWeak:
            return thisWeakNotifications.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let notification = todayNotifications[indexPath.row]
            switch notification.type {
            case .comment:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CommentTableViewCell.reuseID,
                    for: indexPath
                ) as? CommentTableViewCell else { fatalError() }
                cell.setCell(comment: notification)
                return cell
            case .subscribe:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SubscribeTableViewCell.reuseID,
                    for: indexPath
                ) as? SubscribeTableViewCell else { fatalError() }
                cell.setCell(comment: notification)
                return cell
            default: return UITableViewCell()
            }
        } else {
            let notification = thisWeakNotifications[indexPath.row]
            switch notification.type {
            case .comment:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CommentTableViewCell.reuseID,
                    for: indexPath
                ) as? CommentTableViewCell else { fatalError() }
                cell.setCell(comment: notification)
                return cell
            case .subscribe:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SubscribeTableViewCell.reuseID,
                    for: indexPath
                ) as? SubscribeTableViewCell else { fatalError() }
                cell.setCell(comment: notification)
                return cell
            default: return UITableViewCell()
            }
        }
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            if indexPath.section == 1 {
                todayNotifications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else {
                thisWeakNotifications.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}

/// настройка таблицы через делегат
extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections[section]
        switch section {
        case .header:
            return Constants.nilHeaderText
        case .toDay:
            return Constants.toDayHeaderText
        case .thisWeak:
            return Constants.thisWeakHeaderText
        }
    }
}
