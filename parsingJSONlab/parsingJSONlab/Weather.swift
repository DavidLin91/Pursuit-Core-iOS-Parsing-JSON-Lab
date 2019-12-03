//
//  Weather.swift
//  parsingJSONlab
//
//  Created by David Lin on 12/2/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation
 
struct WeatherInfo: Codable {
    let list: [Weather]
}

struct Weather: Codable {
    let name: String
    let main: [String : Double]
    let weather: [Description]
}


struct Description: Codable {
    let description: String
}

extension WeatherInfo {
    
    static func getWeather() -> [Weather] {
        var weatherArr = [Weather]()
        
        guard let fileURL = Bundle.main.url(forResource: "weather", withExtension: "json") else {
            fatalError("Could not retrieve weather info")
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let weatherInfo = try JSONDecoder().decode(WeatherInfo.self, from: data)
            weatherArr = weatherInfo.list
        } catch {
            fatalError("")
        }
        return weatherArr
    }
}
