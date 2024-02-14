// CofeModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// модель заказа кофе
struct Coffe {
    var optionsMap: [String: Int] = [:]
    var totalPrice: Int {
        var sum = 100
        for num in optionsMap.values {
            sum += num
        }
        return sum
    }
}
