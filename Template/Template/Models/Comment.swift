// Comment.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Mодель уведомления c коментарием
struct Comment {
    let nikname: String
    let avatarImageName: String
    let comment: String
    let postImageName: String
    let action: CommentAction
    let time: String
    let type: NotificationCell
}
