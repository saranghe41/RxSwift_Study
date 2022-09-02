//
//  URL+Extensions.swift
//  5. GoodWeather
//
//  Created by 김지은 on 2022/09/02.
//

import Foundation

extension URL {
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=e270e15dd2a08a1470d05ea45b4431f9&units=imperial")
    }
}
