//
//  HomePageVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/4/26.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class HeadResources: NSObject {

//    var activityArray: Array<Any>?1
//    var iconsArray: Array<Any>?2
//    var focusArray: Array<Any>?3
    
    class func loadHomeHeadData(type : Int) -> Array<Any> {
        let path = Bundle.main.path(forResource: "首页焦点按钮", ofType: nil)
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf: url)
        let json = JSON.init(data as Any)
        
        var tempStr : String?
        if type == 1 {
            tempStr = "activities"
        }
        else if type == 2 {
            tempStr = "icons"
        }
        else if type == 3 {
            tempStr = "focus"
        }
        
        var tempArray : Array<Any>?
        tempArray = json["data"][tempStr!].arrayObject
        tempArray = Activities.mj_objectArray(withKeyValuesArray: tempArray) as? Array<Any>
        
        return tempArray!;
    }
}

class Activities: NSObject {
    var id: String?
    var name: String?
    var img: String?
    var topimg: String?
    var jptype: String?
    var trackid: String?
    var mimg: String?
    var customURL: String?
}
