//
//  RandomUsers.swift
//  parsingJSONlab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import Foundation

struct RandomUserData: Codable {
    let results: [RandomUsers]
}

struct RandomUsers: Codable {
    let name: Name
    let email: String
    let location: Address
    let dob: DOB
    let phone: String
}

struct Name: Codable {
    let first: String
    let last: String
}

struct Address: Codable {
    let street : FullAddress
   
}

struct FullAddress: Codable {
    let name: String
    let number: Int
}

struct DOB: Codable {
    let date: String
}

extension RandomUserData {
    static func getUsers() -> [RandomUsers] {
        var randomUserArr = [RandomUsers]()
    
        guard let fileURL = Bundle.main.url(forResource: "randomUser", withExtension: "json") else {
            fatalError("could not get ranUser data")
        }
        do {
            let data = try Data.init(contentsOf: fileURL)
            let randomUserData = try JSONDecoder().decode(RandomUserData.self, from: data)
            randomUserArr = randomUserData.results
        } catch {
            fatalError("\(error)")
        }
     return randomUserArr
    }
}
