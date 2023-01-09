//
//  ProductImage.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/18.
//

import Foundation

// MARK: - ProductImage
struct ProductImage: Codable {
    let file: [File]
}

// MARK: - File
struct File: Codable {
    let filePATH : String
    let imgUPLOADPATH: String
    
    enum CodingKeys: String, CodingKey {
        case filePATH = "file_PATH"
        case imgUPLOADPATH = "img_UPLOAD_PATH"
        
    }
}
