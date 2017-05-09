//
//  ProductDetailVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/9.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class ReceiptAddressView: UIView {
    
    private let topImageView = UIImageView(image: UIImage(named: "v2_shoprail"))
    private let bottomImageView = UIImageView(image: UIImage(named: "v2_shoprail"))
    private let consigneeLabel = UILabel()
    private let phoneNumLabel = UILabel()
    private let receiptAdressLabel = UILabel()
    private let consigneeTextLabel = UILabel()
    private let phoneNumTextLabel = UILabel()
    private let receiptAdressTextLabel = UILabel()
    private let arrowImageView = UIImageView(image: UIImage(named: "icon_go"))
    private let modifyButton = UIButton()
    var modifyButtonClickCallBack: (() -> ())?
    var adress: Adress? {
        didSet {
            if adress != nil{
                consigneeTextLabel.text = adress!.accept_name! + (adress!.gender! == "1" ? " 先生" : " 女士")
                phoneNumTextLabel.text = adress!.telphone
                receiptAdressTextLabel.text = adress!.address
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        addSubview(topImageView)
        addSubview(bottomImageView)
        addSubview(arrowImageView)
        
        modifyButton.setTitle("修改", for: UIControlState.normal)
        modifyButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        modifyButton.addTarget(self, action: #selector(ReceiptAddressView.modifyButtonClick), for: UIControlEvents.touchUpInside)
        modifyButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        addSubview(modifyButton)
        
        initLabel(label: consigneeLabel, text: "收  货  人  ")
        initLabel(label: phoneNumLabel, text:  "电       话  ")
        initLabel(label: receiptAdressLabel, text: "收货地址  ")
        initLabel(label: consigneeTextLabel, text: "")
        initLabel(label: phoneNumTextLabel, text: "")
        initLabel(label: receiptAdressTextLabel, text: "")
    }
    
    convenience init(frame: CGRect, modifyButtonClickCallBack:@escaping (() -> ())) {
        self.init(frame: frame)
        
        self.modifyButtonClickCallBack = modifyButtonClickCallBack
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let leftMargin: CGFloat = 15
        
        topImageView.frame = CGRect(x: 0, y: 0, width: width, height: 2)
        bottomImageView.frame = CGRect(x: 0, y: height - 2, width: width, height: 2)
        consigneeLabel.frame = CGRect(x: leftMargin, y: 10, width: consigneeLabel.width, height: consigneeLabel.height)
        consigneeTextLabel.frame = CGRect(x: (consigneeLabel.x) + consigneeLabel.width + 5, y: consigneeLabel.y, width: 150, height: consigneeLabel.height)
        phoneNumLabel.frame = CGRect(x: leftMargin, y: (consigneeLabel.y) + consigneeLabel.height + 5, width: phoneNumLabel.width, height: phoneNumLabel.height)
        phoneNumTextLabel.frame = CGRect(x: consigneeTextLabel.x, y: phoneNumLabel.y, width: 150, height: phoneNumLabel.height)
        receiptAdressLabel.frame = CGRect(x: leftMargin, y: (phoneNumTextLabel.y) + phoneNumTextLabel.height + 5, width: receiptAdressLabel.width, height: receiptAdressLabel.height)
        receiptAdressTextLabel.frame = CGRect(x: consigneeTextLabel.x, y: receiptAdressLabel.y, width: 150, height: receiptAdressLabel.height)
        modifyButton.frame = CGRect(x: width - 60, y: 0, width: 30, height: height)
        arrowImageView.frame = CGRect(x: width - 15, y: (height - arrowImageView.height) * 0.5, width: arrowImageView.width, height: arrowImageView.height)
    }
    
    private func initLabel(label: UILabel, text: String) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.sizeToFit()
        addSubview(label)
    }
    
    func modifyButtonClick() {
        if modifyButtonClickCallBack != nil {
            modifyButtonClickCallBack!()
        }
    }
}
