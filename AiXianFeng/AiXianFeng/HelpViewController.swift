//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/5.
//  Copyright © 2017年 Bager. All rights reserved.
//


import UIKit

enum HelpCellType: Int {
    case Phone = 0
    case Question = 1
}

class HelpViewController: BaseVC {

    let margin: CGFloat = 20
    let backView: UIView = UIView(frame: CGRect(x: 0, y: 10, width: kScreenWidth, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "客服帮助"
        
        backView.backgroundColor = UIColor.white
        view.addSubview(backView)
        
        let phoneLabel = UILabel(frame: CGRect(x: 20, y: 0, width: kScreenWidth - margin, height: 50))
        creatLabel(label: phoneLabel, text: "客服电话: 400-800-8088", type: .Phone)
        
        let arrowImageView = UIImageView(image: UIImage(named: "icon_go"))
        arrowImageView.frame = CGRect(x: kScreenWidth - 20, y: (50 - 10) * 0.5, width: 5, height: 10)
        backView.addSubview(arrowImageView)
        
        let lineView = UIView(frame: CGRect(x: margin, y: 49.5, width: kScreenWidth - margin, height: 1))
        lineView.backgroundColor = UIColor.gray
        lineView.alpha = 0.2
        backView.addSubview(lineView)
        
        let questionLabel = UILabel(frame: CGRect(x: margin, y: 50, width: kScreenWidth - margin, height: 50))
        creatLabel(label: questionLabel, text: "常见问题", type: .Question)
        
        let arrowImageView2 = UIImageView(image: UIImage(named: "icon_go"))
        arrowImageView2.frame = CGRect(x: kScreenWidth - 20, y: (50 - 10) * 0.5 + 50, width: 5, height: 10)
        backView.addSubview(arrowImageView2)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK - Method
    private func creatLabel(label: UILabel, text: String, type: HelpCellType) {
        label.text = text
        label.isUserInteractionEnabled = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.tag = type.hashValue
        backView.addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(cellClick(tap:)))
        label.addGestureRecognizer(tap)
    }
    
    // MARK: - Action
    func cellClick(tap: UITapGestureRecognizer) {
     
        switch tap.view!.tag {
        case HelpCellType.Phone.hashValue :
            let alertView = UIAlertView(title: "", message: "400-800-8088", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "拨打")
            alertView.show()
            break
        case HelpCellType.Question.hashValue :
            let helpDetailVC = HelpDetailViewController()
            navigationController?.pushViewController(helpDetailVC, animated: true)
            break
        default : break
        }
        
    }
    
}

extension HelpViewController: UIAlertViewDelegate {
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == 1 {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL(string: "tel:4008484842")!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(URL(string: "tel:4008484842")! as URL)
            }

        }
    }
}
