//
//  ColorUtils.swift
//  WeatherApp_IrinaFerber
//
//  Created by Irina on 08.07.17.
//  Copyright © 2017 Irina. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alphaValue: Double) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alphaValue))
    }

    static func makeImageWithColorAndSize(_ color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func defaultColor() -> UIColor {
        return cobaltColor()
    }
    
    class func cobaltColor() -> UIColor {
        return UIColor(red: 35, green: 61, blue: 148, alphaValue: 1)
    }
    
    class func goldColor() -> UIColor {
        return UIColor(red: 210, green: 171, blue: 16, alphaValue: 1)
    }
    
    class func lightblueColor() -> UIColor {
        return UIColor(red: 2, green: 109, blue: 255, alphaValue: 1)
    }
}
