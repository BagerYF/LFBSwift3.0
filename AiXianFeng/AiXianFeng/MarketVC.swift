//
//  MarketVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/2.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class MarketVC: BaseVC {
    
    var supermarketData: Supermarket?
    var categoryTableView: UITableView!
    var productsVC: ProductsViewController!
    var categoryArray: Array<Any>!
    var categoryDic: Dictionary<String, Any> = [:]
    
    // flag
    var categoryTableViewIsLoadFinish = false
    var productTableViewIsLoadFinish  = false
    
    // MARK : Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addNotification()
        
        initData()
        
        showProgressHUD()
        
        bulidCategoryTableView()
        
        bulidProductsViewController()
        
        loadSupermarketData()
    }
    
    func initData() {
        categoryArray = Supermarket.loadSupermarketData().0
        categoryDic = Supermarket.loadSupermarketData().1
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        if productsVC.productsTableView != nil {
//            productsVC.productsTableView?.reloadData()
//        }
//        NSNotificationCenter.defaultCenter().postNotificationName("LFBSearchViewControllerDeinit", object: nil)
//        navigationController?.navigationBar.barTintColor = LFBNavigationYellowColor
//    }
//    
//    deinit {
//        NSNotificationCenter.defaultCenter().removeObserver(self)
//    }
//    
//    private func addNotification() {
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "shopCarBuyProductNumberDidChange", name: LFBShopCarBuyProductNumberDidChangeNotification, object: nil)
//    }
    
    func shopCarBuyProductNumberDidChange() {
        if productsVC.productsTableView != nil {
            productsVC.productsTableView!.reloadData()
        }
    }
    
    // MARK:- Creat UI
    private func bulidCategoryTableView() {
        categoryTableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth * 0.25, height: kScreenHeight - 64), style: .plain)
        categoryTableView.backgroundColor = YFGlobalBackgroundColor
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.showsHorizontalScrollIndicator = false
        categoryTableView.showsVerticalScrollIndicator = false
//        categoryTableView.isHidden = true;
        view.addSubview(categoryTableView)
        
        let footerView = UIView()
        categoryTableView.tableFooterView = footerView;
    }
    
    private func bulidProductsViewController() {
        productsVC = ProductsViewController()
        productsVC.delegate = self
//        productsVC.view.isHidden = true
        addChildViewController(productsVC)
        view.addSubview(productsVC.view)
        productsVC.reloadData(array: categoryArray, dataDic: categoryDic as! Dictionary<String, Array<Goods>>)
//        weak var tmpSelf = self
//        productsVC.refreshUpPull = {
//            let time = dispatch_time(DISPATCH_TIME_NOW,Int64(1.2 * Double(NSEC_PER_SEC)))
//            dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
//                Supermarket.loadSupermarketData { (data, error) -> Void in
//                    if error == nil {
//                        tmpSelf!.supermarketData = data
//                        tmpSelf!.productsVC.supermarketData = data
//                        tmpSelf?.productsVC.productsTableView?.mj_header.endRefreshing()
//                        tmpSelf!.categoryTableView.reloadData()
//                        tmpSelf!.categoryTableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: true, scrollPosition: .Top)
//                    }
//                }
//            })
//        }
    }
    
    private func loadSupermarketData() {
//        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
//        dispatch_after(time, dispatch_get_main_queue()) { () -> Void in
//            weak var tmpSelf = self
//            Supermarket.loadSupermarketData { (data, error) -> Void in
//                if error == nil {
//                    tmpSelf!.supermarketData = data
//                    tmpSelf!.categoryTableView.reloadData()
//                    tmpSelf!.categoryTableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: true, scrollPosition: .Bottom)
//                    tmpSelf!.productsVC.supermarketData = data
//                    tmpSelf!.categoryTableViewIsLoadFinish = true
//                    tmpSelf!.productTableViewIsLoadFinish = true
//                    if tmpSelf!.categoryTableViewIsLoadFinish && tmpSelf!.productTableViewIsLoadFinish {
//                        tmpSelf!.categoryTableView.hidden = false
//                        tmpSelf!.productsVC.productsTableView!.hidden = false
//                        tmpSelf!.productsVC.view.hidden = false
//                        tmpSelf!.categoryTableView.hidden = false
//                        ProgressHUDManager.dismiss()
//                        tmpSelf!.view.backgroundColor = LFBGlobalBackgroundColor
//                    }
//                }
//            }
//        }
    }
    
    // MARK: - Private Method
    func showProgressHUD() {
//        ProgressHUDManager.setBackgroundColor(UIColor.colorWithCustom(230, g: 230, b: 230))
//        view.backgroundColor = UIColor.white
//        if !ProgressHUDManager.isVisible() {
//            ProgressHUDManager.showWithStatus("正在加载中")
//        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MarketVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CategoryCell.cellWithTableView(tableView: tableView)
        cell.categorie = categoryArray![indexPath.row] as? Categorie
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if productsVC != nil {
            productsVC.categortsSelectedIndexPath = indexPath as NSIndexPath
        }
    }
}

// MARK: - SupermarketViewController
extension MarketVC: ProductsViewControllerDelegate {
    
    func didEndDisplayingHeaderView(section: Int) {
        categoryTableView.selectRow(at: IndexPath(row: section + 1, section: 0), animated: true, scrollPosition: .middle)
    }
    
    func willDisplayHeaderView(section: Int) {
        categoryTableView.selectRow(at: IndexPath(row: section, section: 0), animated: true, scrollPosition: .middle)
    }
}
