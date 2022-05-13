//
//  UIFontExtension.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/11.
//

import UIKit

enum CustomFont {
    case santanaBlackSmall
    case santanaBlackMedium
    case santanaBlackLarge
}

extension UIFont {
    
    static func customFont(_ name: CustomFont) -> UIFont {
        
        switch name {
        case .santanaBlackSmall:
            return UIFont(name: "Santana-Black", size: 15) ?? UIFont()
        case .santanaBlackMedium: // set font and size you want
            return UIFont(name: "Santana-Black", size: 20) ?? UIFont()
        case .santanaBlackLarge:
            return UIFont(name: "Santana-Black", size: 30) ?? UIFont()
        }
    }
    
}
