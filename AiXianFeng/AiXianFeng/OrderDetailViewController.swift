//
//  OrderDetailViewController.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/8.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class OrderDetailViewController: BaseVC {
    
    var scrollView: UIScrollView?
    let orderDetailView = OrderDetailView()
    let orderUserDetailView = OrderUserDetailView()
    let orderGoodsListView = OrderGoodsListView()
    let evaluateView = UIView()
    let evaluateLabel = UILabel()
    
    private lazy var starImageViews: [UIImageView] = {
        var starImageViews: [UIImageView] = []
        for i in 0...4 {
            let starImageView = UIImageView(image: UIImage(named: "v2_star_no"))
            starImageViews.append(starImageView)
        }
        return starImageViews
        }()
    
    var order: Order? {
        didSet {
            orderDetailView.order = order
            orderUserDetailView.order = order
            orderGoodsListView.order = order
            if -1 != order?.star {
                for i in 0..<order!.star {
                    let imageView = starImageViews[i]
                    imageView.image = UIImage(named: "v2_star_on")
                }
            }
            
            evaluateLabel.text = order?.comment
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildScrollView()
        
        buildOrderDetailView()
        
        buildOrderUserDetailView()
        
        buildOrderGoodsListView()
        
        bulidEvaluateView()
    }
    
    private func buildScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView?.alwaysBounceVertical = true
        scrollView?.backgroundColor = YFGlobalBackgroundColor
        scrollView?.contentSize = CGSize(width: kScreenWidth, height: 1000)
        view.addSubview(scrollView!)
    }
    
    private func buildOrderDetailView() {
        orderDetailView.frame = CGRect(x: 0, y: 10, width: kScreenWidth, height: 185)
        
        scrollView?.addSubview(orderDetailView)
    }
    
    private func buildOrderUserDetailView() {
        orderUserDetailView.frame = CGRect(x: 0, y: (orderDetailView.y) + orderDetailView.height + 10, width: kScreenWidth, height: 110)
        
        scrollView?.addSubview(orderUserDetailView)
    }
    
    private func buildOrderGoodsListView() {
        orderGoodsListView.frame = CGRect(x: 0, y: (orderUserDetailView.y) + orderUserDetailView.height + 10, width: kScreenWidth, height: 350)
        orderGoodsListView.delegate = self
        scrollView?.addSubview(orderGoodsListView)
    }
    
    private func bulidEvaluateView() {
        evaluateView.frame = CGRect(x: 0, y: (orderGoodsListView.y) + orderGoodsListView.height + 10, width: kScreenWidth, height: 80)
        evaluateView.backgroundColor = UIColor.white
        scrollView?.addSubview(evaluateView)
        
        let myEvaluateLabel = UILabel()
        myEvaluateLabel.text = "我的评价"
        myEvaluateLabel.textColor = YFTextBlackColor
        myEvaluateLabel.font = UIFont.systemFont(ofSize: 14)
        myEvaluateLabel.frame = CGRect(x: 10, y: 5, width: kScreenWidth, height: 25)
        evaluateView.addSubview(myEvaluateLabel)
        
        for i in 0...4 {
            let starImageView = starImageViews[i]
            starImageView.frame = CGRect(x: 10 + CGFloat(i) * 30, y: (myEvaluateLabel.y) + myEvaluateLabel.height + 5, width: 25, height: 25)
            evaluateView.addSubview(starImageView)
        }
        
        evaluateLabel.font = UIFont.systemFont(ofSize: 14)
        evaluateLabel.frame = CGRect(x: 10, y: (starImageViews[0].y) + starImageViews[0].height + 10, width: kScreenWidth - 20, height: 25)
        evaluateLabel.textColor = YFTextBlackColor
        evaluateView.addSubview(evaluateLabel)
    }
    
}


extension OrderDetailViewController: OrderGoodsListViewDelegate {
    
    func orderGoodsListViewHeightDidChange(height: CGFloat) {
        orderGoodsListView.frame = CGRect(x: 0, y: (orderUserDetailView.y) + orderUserDetailView.height + 10, width: kScreenWidth, height: height)
        evaluateView.frame = CGRect(x: 0, y: (orderGoodsListView.y) + orderGoodsListView.height + 10, width: kScreenWidth, height: 100)
        scrollView?.contentSize = CGSize(width: kScreenWidth, height: (evaluateView.y) + evaluateView.height + 10 + 50 + NavigationH)
    }
    
}





