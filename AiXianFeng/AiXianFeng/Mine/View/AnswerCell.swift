//
//  AnswerCell.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/6.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class AnswerCell: UITableViewCell {
    
    static private let identifier: String = "cellID"
    private let lineView = UIView()
    
    var question: Question? {
        didSet {
            for i in 0..<question!.texts!.count {
                var textY: CGFloat = 0
                for j in 0..<i {
                    textY += question!.everyRowHeight[j]
                }
                
                let textLabel = UILabel(frame: CGRect(x: 20, y: textY, width: kScreenWidth - 40, height: question!.everyRowHeight[i]))
                textLabel.text = question!.texts![i]
                textLabel.numberOfLines = 0
                textLabel.textColor = UIColor.gray
                textLabel.font = UIFont.systemFont(ofSize: 14)
                
                contentView.addSubview(textLabel)
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = UITableViewCellSelectionStyle.none
        lineView.alpha = 0.25
        lineView.backgroundColor = UIColor.gray
        contentView.addSubview(lineView)
    }
    
    class func answerCell(tableView: UITableView) -> AnswerCell {
        
//        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? AnswerCell
//        if cell == nil {
           let cell = AnswerCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
//        }
        
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        lineView.frame = CGRect(x: 20, y: 0, width: width - 40, height: 0.5)
    }
}
