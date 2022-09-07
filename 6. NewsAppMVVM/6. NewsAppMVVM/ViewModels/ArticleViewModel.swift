//
//  ArticleViewModel.swift
//  6. NewsAppMVVM
//
//  Created by 김지은 on 2022/09/07.
//

import Foundation
import RxSwift
import RxCocoa


// ArticleList에 대한 ViewModel
struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

// AritcleListViewModel extension 기능
extension ArticleListViewModel {
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
}

extension ArticleListViewModel {
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesVM[index]
    }
}


// Article에 대한 ViewModel
struct ArticleViewModel {
    let article: Article
    
    // 생성자
    init(_ article: Article) {
        self.article = article
    }
}

// ArticleViewModel extension 기능
extension ArticleViewModel {
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}
