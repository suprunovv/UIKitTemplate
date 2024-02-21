// Models.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// модель для истории
struct User {
    let imageName: String
    let nikName: String
    let isBorder: Bool
}

/// модель для постов
struct Post {
    let autorNik: String
    let autorImageName: String
    let postImageNames: [String]
    let postDescription: String
    let likeCount: Int
    let myAvatar: String
}

/// перечисление типов ячеек
enum CellType {
    case storys
    case firstPost
    case recomendation
    case secondPosts
}

/// перечисление с возможными действиями в коментариях
enum CommentAction: String {
    case mention = "упомянул(-а) вас в комментарии:"
    case like = "понравился ваш комментарий:"
    case newFolder = "появился(-ась) в RMLink. Вы можете быть знакомы"
}

/// модель уведомления c коментарием
struct Comment {
    let nikname: String
    let avatarImageName: String
    let comment: String
    let postImageName: String
    let action: CommentAction
    let time: String
    let type: NotificationCell
}

/// энам с возможными секциями
enum NotificationSection {
    case header
    case toDay
    case thisWeak
}

/// энам с типами ячеек
enum NotificationCell {
    case empty
    case subscribe
    case comment
}
