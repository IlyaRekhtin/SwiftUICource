//
//  FriendsParseModel.swift
//  SwiftUICourse
//
//  Created by Илья Рехтин on 13.01.2023.
//

import Foundation

import Foundation

// MARK: - Friends
struct FriendsResponse: Codable {
    let friends: Friends
    
    enum CodingKeys: String, CodingKey {
    case friends = "response"
    }
}

// MARK: - Response
struct Friends: Codable {
    var count: Int
    var items: [Friend]
}

class Friend: Codable {
    var id: Int
    var city: City?
    var firstName: String
    var lastName: String
    var isClosed: Bool?
    var photo50: String

    enum CodingKeys: String, CodingKey {
        case id
        case city
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case photo50 = "photo_50"
    }
}

class City: Codable {
    var title: String = ""
}
