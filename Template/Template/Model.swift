// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Синглтон с почтой и паролем
final class RegisterModel {
    static let shared = RegisterModel()
    var password: String = ""
    var email: String = ""
    private init() {}

    func updateValue(password: String, email: String) {
        self.password = password
        self.email = email
    }
}
