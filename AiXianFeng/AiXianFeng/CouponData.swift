//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/7.
//  Copyright © 2017年 Bager. All rights reserved.
//


import UIKit

class CouponData: NSObject {

    var code: Int = -1
    var msg: String?
    var reqid: String?
    var data: [Coupon]?
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(Coupon.self)"]
    }
    
    class func loadCouponData(completion:(_ couponArray: Array<Coupon>?) -> Void) {
        let path = Bundle.main.path(forResource: "MyCoupon", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        let json = JSON.init(data as Any)
        
        var tempArray : Array<Any>?
        tempArray = json["data"].arrayObject
        tempArray = Coupon.mj_objectArray(withKeyValuesArray: tempArray) as? Array<Coupon>
        completion(tempArray as? Array<Coupon>)
    }
    
}

class Coupon: NSObject {
    var id: String?
    var card_pwd: String?
    /// 开始时间
    var start_time: String?
    /// 结束时间
    var end_time: String?
    /// 金额
    var value: String?
    var tid: String?
    /// 是否被使用 0 使用 1 未使用
    var is_userd: String?
    /// 0 可使用 1 不可使用
    var status: Int = -1
    var true_end_time: String?
    /// 标题
    var name: String?
    var point: String?
    var type: String?
    var order_limit_money: String?
    var desc: String?
    var free_freight: String?
    var city: String?
    var ctime: String?
    
    static func customClassMapping() -> [String : String]? {
        return ["desc" : "\(String.self)"]
    }
}

