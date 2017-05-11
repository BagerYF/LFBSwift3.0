//
//  OrderDetailView.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/8.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class OrderDetailView: UIView {
    
    var order: Order? {
        didSet {
            initLabel(label: orderNumberLabel, text: ("订  单  号    " + order!.order_no!))
            initLabel(label: consigneeLabel, text: ("收  货  码    " + order!.checknum!))
            initLabel(label: orderBuyTimeLabel, text: ("下单时间    " + order!.create_time!))
            initLabel(label: deliverTimeLabel, text: "配送时间    " + order!.accept_time!)
            initLabel(label: deliverWayLabel, text: "配送方式    送货上门")
            initLabel(label: payWayLabel, text: "支付方式    在线支付")
            if order?.postscript != nil {
                initLabel(label: remarksLabel, text: "备注信息    " + order!.postscript!)
            } else {
                initLabel(label: remarksLabel, text: "备注信息")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let orderNumberLabel = UILabel()
    let consigneeLabel = UILabel()
    let orderBuyTimeLabel = UILabel()
    let deliverTimeLabel = UILabel()
    let deliverWayLabel = UILabel()
    let payWayLabel = UILabel()
    let remarksLabel = UILabel()
    

    private func initLabel(label: UILabel, text: String) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = YFTextBlackColor
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let leftMargin: CGFloat = 10
        let labelWidth: CGFloat = width - 2 * leftMargin
        let labelHeight: CGFloat = 25
        
        orderNumberLabel.frame  = CGRect(x: leftMargin, y: 5, width: labelWidth, height: labelHeight)
        consigneeLabel.frame    = CGRect(x: leftMargin, y: (orderNumberLabel.y) + orderNumberLabel.height, width: labelWidth, height: labelHeight)
        orderBuyTimeLabel.frame = CGRect(x: leftMargin, y: (consigneeLabel.y) + consigneeLabel.height, width: labelWidth, height: labelHeight)
        deliverTimeLabel.frame  = CGRect(x: leftMargin, y: (orderBuyTimeLabel.y) + orderBuyTimeLabel.height, width: labelWidth, height: labelHeight)
        deliverWayLabel.frame   = CGRect(x: leftMargin, y: (deliverTimeLabel.y) + deliverTimeLabel.height, width: labelWidth, height: labelHeight)
        payWayLabel.frame       = CGRect(x: leftMargin, y: (deliverWayLabel.y) + deliverWayLabel.height, width: labelWidth, height: labelHeight)
        remarksLabel.frame      = CGRect(x: leftMargin, y: (payWayLabel.y) + payWayLabel.height, width: labelWidth, height: labelHeight)
    }
}
