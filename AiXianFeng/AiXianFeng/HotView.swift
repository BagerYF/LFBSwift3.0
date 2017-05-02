//
//  HomePageVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/2.
//  Copyright © 2017年 Bager. All rights reserved.
//


import UIKit

class HotView: UIView {

    private let iconW = (kScreenWidth - 2 * HotViewMargin) * 0.25
    private let iconH: CGFloat = 80
    
    var iconClick:((_ index: Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect, iconClick: @escaping ((_ index: Int) -> Void)) {
        self.init(frame:frame)
        self.iconClick = iconClick
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: 模型的Set方法
    var headDataArray: NSArray? {
        didSet {
            if (headDataArray?.count)! > 0 {
                
//                if headData!.icons!.count % 4 != 0 {
//                    self.rows = headData!.icons!.count / 4 + 1
//                } else {
//                    self.rows = headData!.icons!.count / 4
//                }
                self.rows = 1;
                var iconX: CGFloat = 0
                var iconY: CGFloat = 0

                for i in 0...3 {
                    iconX = CGFloat(i % 4) * iconW + HotViewMargin
                    iconY = iconH * CGFloat(i / 4)
                    let icon = IconImageTextView(frame: CGRect(x: iconX, y: iconY, width: iconW, height: iconH), placeholderImage: UIImage(named: "icon_icons_holder")!)
                    
                    icon.tag = i
                    let hot = headDataArray![i] as! Activities
                    icon.activitie = hot
                    let tap = UITapGestureRecognizer(target: self, action: Selector(("iconClick:")))
                    icon.addGestureRecognizer(tap)
                    addSubview(icon)
                }
            }
        }
    }
// MARK: rows数量
    private var rows: Int = 0 {
        willSet {
            bounds = CGRect(x: 0, y: 0, width: kScreenWidth, height: iconH * CGFloat(newValue))
        }
    }

// MARK:- Action
    func iconClick(tap: UITapGestureRecognizer) {
        if iconClick != nil {
            iconClick!(tap.view!.tag)
        }
    }
}

