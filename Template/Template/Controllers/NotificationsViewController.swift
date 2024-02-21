// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Перечисление с возможными действиями в коментариях
enum CommentAction: String {
    case mention = "упомянул(-а) вас в комментарии:"
    case like = "понравился ваш комментарий:"
    case newFolder = "появился(-ась) в RMLink. Вы можете быть знакомы"
}

/// Перечисление секций
enum NotificationSection {
    case header
    case toDay
    case thisWeak
}

/// контроллер экрана уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nilHeaderText = "Запросы на подписку"
        static let toDayHeaderText = "Сегодня"
        static let thisWeakHeaderText = "На этой неделе"
        static let titleText = "Уведомления"
    }

    // MARK: - Private properties

    private let mainTabelView = UITableView()
    private let sections: [NotificationSection] = [.header, .toDay, .thisWeak]
    private let cellTypes: [NotificationCell] = [.empty, .comment, .subscribe]
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
        navigationItem.title = Constants.titleText
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

// MARK: - NotificationsViewController + Extension

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
            return getTabelViewCell(
                notification: todayNotifications[indexPath.row],
                indexPath: indexPath,
                tableView: tableView
            )
        } else {
            return getTabelViewCell(
                notification: thisWeakNotifications[indexPath.row],
                indexPath: indexPath,
                tableView: tableView
            )
        }
    }

    func getTabelViewCell(notification: Comment, indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        switch notification.type {
        case .comment:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CommentTableViewCell.reuseID,
                for: indexPath
            ) as? CommentTableViewCell else { return UITableViewCell() }
            cell.configureCell(comment: notification)
            return cell
        case .subscribe:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SubscribeTableViewCell.reuseID,
                for: indexPath
            ) as? SubscribeTableViewCell else { return UITableViewCell() }
            cell.configureCell(comment: notification)
            return cell
        default: return UITableViewCell()
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

// MARK: - NotificationsViewController + Extension

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
