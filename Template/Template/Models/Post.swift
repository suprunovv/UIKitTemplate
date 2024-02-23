// Post.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Mодель для постов
struct Post {
    /// ник автора
    let autorNik: String
    /// аватар автора
    let autorImageName: String
    /// названия картинок в посте
    let postImageNames: [String]
    /// описание поста
    let postDescription: String
    /// количество лайков
    let likeCount: Int
    /// ваш аватар
    let myAvatar: String
}
