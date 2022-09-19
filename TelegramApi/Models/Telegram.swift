//
//  Telegram.swift
//  TelegramApi
//
//  Created by Илья on 19.09.2022.
//

import Foundation

struct Telegram: Decodable {
    let constructors: [Constructors]
    let methods: [Method]
}

struct Constructors: Decodable {
    let id: String
    let predicate: String
    let params: [Param]?
    let type: String
}

struct Method: Decodable {
    let id: String
    let method: String
    let params: [Param]?
    let type: String
}

struct Param: Decodable {
    let name: String
    let type: String
}


