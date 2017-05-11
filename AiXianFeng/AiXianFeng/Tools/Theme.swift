//
//  Theme.swift
//  swiftdoctor
//
//  Created by Bager on 16/5/20.
//  Copyright © 2016年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

// MARK: - 全局常用属性
public let kScreenWidth = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height
public let NavigationH: CGFloat = 64
public let ScreenBounds: CGRect = UIScreen.main.bounds
public let ShopCarRedDotAnimationDuration: TimeInterval = 0.2

// MARK: - Home 属性
public let HotViewMargin: CGFloat = 10
public let HomeCollectionViewCellMargin: CGFloat = 10
public let HomeCollectionTextFont = UIFont.systemFont(ofSize: 14)
public let HomeCollectionCellAnimationDuration: TimeInterval = 1.0

// MARK: - 通知
 /// 首页headView高度改变
public let HomeTableHeadViewHeightDidChange = "HomeTableHeadViewHeightDidChange"
 /// 首页商品库存不足
public let HomeGoodsInventoryProblem = "HomeGoodsInventoryProblem"

public let GuideViewControllerDidFinish = "GuideViewControllerDidFinish"

// MARK: - 广告页通知
public let ADImageLoadSecussed = "ADImageLoadSecussed"
public let ADImageLoadFail = "ADImageLoadFail"


// MARK: - Mine属性
public let CouponViewControllerMargin: CGFloat = 20

// MARK: - HTMLURL
///优惠劵使用规则
public let CouponUserRuleURLString = "http://m.beequick.cn/show/webview/p/coupon?zchtauth=e33f2ac7BD%252BaUBDzk6f5D9NDsFsoCcna6k%252BQCEmbmFkTbwnA&__v=ios4.7&__d=d14ryS0MFUAhfrQ6rPJ9Gziisg%2F9Cf8CxgkzZw5AkPMbPcbv%2BpM4HpLLlnwAZPd5UyoFAl1XqBjngiP6VNOEbRj226vMzr3D3x9iqPGujDGB5YW%2BZ1jOqs3ZqRF8x1keKl4%3D"

// MARK: - Cache路径
public let LFBCachePath: String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!

// MARK: - AuthorURL
public let GitHubURLString: String = "https://github.com/BagerYF"
public let BlogURLString: String = "http://www.jianshu.com/u/25c75c8055c6"

// MARK: - 常用颜色
public let YFGlobalBackgroundColor = UIColor.init(colorLiteralRed: 239 / 255.0, green: 239 / 255.0, blue: 239 / 255.0, alpha: 1)
public let YFMainYellowColor = UIColor.init(colorLiteralRed: 253 / 255.0, green: 212 / 255.0, blue: 49 / 255.0, alpha: 1)
public let YFTextGreyColol = UIColor.init(colorLiteralRed: 130 / 255.0, green: 130 / 255.0, blue: 130 / 255.0, alpha: 1)
public let YFTextBlackColor = UIColor.init(colorLiteralRed: 50 / 255.0, green: 50 / 255.0, blue: 50 / 255.0, alpha: 1)
public let YFNavigationBarWhiteBackgroundColor = UIColor.init(colorLiteralRed: 249 / 255.0, green: 250 / 255.0, blue: 253 / 255.0, alpha: 1)

// MARK: - 购物车管理工具通知
public let LFBShopCarDidRemoveProductNSNotification = "LFBShopCarDidRemoveProductNSNotification"
/// 购买商品数量发生改变
public let LFBShopCarBuyProductNumberDidChangeNotification = "LFBShopCarBuyProductNumberDidChangeNotification"
/// 购物车商品价格发送改变
public let LFBShopCarBuyPriceDidChangeNotification = "LFBShopCarBuyPriceDidChangeNotification"
// MARK: - 购物车ViewController
public let ShopCartRowHeight: CGFloat = 50

// MARK: - 搜索ViewController
public let LFBSearchViewControllerHistorySearchArray = "LFBSearchViewControllerHistorySearchArray"
