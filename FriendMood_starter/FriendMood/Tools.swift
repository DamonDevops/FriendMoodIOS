//
//  Tools.swift
//  FriendMood
//
//  Created by Student04 on 07/08/2023.
//  Copyright © 2023 Joris Thiery. All rights reserved.
//

import Foundation
import UIKit

extension UIFont{
    class func openSansSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Semibold", size: size)!
    }
    class func openSansBold(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Bold", size: size)!
    }
    class func openSansLight(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans-Light", size: size)!
    }
    class func openSansRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "OpenSans", size: size)!
    }
    class func robotoBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size)!
    }
    class func robotoRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size)!
    }
}

extension UIColor {

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    class func darkGreyFont() -> UIColor{
        return UIColor(hex: 0x5b5b5b)
    }
    class func lightGreyFont() -> UIColor{
        return UIColor(hex: 0x666666)
    }
    class func placeholderFont() -> UIColor{
        return UIColor(hex: 0x37474f)
    }
}
