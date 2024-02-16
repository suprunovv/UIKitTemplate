// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// размер обуви
enum ShoesSize: String {
    case eu35 = "35 EU"
    case eu36 = "36 EU"
    case eu37 = "37 EU"
    case eu38 = "38 EU"
    case eu39 = "39 EU"
}

/// модель обуви
final class Shoes: Identifiable {
    var name: String
    var imageName: String
    var price: Int
    var size: ShoesSize
    var isLike: Bool

    init(name: String, imageName: String, price: Int, size: ShoesSize) {
        self.name = name
        self.imageName = imageName
        self.price = price
        self.size = size
        isLike = false
    }

    func toggleLike() {
        isLike.toggle()
    }
}

/// сингтон с массивами обуви
final class LikeListShoes {
    static let shared = LikeListShoes()
    private var likeShoes: [Shoes] = []
    private init() {}

    func addLikeShoes(shoes: Shoes) {
        shoes.isLike.toggle()
        likeShoes.append(shoes)
    }

    func deleteLikeShoes(shoes: Shoes) {
        for (index, shoes) in likeShoes.enumerated() where shoes.name == shoes.name {
            likeShoes.remove(at: index)
        }
    }

    func getLikeShoes() -> [Shoes] {
        likeShoes
    }
}
