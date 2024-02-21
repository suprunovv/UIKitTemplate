// NewslineViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// энам с шрифтами
enum Fonts {
    static let verdana8 = UIFont(name: "Verdana", size: 8)
    static let verdanaBold10 = UIFont(name: "Verdana-Bold", size: 10)
    static let verdanaBold12 = UIFont(name: "Verdana-Bold", size: 12)
    static let verdana10 = UIFont(name: "Verdana", size: 10)
    static let verdana12 = UIFont(name: "Verdana", size: 12)
}

/// контроллер экрана ленты
final class NewslineViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let leftBarItemImage = UIImage(named: "titleRM")
        static let rightBarItemImage = UIImage(named: "smsImage")
    }

    // MARK: - Private properties

    private let cellTypes: [CellType] = [.storys, .firstPost, .recomendation, .secondPosts]

    private let historys = [HistoryView(history: User(
        imageName: "myAva",
        nikName: "Отвалил404",
        isBorder: true
    )), HistoryView(history: User(
        imageName: "vlad",
        nikName: "vlad228",
        isBorder: true
    )), HistoryView(history: User(
        imageName: "vlad",
        nikName: "vlad228",
        isBorder: true
    )), HistoryView(history: User(
        imageName: "vlad",
        nikName: "vlad228",
        isBorder: true
    )), HistoryView(history: User(
        imageName: "vlad",
        nikName: "vlad228",
        isBorder: true
    )), HistoryView(history: User(
        imageName: "vlad",
        nikName: "vlad228",
        isBorder: true
    ))]

    private let profiles = [
        RecommendationProfileView(user: User(
            imageName: "vladosAva",
            nikName: "vlad228",
            isBorder: true
        )),
        RecommendationProfileView(user: User(
            imageName: "vlad",
            nikName: "vlad228",
            isBorder: true
        )),
        RecommendationProfileView(user: User(
            imageName: "vlad",
            nikName: "vlad228",
            isBorder: true
        )),
        RecommendationProfileView(user: User(
            imageName: "vlad",
            nikName: "vlad228",
            isBorder: true
        ))
    ]

    private let posts = [
        Post(
            autorNik: "ВладБекошин228",
            autorImageName: "vladosAva",
            postImageNames: ["samkaViper", "vlad"],
            postDescription: "Вот так вот живем - пердим!",
            likeCount: 15,
            myAvatar: "vlad"
        ),
        Post(
            autorNik: "Vlados228",
            autorImageName: "vlad",
            postImageNames: ["vlad", "vlad", "vlad"],
            postDescription: "ВЛААААДИИИККККККК :)))",
            likeCount: 52,
            myAvatar: "vlad"
        ),
        Post(
            autorNik: "Отвалил404",
            autorImageName: "vlad",
            postImageNames: ["vlad", "vlad"],
            postDescription: "Сходили с владом за кладом, сняли в одно касание :)))",
            likeCount: 5,
            myAvatar: "vlad"
        ),
        Post(
            autorNik: "Отвалил404",
            autorImageName: "vlad",
            postImageNames: ["vlad", "vlad"],
            postDescription: "Сходили с владом за кладом, сняли в одно касание :)))",
            likeCount: 5,
            myAvatar: "vlad"
        )
    ]

    private let tabelView = UITableView(frame: .zero, style: .plain)

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        setTabelView()
    }

    // MARK: - Private methods

    private func setNavigationBar() {
        let leftBarImage = UIImageView(image: Constants.leftBarItemImage)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarImage)
        let rightBarItem = UIBarButtonItem(image: Constants.rightBarItemImage, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightBarItem
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    private func setTabelView() {
        view.addSubview(tabelView)
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        tabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tabelView.separatorStyle = .none
        tabelView.register(
            HistoryTableViewCell.self,
            forCellReuseIdentifier: "HistoryTableViewCell"
        )
        tabelView.register(
            RecommendationsTabelCell.self,
            forCellReuseIdentifier: "RecommendationsTabelCell"
        )
        tabelView.register(
            PublicationTableViewCell.self,
            forCellReuseIdentifier: "PublicationTableViewCell"
        )
        tabelView.rowHeight = UITableView.automaticDimension
        tabelView.dataSource = self
    }
}

/// Настройка датасорса таблицы
extension NewslineViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = cellTypes[section]
        switch cellType {
        case .storys, .firstPost, .recomendation:
            return 1
        default:
            return posts.count - 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = cellTypes[indexPath.section]
        switch items {
        case .storys:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "HistoryTableViewCell",
                for: indexPath
            ) as? HistoryTableViewCell else { fatalError() }
            cell.setHistory(historys: historys)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "PublicationTableViewCell",
                for: indexPath
            ) as? PublicationTableViewCell else { fatalError() }
            cell.setCell(post: posts[0])
            return cell
        case .recomendation:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecommendationsTabelCell",
                for: indexPath
            ) as? RecommendationsTabelCell else { fatalError() }
            cell.setRecommendation(profiles: profiles)
            return cell
        case .secondPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "PublicationTableViewCell",
                for: indexPath
            ) as? PublicationTableViewCell else { fatalError() }
            cell.setCell(post: posts[indexPath.row + 1])
            return cell
        }
    }
}
