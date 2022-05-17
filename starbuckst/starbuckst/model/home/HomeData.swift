//
//  HomeData.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/16.
//

import Foundation

// MARK: - HomeData
struct HomeData: Codable {
    let displayName: String
    let yourRecommand: Recommand
    let mainEvent: MainEvent
    let nowRecommand: Recommand

    enum CodingKeys: String, CodingKey {
        case displayName = "display-name"
        case yourRecommand = "your-recommand"
        case mainEvent = "main-event"
        case nowRecommand = "now-recommand"
    }
}

// MARK: - MainEvent
struct MainEvent: Codable {
    let imageUploadPath: String
    let mobTHUM: String

    enum CodingKeys: String, CodingKey {
        case imageUploadPath = "img_UPLOAD_PATH"
        case mobTHUM = "mob_THUM"
    }
}

// MARK: - Recommand
struct Recommand: Codable {
    let products: [String]
}
