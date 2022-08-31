//
//  Task.swift
//  3. GoodList
//
//  Created by 김지은 on 2022/08/25.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
