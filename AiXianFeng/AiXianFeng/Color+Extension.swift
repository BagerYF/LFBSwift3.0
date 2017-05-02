//
//  Color+Extension.swift
//  LoveFreshBeen
//
//  Created by 维尼的小熊 on 16/1/12.
//  Copyright © 2016年 tianzhongtao. All rights reserved.
//  GitHub地址:https://github.com/ZhongTaoTian/LoveFreshBeen
//  Blog讲解地址:http://www.jianshu.com/p/879f58fe3542
//  小熊的新浪微博:http://weibo.com/5622363113/profile?topnav=1&wvr=6

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
