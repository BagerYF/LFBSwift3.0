//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/7.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class AdressCell: UITableViewCell {
    
    private let nameLabel       = UILabel()
    private let phoneLabel      = UILabel()
    private let adressLabel     = UILabel()
    private let lineView        = UIView()
    private let modifyImageView = UIImageView()
    private let bottomView      = UIView()
    
    var modifyClickCallBack:((Int) -> Void)?
    
    var adress: Adress? {
        didSet {
            nameLabel.text = adress!.accept_name
            phoneLabel.text = adress!.telphone
            adressLabel.text = adress!.address
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = UITableViewCellSelectionStyle.none
        
        backgroundColor = UIColor.clear
        contentView.backgroundColor = UIColor.white
        
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = YFTextBlackColor
        contentView.addSubview(nameLabel)
        
        phoneLabel.font = UIFont.systemFont(ofSize: 14)
        phoneLabel.textColor = YFTextBlackColor
        contentView.addSubview(phoneLabel)
        
        adressLabel.font = UIFont.systemFont(ofSize: 13)
        adressLabel.textColor = UIColor.lightGray
        contentView.addSubview(adressLabel)
        
        lineView.backgroundColor = UIColor.lightGray
        lineView.alpha = 0.2
        contentView.addSubview(lineView)
        
        modifyImageView.image = UIImage(named: "v2_address_edit_highlighted")
        modifyImageView.contentMode = UIViewContentMode.center
        contentView.addSubview(modifyImageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(modifyImageViewClick(tap:)))
        modifyImageView.isUserInteractionEnabled = true
        modifyImageView.addGestureRecognizer(tap)
        
        bottomView.backgroundColor = UIColor.lightGray
        bottomView.alpha = 0.4
        contentView.addSubview(bottomView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static private let identifier = "AdressCell"
    
    class func adressCell(tableView: UITableView, indexPath: NSIndexPath, modifyClickCallBack:@escaping ((Int) -> Void)) -> AdressCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? AdressCell
        if cell == nil {
            cell = AdressCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.modifyClickCallBack = modifyClickCallBack
        cell?.modifyImageView.tag = indexPath.row
        
        return cell!
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        nameLabel.frame = CGRect(x: 10, y: 15, width: 80, height: 20)
        phoneLabel.frame = CGRect(x: (nameLabel.x) + nameLabel.width + 10, y: 15, width: 150, height: 20)
        adressLabel.frame = CGRect(x: 10, y: (phoneLabel.y) + phoneLabel.height + 10, width: width * 0.6, height: 20)
        lineView.frame = CGRect(x: width * 0.8, y: 10, width: 1, height: height - 20)
        modifyImageView.frame = CGRect(x: width * 0.8 + (width * 0.2 - 40) * 0.5, y: (height - 40) * 0.5, width: 40, height: 40)
        bottomView.frame = CGRect(x: 0, y: height - 1, width: width, height: 1)
    }
    
    // MARK: - Action
    func modifyImageViewClick(tap: UIGestureRecognizer) {
        if modifyClickCallBack != nil {
            modifyClickCallBack!(tap.view!.tag)
        }
    }
    
}
