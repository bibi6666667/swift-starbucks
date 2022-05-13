//
//  UIColorExtension.swift
//  starbuckst
//
//  Created by Bibi on 2022/05/11.
//

import UIKit

enum CustomColor {
    case primaryGreen
    case white
    case gray
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, a: Int = 1) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    static func customColor(_ name: CustomColor) -> UIColor {
        switch name {
        case .white: // return #colorLiteral()
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .primaryGreen:
            return #colorLiteral(red: 0, green: 0.7176470588, blue: 0.4666666667, alpha: 1)
        case .gray:
            return #colorLiteral(red: 0.6901960784, green: 0.6901960784, blue: 0.6901960784, alpha: 1)
        }
    }
}
