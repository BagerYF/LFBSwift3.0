//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/8.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

extension UIColor {

    class func colorWithCustom(r: CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.colorWithCustom(r: r, g: g, b: b)
    }
    
    class func hex(hex:String) ->UIColor {
        
        var colorString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (colorString.hasPrefix("#")) {
            let index = colorString.index(colorString.startIndex, offsetBy:1)
            colorString = colorString.substring(from: index)
        }
        
        if (colorString.characters.count != 6) {
            return UIColor.red
        }
        
        let redIndex = colorString.index(colorString.startIndex, offsetBy: 2)
        let redString = colorString.substring(to: redIndex)
        let otherString = colorString.substring(from: redIndex)
        let greenIndex = otherString.index(otherString.startIndex, offsetBy: 2)
        let greenString = otherString.substring(to: greenIndex)
        let blueIndex = colorString.index(colorString.endIndex, offsetBy: -2)
        let blueString = colorString.substring(from: blueIndex)
        
        var red:CUnsignedInt = 0, green:CUnsignedInt = 0, blue:CUnsignedInt = 0;
        Scanner(string: redString).scanHexInt32(&red)
        Scanner(string: greenString).scanHexInt32(&green)
        Scanner(string: blueString).scanHexInt32(&blue)
        
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(1))
    }

}
