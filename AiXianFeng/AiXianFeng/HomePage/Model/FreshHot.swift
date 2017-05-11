//
//  FreshHot.swift
//  AiXianFeng
//
//  Created by Bager on 2017/4/26.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class FreshHot: NSObject {
    
    class func loadFreshHotData() -> Array<Any> {
        let path = Bundle.main.path(forResource: "首页新鲜热卖", ofType: nil)
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf: url)
        let json = JSON.init(data as Any)
        
        var tempArray : Array<Any>?
        tempArray = json["data"].arrayObject
        tempArray = Goods.mj_objectArray(withKeyValuesArray: tempArray) as? Array<Any>
        
        return tempArray!;
    }
}

class Goods: NSObject {
    //*************************商品模型默认属性**********************************
    /// 商品ID
    var id: String?
    /// 商品姓名
    var name: String?
    var brand_id: String?
    /// 超市价格
    var market_price: String?
    var cid: String?
    var category_id: String?
    /// 当前价格
    var partner_price: String?
    var brand_name: String?
    var pre_img: String?
    
    var pre_imgs: String?
    /// 参数
    var specifics: String?
    var product_id: String?
    var dealer_id: String?
    /// 当前价格
    var price: String?
    /// 库存
    var number: Int = -1
    /// 买一赠一
    var pm_desc: String?
    var had_pm: Int = -1
    /// urlStr
    var img: String?
    /// 是不是精选 0 : 不是, 1 : 是
    var is_xf: Int = 0
    
    //*************************商品模型辅助属性**********************************
    // 记录用户对商品添加次数
    var userBuyNumber: Int = 0
}
