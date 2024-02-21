// PublicationTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка с постом
final class PublicationTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let likeImage = UIImage(systemName: "heart")
        static let commentImage = UIImage(named: "message")
        static let shareImage = UIImage(systemName: "paperplane")
        static let bookmarkImage = UIImage(systemName: "bookmark")
        static let moreButtonImage = UIImage(named: "more")
        static let commentPlaceholder = "Комментировать..."
    }

    // MARK: - Visual content

    private let imagePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()

    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()

    private let niknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.verdanaBold12
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let likedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.verdanaBold12
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.verdana12
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.likeImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.commentImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let bookMarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.bookmarkImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.shareImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    private let commentTextFiled: UITextField = {
        let textFiled = UITextField()
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        textFiled.borderStyle = .none
        textFiled.font = UIFont.verdana10
        textFiled.placeholder = Constants.commentPlaceholder
        return textFiled
    }()

    private let timeOutLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.verdana10
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10 минут назад"
        return label
    }()

    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.moreButtonImage, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        addSubviews()
        setConstraints()
        setThirdConstraints()
        setFourthConstraints()
        setSecondConstraints()
        setButtons()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public methods

    func configureCell(post: Post) {
        avatarImageView.image = UIImage(named: post.autorImageName)
        niknameLabel.text = post.autorNik
        descriptionLabel.attributedText = getAtributedText(
            nikname: post.autorNik,
            comment: post.postDescription
        )
        commentImageView.image = UIImage(named: post.myAvatar)
        likedLabel.text = "Нравится: \(post.likeCount)"
        imagePageControl.numberOfPages = post.postImageNames.count
        mainScrollView.delegate = self
        var startLeading: CGFloat = 0
        if post.postImageNames.count <= 1 {
            imagePageControl.isHidden = true
        }
        for image in post.postImageNames {
            let image = UIImageView(image: UIImage(named: image))
            image.translatesAutoresizingMaskIntoConstraints = false
            mainScrollView.addSubview(image)
            image.leadingAnchor.constraint(
                equalTo: mainScrollView.leadingAnchor, constant: startLeading
            ).isActive = true
            image.heightAnchor.constraint(equalToConstant: 239).isActive = true
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            image.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
            startLeading += UIScreen.main.bounds.width
        }
        mainScrollView.contentSize.width = startLeading
    }

    // MARK: - Private methods

    private func getAtributedText(
        nikname: String,
        comment: String
    ) -> NSAttributedString {
        let fullText = "\(nikname) \(comment)"

        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.black,
            range: (fullText as NSString).range(of: nikname)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.boldSystemFont(ofSize: 12),
            range: (fullText as NSString).range(of: nikname)
        )

        return attributedString
    }

    private func setButtons() {
        let buttons = [likeButton, commentButton, shareButton]
        var startLeading = 10
        for button in buttons {
            addSubview(button)
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(startLeading)).isActive = true
            button.widthAnchor.constraint(equalToConstant: 24).isActive = true
            button.topAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: 8).isActive = true
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120).isActive = true
            startLeading += 32
        }
    }

    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(niknameLabel)
        contentView.addSubview(mainScrollView)
        addSubview(likedLabel)
        addSubview(bookMarkButton)
        addSubview(descriptionLabel)
        addSubview(commentImageView)
        addSubview(moreButton)
        addSubview(commentTextFiled)
        addSubview(timeOutLabel)
        addSubview(imagePageControl)
    }

    private func setConstraints() {
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -333).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -401).isActive = true
        niknameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48).isActive = true
        niknameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -220).isActive = true
        niknameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        niknameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -401).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -152).isActive = true
    }

    private func setThirdConstraints() {
        likedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13).isActive = true
        likedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -255).isActive = true
        likedLabel.topAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: 38).isActive = true
        likedLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -99).isActive = true
        bookMarkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 343).isActive = true
        bookMarkButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        bookMarkButton.topAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: 8).isActive = true
        bookMarkButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 358).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -63).isActive = true
    }

    private func setSecondConstraints() {
        commentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13).isActive = true
        commentImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -342).isActive = true
        commentImageView.topAnchor.constraint(equalTo: topAnchor, constant: 392).isActive = true
        commentImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -39).isActive = true
        commentTextFiled.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36).isActive = true
        commentTextFiled.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -189).isActive = true
        commentTextFiled.topAnchor.constraint(equalTo: topAnchor, constant: 394).isActive = true
        commentTextFiled.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42).isActive = true
    }

    private func setFourthConstraints() {
        timeOutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13).isActive = true
        timeOutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -212).isActive = true
        timeOutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 416).isActive = true
        timeOutLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        moreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 348).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13).isActive = true
        moreButton.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        moreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -413).isActive = true
        imagePageControl.translatesAutoresizingMaskIntoConstraints = false
        imagePageControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imagePageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -120).isActive = true
    }
}

// MARK: - PublicationTableViewCell + UIScrollViewDelegate

extension PublicationTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(mainScrollView.contentOffset.x / mainScrollView.frame.width)
        imagePageControl.currentPage = Int(pageIndex)
    }
}
