//
//  ProductInfo.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/18.
//


import Foundation

// MARK: - ProductInfo
struct ProductInfo: Codable {
    let view: View
}

// MARK: - View
struct View: Codable {
    let productNM : String

    enum CodingKeys: String, CodingKey {
        case productNM = "product_NM"
    }
}
