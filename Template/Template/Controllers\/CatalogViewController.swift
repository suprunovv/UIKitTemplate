// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// экран каталог
class CatalogViewController: UIViewController {
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        button.frame = CGRect(x: 70, y: 300, width: 60, height: 60)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(go), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc func go() {
        let sec = DetailViewController()
        navigationController?.pushViewController(sec, animated: true)
    }
}
