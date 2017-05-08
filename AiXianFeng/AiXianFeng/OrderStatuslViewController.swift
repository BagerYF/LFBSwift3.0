//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/8.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class OrderStatuslViewController: BaseVC {
    
    private var orderDetailTableView: UITableView?
    var segment: UISegmentedControl!
    var orderDetailVC: OrderDetailViewController?
    var orderStatuses: [OrderStatus]? {
        didSet {
            orderDetailTableView?.reloadData()
        }
    }
    
    var order: Order? {
        didSet {
            orderStatuses = order?.status_timeline
            
            if (order?.detail_buttons?.count)! > 0 {
                let btnWidth: CGFloat = 80
                let btnHeight: CGFloat = 30
                for i in 0..<order!.detail_buttons!.count {
                    let btn = UIButton(frame: CGRect(x: view.width - (10 + CGFloat(i + 1) * (btnWidth + 10)), y: view.height - 50 - NavigationH + (50 - btnHeight) * 0.5, width: btnWidth, height: btnHeight))
                    btn.setTitle(order!.detail_buttons![i].text, for: UIControlState.normal)
                    btn.backgroundColor = YFMainYellowColor
                    btn.setTitleColor(UIColor.black, for: .normal)
                    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
                    btn.layer.cornerRadius = 5;
                    btn.tag = order!.detail_buttons![i].type
                    btn.addTarget(self, action: #selector(detailButtonClick(sender:)), for: UIControlEvents.touchUpInside)
                    view.addSubview(btn)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildNavigationItem()
        
        buildOrderDetailTableView()
        
        buildDetailButtonsView()
    }
    
    private func buildNavigationItem() {
        let rightItem = UIBarButtonItem.barButton(title: "投诉", titleColor: YFTextBlackColor, target: self, action: #selector(rightItemButtonClick))
        navigationItem.rightBarButtonItem = rightItem
        
        segment = UISegmentedControl(items: ["订单状态", "订单详情"])
        segment.addTarget(self, action: #selector(segmentedControlDidValuechange(sender:)), for: .valueChanged)
        segment.tintColor = YFMainYellowColor
        segment.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.black], for: UIControlState.selected)
        segment.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.colorWithCustom(r: 100, g: 100, b: 100)], for: UIControlState.normal)
        segment.selectedSegmentIndex = 0
        navigationItem.titleView = segment
        navigationItem.titleView?.frame = CGRect(x: 0, y: 5, width: 180, height: 27)
    }
    
    func segmentedControlDidValuechange(sender: UISegmentedControl) {
        if 0 == sender.selectedSegmentIndex {
            showOrderStatusView()
        } else if 1 == sender.selectedSegmentIndex {
            showOrderDetailView()
        }
    }
    
    private func buildOrderDetailTableView() {
        orderDetailTableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - NavigationH), style: .plain)
        orderDetailTableView?.backgroundColor = UIColor.white
        orderDetailTableView?.delegate = self
        orderDetailTableView?.dataSource = self
        orderDetailTableView?.rowHeight = 80
        view.addSubview(orderDetailTableView!)
        
        orderDetailTableView?.tableFooterView = UIView()
    }
    
    private func buildDetailButtonsView() {
        let bottomView = UIView(frame: CGRect(x: 0, y: view.height - 50 - NavigationH, width: view.width, height: 1))
        bottomView.backgroundColor = UIColor.gray
        bottomView.alpha = 0.1
        view.addSubview(bottomView)
        
        let bottomView1 = UIView(frame: CGRect(x: 0, y: view.height - 49 - NavigationH, width: view.width, height: 49))
        bottomView1.backgroundColor = UIColor.white
        view.addSubview(bottomView1)
    }
    
    // MARK: - Action
    func rightItemButtonClick() {
        
    }
    
    func detailButtonClick(sender: UIButton) {
        print("点击了底部按钮 类型是" + "\(sender.tag)")
    }
    
    func showOrderStatusView() {
        weak var tmpSelf = self
        tmpSelf!.orderDetailVC?.view.isHidden = true
        tmpSelf!.orderDetailTableView?.isHidden = false
    }
    
    func showOrderDetailView() {
        weak var tmpSelf = self
        if tmpSelf!.orderDetailVC == nil {
            tmpSelf!.orderDetailVC = OrderDetailViewController()
            tmpSelf!.orderDetailVC?.view.isHidden = false
            tmpSelf!.orderDetailVC?.order = order
            tmpSelf!.addChildViewController(orderDetailVC!)
            tmpSelf!.view.insertSubview(orderDetailVC!.view, at: 0)
        } else {
            tmpSelf!.orderDetailVC?.view.isHidden = false
        }
        tmpSelf!.orderDetailTableView?.isHidden = true
    }
}

extension OrderStatuslViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OrderStatusCell.orderStatusCell(tableView: tableView)
        cell.orderStatus = orderStatuses![indexPath.row]
        
        if indexPath.row == 0 {
            cell.orderStateType = .Top
        } else if indexPath.row == orderStatuses!.count - 1 {
            cell.orderStateType = .Bottom
        } else {
            cell.orderStateType = .Middle
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderStatuses?.count ?? 0
    }
    
}
