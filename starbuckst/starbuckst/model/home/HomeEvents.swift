//
//  Events.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/13.
//

import Foundation
import UIKit

import Foundation

// MARK: - HomeEvents
struct HomeEvents: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let imgUPLOADPATH: String
    let title : String
    let mobTHUM: String
    
    enum CodingKeys: String, CodingKey {
        case imgUPLOADPATH = "img_UPLOAD_PATH"
        case title
        case mobTHUM = "mob_THUM"
    }
}
