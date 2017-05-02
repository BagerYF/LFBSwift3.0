//
//  HomePageVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/4/26.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class HomePageVC: BaseVC {
    
    var flag: Int = -1
//    var headView: HomeTableHeadView?
    var collectionView: UICollectionView?
    var lastContentOffsetY: CGFloat = 0
    var isAnimation: Bool = false
    var headData: HeadResources?
    var freshHot: FreshHot?
    var activityArray: Array<Any>?
    var iconsArray: Array<Any>?
    var focusArray: Array<Any>?
    var goodsArray: Array<Any>?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        buildCollectionView()
    }
    
    private func initData() {
        activityArray = HeadResources.loadHomeHeadData(type: 1)
        iconsArray = HeadResources.loadHomeHeadData(type: 2)
        focusArray = HeadResources.loadHomeHeadData(type: 3)
        goodsArray = FreshHot.loadFreshHotData()
    }
    
    private func buildCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: HomeCollectionViewCellMargin, bottom: 0, right: HomeCollectionViewCellMargin)
        layout.headerReferenceSize = CGSize(width: 0, height: 10)
        
        collectionView = UICollectionView(frame: CGRect(x : 0, y : 0, width : kScreenWidth, height : kScreenHeight), collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = YFGlobalBackgroundColor
        collectionView?.register(HomeCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.register(HomeCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
        collectionView?.register(HomeCollectionFooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerView")
        view.addSubview(collectionView!)
        
//        let refreshHeadView = LFBRefreshHeader(refreshingTarget: self, refreshingAction: "headRefresh")
//        refreshHeadView.gifView?.frame = CGRectMake(0, 30, 100, 100)
//        collectionView.mj_header = refreshHeadView
        collectionView?.delaysContentTouches = false
        collectionView?.canCancelContentTouches = true
        
        let wrapView = collectionView?.subviews.first
        
        if wrapView != nil && NSStringFromClass((wrapView?.classForCoder)!).hasPrefix("WrapperView") {
            
            for gesture in wrapView!.gestureRecognizers! {
                
                if NSStringFromClass(gesture.classForCoder).contains("DelayedTouchesBegan") {
                    gesture.isEnabled = false
                    break
                }
            }
        }
    }
}

extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return (activityArray?.count)!;
        } else if section == 1 {
            return (goodsArray?.count)!;
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeCell
        
        if indexPath.section == 0 {
            cell.activities = activityArray![indexPath.row] as? Activities
        } else if indexPath.section == 1 {
            cell.goods = goodsArray![indexPath.row] as? Goods
//            weak var tmpSelf = self
//            cell.addButtonClick = ({ (imageView) -> () in
//                tmpSelf?.addProductsAnimation(imageView)
//            })
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize = CGSize.zero
        if indexPath.section == 0 {
            itemSize = CGSize(width: kScreenWidth - HomeCollectionViewCellMargin * 2, height: 140)
        } else if indexPath.section == 1 {
            itemSize = CGSize(width: (kScreenWidth - HomeCollectionViewCellMargin * 2) * 0.5 - 4, height: 250)
        }
        
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: kScreenWidth, height: HomeCollectionViewCellMargin)
        } else if section == 1 {
            return CGSize(width: kScreenWidth, height: HomeCollectionViewCellMargin * 2)
        }
        
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: kScreenWidth, height: HomeCollectionViewCellMargin)
        } else if section == 1 {
            return CGSize(width: kScreenWidth, height: HomeCollectionViewCellMargin * 5)
        }
        
        return CGSize.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 1) {
            return
        }
        
        if isAnimation
        {
            startAnimation(view: cell, offsetY: 80, duration: 1.0)
        }
    }
    
    private func startAnimation(view: UIView, offsetY: CGFloat, duration: TimeInterval) {
        
        view.transform = CGAffineTransform(translationX: 0, y: offsetY)
        
        UIView.animate(withDuration: duration, animations: { () -> Void in
            view.transform = CGAffineTransform.identity
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if indexPath.section == 1 && isAnimation {
            startAnimation(view: view, offsetY: 60, duration: 0.8)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 1 && kind == UICollectionElementKindSectionHeader {
            
            let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as! HomeCollectionHeaderView
            
            return headView
        }
        
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerView", for: indexPath) as! HomeCollectionFooterView
        
        if indexPath.section == 1 && kind == UICollectionElementKindSectionFooter {
            footerView.showLabel()
            footerView.tag = 100
        } else {
            footerView.hideLabel()
            footerView.tag = 1
        }
        let tap = UITapGestureRecognizer(target: self, action: Selector(("moreGoodsClick:")))
        footerView.addGestureRecognizer(tap)
        
        return footerView
    }
    
    // MARK: 查看更多商品被点击
    func moreGoodsClick(tap: UITapGestureRecognizer) {
        if tap.view?.tag == 100 {
            let tabBarController = UIApplication.shared.keyWindow?.rootViewController as! MainTabBarC
            tabBarController.selectedIndex = 1;
        }
        
    }
    
    // MARK: - ScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 商品添加到购物车动画
//        if animationLayers?.count > 0 {
//            let transitionLayer = animationLayers![0]
//            transitionLayer.hidden = true
//        }
        
        if scrollView.contentOffset.y <= scrollView.contentSize.height {
            isAnimation = lastContentOffsetY < scrollView.contentOffset.y
            lastContentOffsetY = scrollView.contentOffset.y
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if indexPath.section == 0 {
//            let webVC = WebViewController(navigationTitle: headData!.data!.activities![indexPath.row].name!, urlStr: headData!.data!.activities![indexPath.row].customURL!)
//            navigationController?.pushViewController(webVC, animated: true)
//        } else {
//            let productVC = ProductDetailViewController(goods: freshHot!.data![indexPath.row])
//            navigationController?.pushViewController(productVC, animated: true)
//        }
    }
}

