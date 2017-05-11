//
//  SearchProducts.swift
//  AiXianFeng
//
//  Created by Bager on 2017/4/24.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class SearchProducts: NSObject {
    var code: Int = -1
    var msg: String?
    var reqid: String?
    
    class func loadSearchData(completion:((_ searchArray: Array<Goods>) -> Void)) {
        let path = Bundle.main.path(forResource: "促销", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        let json = JSON.init(data as Any)
        
        var tempArray : Array<Any>?
        tempArray = json["data"].arrayObject
        tempArray = Goods.mj_objectArray(withKeyValuesArray: tempArray) as? Array<Goods>
        completion(tempArray as! Array<Goods>)
    }
}
