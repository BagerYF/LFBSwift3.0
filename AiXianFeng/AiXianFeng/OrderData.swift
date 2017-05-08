//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/8.
//  Copyright © 2017年 Bager. All rights reserved.
//


import UIKit

class OrderData: NSObject {
    var page: Int = -1
    var code: Int = -1
    var data: [Order]?
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(Order.self)"]
    }
    
    class func loadOrderData(completion:(_ orderArray: Array<Order>?) -> Void) {
        let path = Bundle.main.path(forResource: "MyOrders", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        let json = JSON.init(data as Any)
        
        var tempArray : Array<Any>?
        tempArray = json["data"].arrayObject
        tempArray = Order.mj_objectArray(withKeyValuesArray: tempArray) as? Array<Order>
        for order in tempArray! {
            let tempOrder : Order = order as! Order
            let tempArr = tempOrder.order_goods;
            tempOrder.order_goods = OrderGoods.mj_objectArray(withKeyValuesArray: tempArr) as? [[OrderGoods]]
            
            var btnArr = tempOrder.buttons;
            tempOrder.buttons = OrderButton.mj_objectArray(withKeyValuesArray: btnArr) as? [OrderButton]
            
            btnArr = tempOrder.detail_buttons;
            tempOrder.detail_buttons = OrderButton.mj_objectArray(withKeyValuesArray: btnArr) as? [OrderButton]
            
            let feeArr = tempOrder.fee_list
            tempOrder.fee_list = OrderFeeList.mj_objectArray(withKeyValuesArray: feeArr) as? [OrderFeeList]
            
            let statusArr = tempOrder.status_timeline
            tempOrder.status_timeline = OrderStatus.mj_objectArray(withKeyValuesArray: statusArr) as? [OrderStatus]
        }
        completion(tempArray as? Array<Order>)
    }
}

class Order: NSObject {
    var star: Int = -1
    var comment: String?
    var id: String?
    var order_no: String?
    var accept_name: String?
    var user_id: String?
    var pay_code: String?
    var pay_type: String?
    var distribution: String?
    var status: String?
    var pay_status: String?
    var distribution_status: String?
    var postcode: String?
    var telphone: String?
    var country: String?
    var province: String?
    var city: String?
    var address: String?
    var longitude: String?
    var latitude: String?
    var mobile: String?
    var payable_amount: String?
    var real_amount: String?
    var pay_time: String?
    var send_time: String?
    var create_time: String?
    var completion_time: String?
    var order_amount: String?
    var accept_time: String?
    var lastUpdateTime: String?
    var preg_dealer_type: String?
    var user_pay_amount: String?
    var order_goods: [[OrderGoods]]?
    var enableComment: Int = -1
    var isCommented: Int = -1
    var newStatus: Int = -1
    var status_timeline: [OrderStatus]?
    var fee_list: [OrderFeeList]?
    var buy_num: Int = -1
    var showSendCouponBtn: Int = -1
    var dealer_name: String?
    var dealer_address: String?
    var dealer_lng: String?
    var dealer_lat: String?
    var buttons: [OrderButton]?
    var detail_buttons: [OrderButton]?
    var textStatus: String?
    var in_refund: Int = -1
    var checknum: String?
    var postscript: String?
}

class OrderGoods: NSObject {
    var goods_id: String?
    var goods_price: String?
    var real_price: String?
    var isgift: Int = -1
    var name: String?
    var specifics: String?
    var brand_name: String?
    var img: String?
    var is_gift: Int = -1
    var goods_nums: String?
}

class OrderStatus: NSObject {
    var status_title: String?
    var status_desc: String?
    var status_time: String?
}

class OrderFeeList: NSObject {
    var text: String?
    var value: String?
}

class OrderButton: NSObject {
    var type: Int = -1
    var text: String?
}


