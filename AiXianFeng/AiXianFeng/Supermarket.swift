//
//  MarketVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/3.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class Supermarket: NSObject {
    
    class func loadSupermarketData() -> (Array<Any> , Dictionary<String, Array<Any>>){
        let path = Bundle.main.path(forResource: "supermarket", ofType: nil)
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf: url)
        let json = JSON.init(data as Any)
        
        var tempArray : Array<Any>?
        tempArray = json["data"]["categories"].arrayObject
        tempArray = Categorie.mj_objectArray(withKeyValuesArray: tempArray) as? Array<Any>
        
        var tempDic : Dictionary<String, Array<Any>>
        tempDic = json["data"]["products"].dictionaryObject as! Dictionary<String, NSArray> as! Dictionary<String, Array<Any>>
        
        for (key, value) in tempDic {
            let tempArr : Array  = Goods.mj_objectArray(withKeyValuesArray: value) as! Array<Any>
            tempDic[key] = tempArr;
        }
        
        return (tempArray!, tempDic);
    }
}

class Categorie: NSObject {
    var id: String?
    var name: String?
    var sort: String?
}
