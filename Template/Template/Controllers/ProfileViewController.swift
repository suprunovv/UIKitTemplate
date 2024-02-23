// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Kонтроллер экрана профиль
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let lockImage = UIImage(named: "lock")
        static let cornerPlus = UIImage(named: "cornerPlus")
        static let tabelImage = UIImage(named: "tabel")
        static let nikname = "otvalil404"
    }

    enum CellType {
        case profile
        case story
        case post
    }

    // MARK: - Visual component

    private let lockButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.lockImage, for: .normal)
        button.tintColor = .black
        return button
    }()

    private let nameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.nikname, for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = .verdanaBold18
        return button
    }()

    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.cornerPlus, for: .normal)
        button.tintColor = .black
        return button
    }()

    private let tabelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.tabelImage, for: .normal)
        button.tintColor = .black
        return button
    }()

    // MARK: - Mok data

    private let cellTyes: [CellType] = [.profile, .story, .post]

    private let storyArray = [
        ProfileStoryView(story: Story(
            imageName: "liza",
            storyName: "НГ - 2023",
            storyImageName: "newYear23"
        )),
        ProfileStoryView(story: Story(
            imageName: "myAva",
            storyName: "2017",
            storyImageName: "vibe6"
        )),
        ProfileStoryView(story: Story(
            imageName: "sifi",
            storyName: "im music",
            storyImageName: "molly"
        )),
        ProfileStoryView(story: Story(
            imageName: "vladosAva",
            storyName: "тг кружки",
            storyImageName: "telega"
        )),
        ProfileStoryView(story: Story(
            imageName: "myAva",
            storyName: "азазаз",
            storyImageName: "vibe7"
        )),
        ProfileStoryView(story: Story(
            imageName: "vibe4",
            storyName: "так просто",
            storyImageName: "vibe9"
        )),
        ProfileStoryView(story: Story(
            imageName: "vlad",
            storyName: "и тд и тп",
            storyImageName: "vibe2"
        ))
    ]

    // MARK: - Private property

    private let mainTabelView = UITableView()

    // MARK: - Iniializators

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupMainTabelView()
        registerCells()
    }

    // MARK: - Private methods

    private func setupNavigationBar() {
        let lockBarButton = UIBarButtonItem(customView: lockButton)
        let niknameBarButton = UIBarButtonItem(customView: nameButton)
        let plusBarButton = UIBarButtonItem(customView: plusButton)
        let tabelBarButton = UIBarButtonItem(customView: tabelButton)

        navigationItem.setLeftBarButtonItems(
            [lockBarButton, niknameBarButton],
            animated: true
        )
        navigationItem.setRightBarButtonItems(
            [tabelBarButton, plusBarButton],
            animated: true
        )
        navigationController?.navigationBar.tintColor = .black
    }

    private func registerCells() {
        mainTabelView.register(
            ProfileTableViewCell.self,
            forCellReuseIdentifier: ProfileTableViewCell.reuseID
        )
        mainTabelView.register(
            ProfileStoryTableViewCell.self,
            forCellReuseIdentifier: ProfileStoryTableViewCell.reuseID
        )
        mainTabelView.register(
            PostCollectionTabelViewCell.self,
            forCellReuseIdentifier: PostCollectionTabelViewCell.reuseID
        )
    }

    private func setupMainTabelView() {
        view.addSubview(mainTabelView)
        mainTabelView.separatorStyle = .none
        mainTabelView.showsVerticalScrollIndicator = false
        mainTabelView.rowHeight = UITableView.automaticDimension
        mainTabelView.dataSource = self
        mainTabelView.translatesAutoresizingMaskIntoConstraints = false
        mainTabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainTabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK: - ProfileViewController + Extension

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTyes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = cellTyes[indexPath.section]

        switch section {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileTableViewCell.reuseID,
                for: indexPath
            ) as? ProfileTableViewCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        case .story:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileStoryTableViewCell.reuseID,
                for: indexPath
            ) as? ProfileStoryTableViewCell else { return UITableViewCell() }
            cell.configureCell(storys: storyArray, delegate: self)
            return cell
        case .post:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostCollectionTabelViewCell.reuseID,
                for: indexPath
            ) as? PostCollectionTabelViewCell else { return UITableViewCell() }
            return cell
        }
    }
}

extension ProfileViewController: ProfileStoryDelegate {
    func setStoryScreen(story: Story) {
        let fullStoryScreen = FullStoryScreenViewController()
        fullStoryScreen.configureScreen(story: story)
        fullStoryScreen.modalPresentationStyle = .fullScreen
        present(fullStoryScreen, animated: true, completion: nil)
    }
}

extension ProfileViewController: LinkDelegate {
    func openWebView() {
        let webViewController = WebViewController()
        webViewController.modalPresentationStyle = .fullScreen
        present(webViewController, animated: true)
    }
}
