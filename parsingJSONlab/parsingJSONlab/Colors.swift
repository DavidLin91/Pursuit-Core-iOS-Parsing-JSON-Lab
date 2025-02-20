//
//  Colors.swift
//  parsingJSONlab
//
//  Created by David Lin on 12/3/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct ColorsData: Codable {
    let colors: [Color]
}

struct Color: Codable {
    var hex: [String: String]
    var name: ColorName
    var rgb: Rgb
}

struct ColorName: Codable {
    var value: String
}


struct Rgb: Codable {
    var r: Double
    var g: Double
    var b: Double
}

extension ColorsData { // used to get colors
    static func getColors() -> [Color]{
        var colorArr = [Color]()
        
        guard let fileURL = Bundle.main.url(forResource: "color", withExtension: "json") else {
            fatalError("could not get color data")
        }
        do{
            let data = try Data.init(contentsOf: fileURL)
            let colorData = try JSONDecoder().decode( ColorsData.self, from: data)
            colorArr = colorData.colors
        } catch {
            fatalError("\(error)")
        }
        return colorArr
    }
}
