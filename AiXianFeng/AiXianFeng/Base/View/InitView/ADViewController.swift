//
//  ADViewController.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/11.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class ADViewController: UIViewController {
    
    lazy var backImageView: UIImageView = {
        let backImageView = UIImageView()
        backImageView.frame = ScreenBounds
        return backImageView
    }()

    var imageName: String? {
        didSet {
//            var placeholderImageName: String?
//            switch UIDevice.currentDeviceScreenMeasurement() {
//            case 3.5:
//                placeholderImageName = "iphone4"
//            case 4.0:
//                placeholderImageName = "iphone5"
//            case 4.7:
//                placeholderImageName = "iphone6"
//            default:
//                placeholderImageName = "iphone6s"
//            }
            
            backImageView.sd_setImage(with:  URL(string: imageName!), placeholderImage: UIImage(named: "iphone6"))
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { 
                UIApplication.shared.isStatusBarHidden = false
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: ADImageLoadSecussed), object: self.backImageView.image)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backImageView)
        UIApplication.shared.isStatusBarHidden = true
    }
}
