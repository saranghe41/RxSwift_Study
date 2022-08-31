//
//  Article.swift
//  4. GoodNews
//
//  Created by 김지은 on 2022/08/31.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c60de1c446ce4b2c86e2a0a73d51f5cd")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String? // optional을 강조하심,,
}
