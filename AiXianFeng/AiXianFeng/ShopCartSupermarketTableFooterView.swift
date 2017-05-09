//
//  ProductDetailVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/9.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class ShopCartSupermarketTableFooterView: UIView {
    
    private let titleLabel      = UILabel()
    let priceLabel              = UILabel()
    private let determineButton = UIButton()
    private let backView        = UIView()
    weak var delegate: ShopCartSupermarketTableFooterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: ShopCartRowHeight)
        backView.backgroundColor = UIColor.white
        addSubview(backView)
        
        titleLabel.text = "共$ "
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.sizeToFit()
        titleLabel.textColor = UIColor.red
        titleLabel.frame = CGRect(x: 15, y: 0, width: titleLabel.width, height: ShopCartRowHeight)
        addSubview(titleLabel)
        
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.textColor = UIColor.red
        priceLabel.frame = CGRect(x: (titleLabel.x) + titleLabel.width, y: 0, width: kScreenWidth * 0.5, height: ShopCartRowHeight)
        priceLabel.text = UserShopCarTool.sharedUserShopCar.getAllProductsPrice()
        addSubview(priceLabel)
        
        determineButton.frame = CGRect(x: kScreenWidth - 90, y: 0, width: 90, height: ShopCartRowHeight)
        determineButton.backgroundColor = YFMainYellowColor
        determineButton.setTitle("选好了", for: UIControlState.normal)
        determineButton.setTitleColor(UIColor.black, for: .normal)
        determineButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        determineButton.addTarget(self, action: #selector(ShopCartSupermarketTableFooterView.determineButtonClick), for: .touchUpInside)
        addSubview(determineButton)
        
        addSubview(lineView(frame: CGRect(x: 0, y: ShopCartRowHeight - 0.5, width: kScreenWidth, height: 0.5)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPriceLabel(price: Double) {
        priceLabel.text = "\(price)".cleanDecimalPointZear()
    }
    
    private func lineView(frame: CGRect) -> UIView {
        let lineView = UIView(frame: frame)
        lineView.backgroundColor = UIColor.black
        lineView.alpha = 0.1
        return lineView
    }
    
    func determineButtonClick() {
        delegate?.supermarketTableFooterDetermineButtonClick()
    }
}

protocol ShopCartSupermarketTableFooterViewDelegate: NSObjectProtocol {
    
    func supermarketTableFooterDetermineButtonClick();
}
