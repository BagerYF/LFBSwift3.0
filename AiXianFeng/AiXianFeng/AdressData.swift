//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/6.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class AdressData: NSObject {

    var code: Int = -1
    var msg: String?
    var data: [Adress]?
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(Adress.self)"]
    }
    
    class func loadMyAdressData(completion:(_ addressArray: Array<Any>?) -> Void) {
        let path = Bundle.main.path(forResource: "MyAdress", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        let json = JSON.init(data as Any)
        
        var tempArray : Array<Any>?
        tempArray = json["data"].arrayObject
        tempArray = Adress.mj_objectArray(withKeyValuesArray: tempArray) as? Array<Any>
        completion(tempArray)
    }
}


class Adress: NSObject {
    
    var accept_name: String?
    var telphone: String?
    var province_name: String?
    var city_name: String?
    var address: String?
    var lng: String?
    var lat: String?
    var gender: String?
}
