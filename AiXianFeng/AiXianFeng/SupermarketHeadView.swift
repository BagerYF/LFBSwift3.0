//
//  MarketVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/3.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class SupermarketHeadView: UITableViewHeaderFooterView {

    var titleLabel: UILabel!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor.clear
        
        contentView.backgroundColor = UIColor(red: 240 / 255.0, green: 240 / 255.0, blue: 240 / 255.0, alpha: 0.8)
        buildTitleLabel()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: HotViewMargin, y: 0, width: width - HotViewMargin, height: height)
    }
    
    private func buildTitleLabel() {
        titleLabel = UILabel()
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = UIColor.colorWithCustom(r: 100, g: 100, b: 100)
        titleLabel.textAlignment = NSTextAlignment.left
        contentView.addSubview(titleLabel)
    }

}

