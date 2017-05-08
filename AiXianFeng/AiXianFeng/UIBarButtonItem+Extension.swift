//
//  UIBarButtonItem+Extension.swift
//  LoveFreshBeen
//
//  Created by 维尼的小熊 on 16/1/12.
//  Copyright © 2016年 tianzhongtao. All rights reserved.
//  GitHub地址:https://github.com/ZhongTaoTian/LoveFreshBeen
//  Blog讲解地址:http://www.jianshu.com/p/879f58fe3542
//  小熊的新浪微博:http://weibo.com/5622363113/profile?topnav=1&wvr=6

import UIKit

enum ItemButtonType: Int {
    case Left = 0
    case Right = 1
}

extension UIBarButtonItem {

    class func barButton(title: String, titleColor: UIColor, image: UIImage, hightLightImage: UIImage?, target: AnyObject?, action: Selector, type: ItemButtonType) -> UIBarButtonItem {
        var btn:UIButton = UIButton()
        if type == ItemButtonType.Left {
            btn = ItemLeftButton(type: .custom)
        } else {
            btn = ItemRightButton(type: .custom)
        }
        btn.setTitle(title, for: .normal)
        btn.setImage(image, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.setImage(hightLightImage, for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        
        return UIBarButtonItem(customView: btn)
    }
    
    class func barButton(image: UIImage, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        let btn = ItemLeftImageButton(type: .custom)
        btn.setImage(image, for: UIControlState.normal)
        btn.imageView?.contentMode = UIViewContentMode.center
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        return UIBarButtonItem(customView: btn)
    }
    
    class func barButton(title: String, titleColor: UIColor, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        if title.characters.count == 2 {
            btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -25)
        }
        return UIBarButtonItem(customView: btn)
    }

}
