// PhotoCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с фото для коллекции в профиле
final class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants

    static let reuseID = "PhotoCollectionViewCell"

    // MARK: - Visual Components

    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    // MARK: - Initializators

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public methods

    func configureCell(photo: Photo) {
        clipsToBounds = true
        photoImageView.image = UIImage(named: photo.imageName)
        contentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 - 1.5).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 - 1.5).isActive = true
    }

    // MARK: - Private methods

    private func setConstraint() {
        contentView.addSubview(photoImageView)
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
