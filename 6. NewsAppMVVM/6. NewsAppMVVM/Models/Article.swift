//
//  Articles.swift
//  6. NewsAppMVVM
//
//  Created by 김지은 on 2022/09/06.
//

import Foundation

// article response list
struct ArticleResponse: Decodable {
    let articles: [Article]
}

// article model in list
struct Article: Decodable {
    let title: String
    let description: String?
}
