//
//  UIFontExtension.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/11.
//

import UIKit

enum CustomFont {
    case santanaBlack
}

extension UIFont {
    
    static func customFont(_ name: CustomFont) -> UIFont {
        
        switch name {
        case .santanaBlack: // set font and size you want
            return UIFont(name: "Santana-Black", size: 20) ?? UIFont()
        
        }
    }
    
}
