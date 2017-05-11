//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/6.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit


class ProgressHUDManager {
    
    class func setBackgroundColor(color: UIColor) {
        SVProgressHUD.setBackgroundColor(color)
    }
    
    class func setForegroundColor(color: UIColor) {
        SVProgressHUD.setForegroundColor(color)
    }
    
    class func setSuccessImage(image: UIImage) {
        SVProgressHUD.setSuccessImage(image)
    }
    
    class func setErrorImage(image: UIImage) {
        SVProgressHUD.setErrorImage(image)
    }
    
    class func setFont(font: UIFont) {
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 16))
    }

    class func showImage(image: UIImage, status: String) {
        SVProgressHUD.show(image, status: status)
    }
    
    class func show() {
        SVProgressHUD.show()
    }
    
    class func dismiss() {
        SVProgressHUD.dismiss()
    }
    
    class func showWithStatus(status: String) {
        SVProgressHUD.show(withStatus: status)
    }
    
    class func isVisible() -> Bool {
       return SVProgressHUD.isVisible()
    }
    
    class func showSuccessWithStatus(string: String) {
        SVProgressHUD.showSuccess(withStatus: string)
    }
}
