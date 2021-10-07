//
//  PublicAPIs.swift
//  PublicAPIs
//
//  Created by Иван Гришин on 07.10.2021.
//

struct PublicAPIsCount: Decodable {
    let count: Int
}

struct PublicAPIs: Decodable {
    let count: Int
    let entries: [APIs]
}

struct APIs: Decodable {
    let API: String?
    let Description: String?
    let Auth: String?
    let HTTPS: Bool
    let Link: String?
    let Category: String?
}

enum Link: String {
    case publicAPIs = "https://api.publicapis.org/entries"
}
