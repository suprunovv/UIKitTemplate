// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Контроллер с вебВью
final class WebViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let cancelButtonImage = UIImage(systemName: "xmark")
        static let forwardImage = UIImage(named: "forward")
        static let backImage = UIImage(named: "backForward")
        static let reloadImage = UIImage(named: "reload")
    }

    // MARK: - Visual Compontnts

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(Constants.cancelButtonImage, for: .normal)
        button.tintColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()

    // MARK: - Private property

    private let webView = WKWebView()
    let toolBar = UIToolbar()

    private lazy var forwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.forwardImage, for: .normal)
        button.addTarget(self, action: #selector(setupNavigation), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.backImage, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(setupNavigation), for: .touchUpInside)
        return button
    }()

    private lazy var reloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Constants.reloadImage, for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(setupNavigation), for: .touchUpInside)
        return button
    }()

    private let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))

    // MARK: - Initializators

    override func viewDidLoad() {
        super.viewDidLoad()
        setWebViewConstraint()
        loadRequest()
        setCancelButtonConstraint()
        setToolBarConstraints()
        setToolBar()
    }

    // MARK: - Private methods

    private func setToolBar() {
        let forwardButtonItem = UIBarButtonItem(customView: forwardButton)
        let backForwardButtonItem = UIBarButtonItem(customView: backButton)
        let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
        let space = UIBarButtonItem(customView: spaceView)
        let reloadBarButtonItem = UIBarButtonItem(customView: reloadButton)

        toolBar.setItems([
            backForwardButtonItem,
            space,
            forwardButtonItem,
            spacer,
            reloadBarButtonItem
        ], animated: true)
    }

    private func setToolBarConstraints() {
        view.addSubview(toolBar)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        toolBar.bottomAnchor.constraint(
            equalTo: view.bottomAnchor
        ).isActive = true
        toolBar.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }

    private func setWebViewConstraint() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func setCancelButtonConstraint() {
        view.addSubview(cancelButton)
        cancelButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
    }

    private func loadRequest() {
        guard let url = URL(
            string: "https://www.spacex.com/vehicles/starship/"
        ) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func setupNavigation(_ sender: UIButton) {
        switch sender {
        case backButton:
            guard webView.canGoBack else { return }
            webView.goBack()
        case forwardButton:
            guard webView.canGoForward else { return }
            webView.goForward()
        case reloadButton:
            webView.reload()
        default: break
        }
    }

    @objc private func goBack() {
        dismiss(animated: true)
    }
}
