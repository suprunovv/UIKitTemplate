// Comment.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Mодель уведомления c коментарием
struct Comment {
    /// ник автора
    let nikname: String
    /// аватар автора
    let avatarImageName: String
    /// комментарий
    let comment: String
    /// картинка поста к которому коммент
    let postImageName: String
    /// тип дейстия
    let action: CommentAction
    /// время
    let time: String
    /// тип ячейки
    let type: NotificationCell
}
