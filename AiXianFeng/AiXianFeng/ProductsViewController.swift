//
//  MarketVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/3.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class ProductsViewController: BaseVC {
    
    let headViewIdentifier   = "supermarketHeadView"
    var lastOffsetY: CGFloat = 0
    var isScrollDown         = false
    var productsTableView: UITableView?
    weak var delegate: ProductsViewControllerDelegate?
    var refreshUpPull:(() -> ())?
    var categoryPArray: Array<Any>!
    var categoryPDic: Dictionary<String, Any> = [:]
    
    var goodsData: () {
        didSet {
            
        }
    }
    
    func reloadData(array : Array<Any>, dataDic : Dictionary<String, Array<Goods>>) {
        categoryPArray = Supermarket.loadSupermarketData().0;
        categoryPDic = Supermarket.loadSupermarketData().1;
        productsTableView?.reloadData()
    }
    
    var categortsSelectedIndexPath: NSIndexPath? {
        didSet {
            productsTableView?.selectRow(at: IndexPath(row: 0, section: (categortsSelectedIndexPath?.row)!), animated: true, scrollPosition: .top)
        }
    }
    
    
    // MARK: - Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "shopCarBuyProductNumberDidChange", name: LFBShopCarBuyProductNumberDidChangeNotification, object: nil)
        
        view = UIView(frame: CGRect(x: kScreenWidth * 0.25, y: 0, width: kScreenWidth * 0.75, height: kScreenHeight - NavigationH))
        buildProductsTableView()
    }
    
//    deinit {
//        NSNotificationCenter.defaultCenter().removeObserver(self)
//    }
    
    // MARK: - Build UI
    private func buildProductsTableView() {
        productsTableView = UITableView(frame: view.bounds, style: .plain)
        productsTableView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 49, right: 0)
        productsTableView?.backgroundColor = YFGlobalBackgroundColor
        productsTableView?.delegate = self
        productsTableView?.dataSource = self
        productsTableView?.register(SupermarketHeadView.self, forHeaderFooterViewReuseIdentifier: headViewIdentifier)
        productsTableView?.tableFooterView = buildProductsTableViewTableFooterView()
        
//        let headView = LFBRefreshHeader(refreshingTarget: self, refreshingAction: "startRefreshUpPull")
//        productsTableView?.mj_header = headView
        
        view.addSubview(productsTableView!)
    }
    
    private func buildProductsTableViewTableFooterView() -> UIView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: productsTableView!.width, height: 70))
        imageView.contentMode = UIViewContentMode.center
        imageView.image = UIImage(named: "v2_common_footer")
        return imageView
    }
    
//    // MARK: - 上拉刷新
//    func startRefreshUpPull() {
//        if refreshUpPull != nil {
//            refreshUpPull!()
//        }
//    }
    
    // MARK: - Action 
    func shopCarBuyProductNumberDidChange() {
        productsTableView?.reloadData()
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (categoryPArray != nil) {
            let categoryStr = (categoryPArray![section] as! Categorie).id
            let tempArr : Array<Any> = categoryPDic[categoryStr!] as! Array
            
            return tempArr.count
        }
        
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categoryPArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProductCell.cellWithTableView(tableView: tableView)
//        let goods = goodsArr![indexPath.section][indexPath.row]
//        cell.goods = goods
//        
//        weak var tmpSelf = self
//        cell.addProductClick = { (imageView) -> () in
//            tmpSelf?.addProductsAnimation(imageView)
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headViewIdentifier) as! SupermarketHeadView
//        if supermarketData?.data?.categories?.count > 0 && supermarketData!.data!.categories![section].name != nil {
//            headView.titleLabel.text = supermarketData!.data!.categories![section].name
//        }
        
        return headView
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        
        if delegate != nil && delegate!.responds(to: Selector(("didEndDisplayingHeaderView:"))) && isScrollDown {
            delegate!.didEndDisplayingHeaderView!(section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if delegate != nil && delegate!.responds(to: Selector(("willDisplayHeaderView:"))) && !isScrollDown {
            delegate!.willDisplayHeaderView!(section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let goods = goodsArr![indexPath.section][indexPath.row]
//        let productDetailVC = ProductDetailViewController(goods: goods)
//        navigationController?.pushViewController(productDetailVC, animated: true)
    }
}

// MARK: - UIScrollViewDelegate
extension ProductsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if animationLayers?.count > 0 {
//            let transitionLayer = animationLayers![0]
//            transitionLayer.hidden = true
//        }
        
        isScrollDown = lastOffsetY < scrollView.contentOffset.y
        lastOffsetY = scrollView.contentOffset.y
    }
}

@objc protocol ProductsViewControllerDelegate: NSObjectProtocol {
    @objc optional func didEndDisplayingHeaderView(section: Int)
    @objc optional func willDisplayHeaderView(section: Int)
}
