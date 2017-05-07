//
//  AdressData.swift
//  LoveFreshBeen
//
//  Created by 维尼的小熊 on 16/1/12.
//  Copyright © 2016年 tianzhongtao. All rights reserved.
//  GitHub地址:https://github.com/ZhongTaoTian/LoveFreshBeen
//  Blog讲解地址:http://www.jianshu.com/p/879f58fe3542
//  小熊的新浪微博:http://weibo.com/5622363113/profile?topnav=1&wvr=6

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
