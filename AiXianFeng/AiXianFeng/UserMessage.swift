//
//  UserMessage.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/7.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

enum UserMessageType: Int {
    case System = 0
    case User = 1
}

class UserMessage: NSObject {
    
    var id: String?
    var type = -1
    var title: String?
    var content: String?
    var link: String?
    var city: String?
    var noticy: String?
    var send_time: String?
    
    // 辅助参数
    var subTitleViewHeightNomarl: CGFloat = 60
    var cellHeight: CGFloat = 60 + 60 + 20
    var subTitleViewHeightSpread: CGFloat = 0
    
    class func loadSystemMessage(complete: ((_ data: [UserMessage]?, _ error: NSError?) -> ())) {
        
        complete(loadMessage(type: .System)!, nil)
    }
    
    class func loadUserMessage(complete: ((_ data: [UserMessage]?, _ error: NSError?) -> ())) {
        complete(loadMessage(type: .User), nil)
    }
    
    private class func loadMessage(type: UserMessageType) -> [UserMessage]? {
        var messageArray: [UserMessage]?
        
        let path = Bundle.main.path(forResource: ((type == .System) ? "SystemMessage" : "UserMessage"), ofType: nil)
        let data = NSData(contentsOfFile: path!)
        let json = JSON.init(data as Any)
        
        var tempArray : Array<Any>?
        tempArray = json["data"].arrayObject
        tempArray = UserMessage.mj_objectArray(withKeyValuesArray: tempArray) as? Array<UserMessage>
        messageArray = tempArray as? [UserMessage];
        return messageArray
    }
}
