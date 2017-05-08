//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/8.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class OrderViewController: BaseVC {

    var orderTableView: UITableView!
    var orders: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "我的订单"
        
        bulidOrderTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func bulidOrderTableView() {
        orderTableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)
        orderTableView.backgroundColor = view.backgroundColor
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.backgroundColor = UIColor.clear
        orderTableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0)
        view.addSubview(orderTableView)
        
        loadOderData()
    }
    
    private func loadOderData() {
        weak var tmpSelf = self
        OrderData.loadOrderData { (orderArray) -> Void in
            tmpSelf!.orders = orderArray
            tmpSelf!.orderTableView.reloadData()
        }
    }

}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource, MyOrderCellDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MyOrderCell.myOrderCell(tableView: tableView, indexPath: indexPath as NSIndexPath)
        cell.order = orders![indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders?.count ?? 0
    }
    
    func orderCellButtonDidClick(indexPath: NSIndexPath, buttonType: Int) {
        print(buttonType, indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetailVC = OrderStatuslViewController()
        orderDetailVC.order = orders![indexPath.row]
        navigationController?.pushViewController(orderDetailVC, animated: true)
    }
}
