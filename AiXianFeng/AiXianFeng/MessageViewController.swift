//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/7.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class MessageViewController: BaseVC {
    
    private var segment: UISegmentedControl!
    private var systemTableView: UITableView!
    var systemMessage: [UserMessage]?
    var userMessage: [UserMessage]?
    private var secondView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bulidSystemTableView()
        bulidSecontView()
        bulidSegmentedControl()
        showSystemTableView()
        loadSystemMessage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func bulidSecontView() {
        secondView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 64))
        secondView?.backgroundColor = YFGlobalBackgroundColor
        view.addSubview(secondView!)
        
        let normalImageView = UIImageView(image: UIImage(named: "v2_my_message_empty"))
        normalImageView.center = view.center
        normalImageView.center.y -= 150
        secondView?.addSubview(normalImageView)
        
        let normalLabel = UILabel()
        normalLabel.text = "~~~并没有消息~~~"
        normalLabel.textAlignment = NSTextAlignment.center
        normalLabel.frame = CGRect(x: 0, y: (normalImageView.y) + normalImageView.height + 10, width: kScreenWidth, height: 50)
        secondView?.addSubview(normalLabel)
    }

    private func bulidSegmentedControl() {
        segment = UISegmentedControl(items: ["系统消息", "用户消息"])
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
            showSystemTableView()
        } else if 1 == sender.selectedSegmentIndex {
            showUserTableView()
        }
    }
    
    private func bulidSystemTableView() {
        systemTableView = UITableView(frame: view.bounds, style: .plain)
        systemTableView.backgroundColor = YFGlobalBackgroundColor
        systemTableView.showsHorizontalScrollIndicator = false
        systemTableView.showsVerticalScrollIndicator = false
        systemTableView.delegate = self
        systemTableView.dataSource = self
        systemTableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0)
        view.addSubview(systemTableView)
        
        loadSystemTableViewData()
    }
    
    private func loadSystemTableViewData() {
        weak var tmpSelf = self
        UserMessage.loadSystemMessage { (data, error) -> () in
            tmpSelf!.systemMessage = data
            tmpSelf!.systemTableView.reloadData()
        }
    }
    
    private func loadSystemMessage() {
        weak var tmpSelf = self
        UserMessage.loadSystemMessage { (data, error) -> () in
            tmpSelf!.systemMessage = data
            tmpSelf!.systemTableView.reloadData()
        }
    }
    
    private func showSystemTableView() {
        secondView?.isHidden = true
    }
    
    private func showUserTableView() {
        secondView?.isHidden = false
    }
    
}

extension MessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SystemMessageCell.systemMessageCell(tableView: tableView)
        cell.message = systemMessage![indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return systemMessage?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let message = systemMessage![indexPath.row]
        
        return message.cellHeight
    }
}
