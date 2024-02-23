// PostCollectionTabelViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячкйка с коллекцией фото
final class PostCollectionTabelViewCell: UITableViewCell {
    static let reuseID = "PostCollectionTabelViewCell"

    private let photos = [
        Photo(id: 1, imageName: "vibe1"),
        Photo(id: 2, imageName: "vibe2"),
        Photo(id: 3, imageName: "vibe3"),
        Photo(id: 4, imageName: "vibe4"),
        Photo(id: 5, imageName: "vibe5"),
        Photo(id: 6, imageName: "vibe6"),
        Photo(id: 7, imageName: "vibe7"),
        Photo(id: 8, imageName: "vibe8"),
        Photo(id: 9, imageName: "vibe9"),
        Photo(id: 10, imageName: "vibe10")
    ]

    private var postCollectionView: UICollectionView!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        setupCollectionView()
        selectionStyle = .none
    }

    private func setupCollectionView() {
        postCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        postCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postCollectionView.dataSource = self
        postCollectionView.showsVerticalScrollIndicator = false
        postCollectionView.register(
            PhotoCollectionViewCell.self,
            forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseID
        )

        contentView.addSubview(postCollectionView)
        postCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        postCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 1.5
        layout.minimumInteritemSpacing = 1.5
        return layout
    }
}

// MARK: - PostCollectionTabelViewCell + Extension

extension PostCollectionTabelViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCollectionViewCell.reuseID,
            for: indexPath
        ) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(photo: photos[indexPath.item])
        return cell
    }
}
