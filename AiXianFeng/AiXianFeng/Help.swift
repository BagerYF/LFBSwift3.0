//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/6.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class Question: NSObject {
    var title: String?
    var texts: [String]? {
        didSet {
            let maxSize = CGSize(width: kScreenWidth - 40, height: 100000)
            for i in 0..<texts!.count {
                let str = texts![i] as NSString
                let rowHeight: CGFloat = str.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14)], context: nil).size.height + 14
                cellHeight += rowHeight
                everyRowHeight.append(rowHeight)
            }
        }
    }
    
    var everyRowHeight: [CGFloat] = []
    var cellHeight: CGFloat = 0
    
    class func question(dict: NSDictionary) -> Question {
        let question = Question()
        question.title = dict.object(forKey: "title") as? String
        question.texts = dict.object(forKey: "texts") as? [String]
        
        return question
    }
    
    class func loadQuestions(complete: (([Question]) -> ())) {
        let path = Bundle.main.path(forResource: "HelpPlist", ofType: "plist")
        let array = NSArray(contentsOfFile: path!)
        
        var questions: [Question] = []
        if array != nil {
            for dic in array! {
                questions.append(Question.question(dict: dic as! NSDictionary))
            }
        }
        complete(questions)
    }
}


