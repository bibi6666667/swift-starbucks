//
//  HTTPMethod.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/16.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
    
    func getRawValue() -> String {
        return self.rawValue
    }
}
