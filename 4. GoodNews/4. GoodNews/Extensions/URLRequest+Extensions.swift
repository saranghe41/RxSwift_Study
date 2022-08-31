//
//  URLRequest+Extensions.swift
//  4. GoodNews
//
//  Created by 김지은 on 2022/08/31.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T? in
                return try? JSONDecoder().decode(T.self, from: data)
            }.asObservable()
    }
}
