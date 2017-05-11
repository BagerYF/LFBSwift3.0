//
//  UserInfo.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/9.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class UserInfo: NSObject {
    
    private static let instance = UserInfo()
    
    private var allAdress: [Adress]?
    
    class var sharedUserInfo: UserInfo {
        return instance
    }
    
    func hasDefaultAdress() -> Bool {
        
        if allAdress != nil {
            return true
        } else {
            return false
        }
    }
    
    func setAllAdress(adresses: [Adress]) {
        allAdress = adresses
    }
    
    func cleanAllAdress() {
        allAdress = nil
    }
    
    func defaultAdress() -> Adress? {
        if allAdress == nil {
            weak var tmpSelf = self
            
            AdressData.loadMyAdressData { (addressArray) -> Void in
                if (addressArray?.count)! > 0 {
                    tmpSelf!.allAdress = addressArray as? [Adress]
                } else {
                    tmpSelf?.allAdress?.removeAll()
                }
            }
            
            return (allAdress?.count)! > 1 ? allAdress![0] : nil
        } else {
            return allAdress![0]
        }
    }
    
    func setDefaultAdress(adress: Adress) {
        if allAdress != nil {
            allAdress?.insert(adress, at: 0)
        } else {
            allAdress = [Adress]()
            allAdress?.append(adress)
        }
    }
}
