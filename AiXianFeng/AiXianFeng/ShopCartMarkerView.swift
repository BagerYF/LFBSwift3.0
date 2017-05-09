//
//  ProductDetailVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/9.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class ShopCartMarkerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let marketHeight: CGFloat = 60
        
        
        backgroundColor = UIColor.white
        
        
        addSubview(lineView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 0.5)))
        
        let rocketImageView = UIImageView(image: UIImage(named: "icon_lighting"))
        rocketImageView.frame = CGRect(x: 15, y: 5, width: 20, height: 20)
        addSubview(rocketImageView)
        
        let redDotImaegView = UIImageView(image: UIImage(named: "reddot"))
        redDotImaegView.frame = CGRect(x: 15, y: (marketHeight - (rocketImageView.y) - rocketImageView.height - 4) * 0.5 + (rocketImageView.y) + rocketImageView.height, width: 4, height: 4)
        addSubview(redDotImaegView)
        
        let marketTitleLabel = UILabel(frame: CGRect(x: (rocketImageView.x) + rocketImageView.width + 10, y: 5, width: kScreenWidth * 0.6, height: 20))
        marketTitleLabel.text = "闪电超市"
        marketTitleLabel.font = UIFont.systemFont(ofSize: 12)
        marketTitleLabel.textColor = UIColor.lightGray
        addSubview(marketTitleLabel)
        
        let marketLabel = UILabel(frame: CGRect(x: (redDotImaegView.x) + redDotImaegView.width + 5, y: rocketImageView.y + rocketImageView.height, width: kScreenWidth * 0.7, height: 60 - rocketImageView.y - rocketImageView.height))
        marketLabel.text = "   22:00前满$30免运费,22:00后满$50面运费"
        marketLabel.textColor = UIColor.lightGray
        marketLabel.font = UIFont.systemFont(ofSize: 10)
        addSubview(marketLabel)
        
        addSubview(lineView(frame: CGRect(x: 0, y: marketHeight - 0.5, width: kScreenWidth, height: 0.5)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func lineView(frame: CGRect) -> UIView {
        let lineView = UIView(frame: frame)
        lineView.backgroundColor = UIColor.black
        lineView.alpha = 0.1
        return lineView
    }
    
}
