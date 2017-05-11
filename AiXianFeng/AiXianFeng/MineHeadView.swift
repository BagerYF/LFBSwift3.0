//
//  MineHeadView.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/5.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class MineHeadView: UIImageView {
    
    let setUpBtn: UIButton = UIButton(type: .custom)
    let iconView: IconView = IconView()
    var buttonClick:((Void) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "v2_my_avatar_bg")
        setUpBtn.setImage(UIImage(named: "v2_my_settings_icon"), for: .normal)
        setUpBtn.addTarget(self, action: #selector(MineHeadView.setUpButtonClick), for: .touchUpInside)
        addSubview(setUpBtn)
        addSubview(iconView)
        self.isUserInteractionEnabled = true
    }
    
    convenience init(frame: CGRect, settingButtonClick:@escaping (() -> Void)) {
        self.init(frame: frame)
        buttonClick = settingButtonClick
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let iconViewWH: CGFloat = 150
        iconView.frame = CGRect(x: (width - 150) * 0.5, y: 40, width: iconViewWH, height: iconViewWH)
        
        setUpBtn.frame = CGRect(x: width - 50, y: 20, width: 50, height: 50)
    }
    
    func setUpButtonClick() {
        buttonClick?()
    }
}


class IconView: UIView {
    
    var iconImageView: UIImageView!
    var phoneNum: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        iconImageView = UIImageView(image: UIImage(named: "author"))
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 15
        addSubview(iconImageView)
        
        phoneNum = UILabel()
        phoneNum.text = "Bager"
        phoneNum.font = UIFont.boldSystemFont(ofSize: 18)
        phoneNum.textColor = UIColor.white
        phoneNum.textAlignment = .center
        addSubview(phoneNum)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.frame = CGRect(x: (width - 100) * 0.5, y: 0, width: 100, height: 100)
        phoneNum.frame = CGRect(x: 0, y: iconImageView.y + iconImageView.height + 15, width: width, height: 30)
    }
}
