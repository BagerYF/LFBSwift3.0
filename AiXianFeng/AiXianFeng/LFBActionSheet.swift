//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/6.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

enum ShareType: Int {
    case WeiXinMyFriend = 1
    case WeiXinCircleOfFriends = 2
    case SinaWeiBo = 3
    case QQZone = 4
}

class LFBActionSheet: NSObject, UIActionSheetDelegate {
    
    private var selectedShaerType: ((_ shareType: ShareType) -> ())?
    private var actionSheet: UIActionSheet?
    
    func showActionSheetViewShowInView(inView: UIView, selectedShaerType: @escaping ((_ shareType: ShareType) -> ())) {
        
        actionSheet = UIActionSheet(title: "分享到",
            delegate: self, cancelButtonTitle: "取消",
            destructiveButtonTitle: nil,
            otherButtonTitles: "微信好友", "微信朋友圈", "新浪微博", "QQ空间")
        
        self.selectedShaerType = selectedShaerType
        
        actionSheet?.show(in: inView)
        
    }
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        print(buttonIndex)
        if selectedShaerType != nil {
            
            switch buttonIndex {

            case ShareType.WeiXinMyFriend.rawValue:
                selectedShaerType!(.WeiXinMyFriend)
                break
                
            case ShareType.WeiXinCircleOfFriends.rawValue:
                selectedShaerType!(.WeiXinCircleOfFriends)
                break
                
            case ShareType.SinaWeiBo.rawValue:
                selectedShaerType!(.SinaWeiBo)
                break
                
            case ShareType.QQZone.rawValue:
                selectedShaerType!(.QQZone)
                break
                
            default:
                break
            }
        }
    }
    
}
