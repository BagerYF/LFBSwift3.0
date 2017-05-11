//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/5.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class IdeaViewController: BaseVC {
    
    let margin: CGFloat = 15
    var promptLabel: UILabel!
    var iderTextView: PlaceholderTextView!
    weak var mineVC: MineVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        buildRightItemButton()
        
        buildPlaceholderLabel()
        
        buildIderTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        iderTextView.becomeFirstResponder()
    }
    
//    // MARK: - Build UI
    private func setUpUI() {
        view.backgroundColor = YFGlobalBackgroundColor
        navigationItem.title = "意见反馈"
    }

    private func buildRightItemButton() {
        let bar = UIBarButtonItem(title: "发送", style: .plain, target: self, action: #selector(rightItemClick))
        navigationItem.rightBarButtonItem = bar
//        navigationItem.rightBarButtonItem = UIBarButtonItem.barButton("发送", titleColor: UIColor.colorWithCustom(100, g: 100, b: 100), target: self, action: "rightItemClick")
    }

    private func buildPlaceholderLabel() {
        promptLabel = UILabel(frame: CGRect(x: margin, y: 5, width: kScreenWidth - 2 * margin, height: 50))
        promptLabel.text = "你的批评和建议能帮助我们更好的完善产品,请留下你的宝贵意见!"
        promptLabel.numberOfLines = 2;
        promptLabel.textColor = UIColor.black
        promptLabel.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(promptLabel)
    }
    
    private func buildIderTextView() {
        iderTextView = PlaceholderTextView(frame: CGRect(x: margin, y: (promptLabel.y) + promptLabel.height + 10, width: kScreenWidth - 2 * margin, height: 150))
        iderTextView.placeholder = "请输入宝贵意见(300字以内)"
        view.addSubview(iderTextView)
    }
    
    // MARK: - Action
    func rightItemClick() {
        
        if iderTextView.text == nil || 0 == iderTextView.text?.characters.count {
            ProgressHUDManager.showImage(image: UIImage(named: "v2_orderSuccess")!, status: "请输入意见,心里空空的")
        } else if (iderTextView.text?.characters.count)! < 5 {
            ProgressHUDManager.showImage(image: UIImage(named: "v2_orderSuccess")!, status: "请输入超过5个字啊亲~")
        } else if (iderTextView.text?.characters.count)! >= 300 {
            ProgressHUDManager.showImage(image: UIImage(named: "v2_orderSuccess")!, status: "说的太多了,臣妾做不到啊~")
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: { 
                self.navigationController?.popViewController(animated: true)
                self.mineVC?.iderVCSendIderSuccess = true
                ProgressHUDManager.dismiss()
            })
        }
    }
}
