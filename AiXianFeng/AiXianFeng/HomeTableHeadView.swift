//
//  HomePageVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/4/26.
//  Copyright © 2017年 Bager. All rights reserved.
//


import UIKit

class HomeTableHeadView: UIView {
    
    private var pageScrollView: PageScrollView?
    private var hotView: HotView?
    weak var delegate: HomeTableHeadViewDelegate?
    var iconsArray: Array<Any>?
    var focusArray: Array<Any>?
    
    
    var tableHeadViewHeight: CGFloat = 0 {
        willSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: HomeTableHeadViewHeightDidChange), object: newValue)
            frame = CGRect(x: 0, y: -newValue, width: kScreenWidth, height: newValue)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildPageScrollView()
        
        buildHotView()
        
        initData()
    }
    
    func initData() {
        iconsArray = HeadResources.loadHomeHeadData(type: 2)
        focusArray = HeadResources.loadHomeHeadData(type: 3)
        
        pageScrollView?.headDataArray = focusArray! as NSArray
        hotView?.headDataArray = iconsArray! as NSArray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 初始化子控件
    func buildPageScrollView() {
        weak var tmpSelf = self
        pageScrollView = PageScrollView(frame: CGRect.zero, placeholder: UIImage(named: "v2_placeholder_full_size")!, focusImageViewClick: { (index) -> Void in
            if tmpSelf!.delegate != nil && ((tmpSelf!.delegate?.responds(to: Selector(("tableHeadView:focusImageViewClick:")))) != nil) {
                tmpSelf?.delegate?.tableHeadView!(headView: tmpSelf!, focusImageViewClick: "")
            }
        })

        addSubview(pageScrollView!)
    }
    
    func buildHotView() {
        weak var tmpSelf = self
        hotView = HotView(frame: CGRect.zero, iconClick: { (index) -> Void in
            if tmpSelf!.delegate != nil && ((tmpSelf!.delegate?.responds(to: Selector(("tableHeadView:iconClick:")))) != nil) {
                tmpSelf?.delegate?.tableHeadView!(headView: tmpSelf!, iconClick: "")
            }
        })
        hotView?.backgroundColor = UIColor.white
        addSubview(hotView!)
    }
    
    //MARK: 布局子控件
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pageScrollView?.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth * 0.31)
        
        hotView?.frame.origin = CGPoint(x: 0, y: (pageScrollView?.y)! + (pageScrollView?.height)!)
        
        tableHeadViewHeight = (hotView?.y)! + (hotView?.height)!
    }
}

// - MARK: Delegate
@objc protocol HomeTableHeadViewDelegate: NSObjectProtocol {
    @objc optional func tableHeadView(headView: HomeTableHeadView, focusImageViewClick url: String)
    @objc optional func tableHeadView(headView: HomeTableHeadView, iconClick url: String)
}
