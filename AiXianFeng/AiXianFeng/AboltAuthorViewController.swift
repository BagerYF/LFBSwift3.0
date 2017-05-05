//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/5.
//  Copyright © 2017年 Bager. All rights reserved.
//


import UIKit

class AboltAuthorViewController: BaseVC {
    
    private var authorLabel: UILabel!
    private var gitHubLabel: UILabel!
    private var sinaWeiBoLabel: UILabel!
    private var blogLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildAuthorImageView()
        
        bulidTextLabel()
        
        bulidGitHubLabel()
        
        bulidBlogLabel()
    
        buildURLButton()
    }
    
    // MARK: Build UI
    private func buildAuthorImageView() {
        navigationItem.title = "关于作者"
        
        let authorImageView = UIImageView(frame: CGRect(x: (kScreenWidth - 100) * 0.5, y: 50, width: 100, height: 100))
        authorImageView.image = UIImage(named: "author")
        authorImageView.layer.masksToBounds = true
        authorImageView.layer.cornerRadius = 15
        view.addSubview(authorImageView)
    }
    
    private func bulidTextLabel() {
        authorLabel = UILabel()
        authorLabel.text = "贝格"
        authorLabel.sizeToFit()
        authorLabel.center.x = kScreenWidth * 0.5
        authorLabel.frame.origin.y = 170
        view.addSubview(authorLabel)
    }
    
    private func bulidGitHubLabel() {
        //frame: CGRectMake((ScreenWidth - gitHubLabel.width) * 0.5, CGRectGetMaxY(authorLabel.frame) + 10, gitHubLabel.width, gitHubLabel.height)
        
        gitHubLabel = UILabel()
        bulidTextLabel(label: gitHubLabel, text: "GitHub: " + "\(GitHubURLString)", tag: 1)
    }
    
    private func bulidBlogLabel() {
        blogLabel = UILabel()
        bulidTextLabel(label: blogLabel, text: "技术博客: " + "\(BlogURLString)", tag: 2)
    }
    
    let buttonTitles = ["贝格的Github", "贝格的技术博客"]
    let btnW: CGFloat = 80
    private func buildURLButton() {
        for i in 0...1 {
            let btn = UIButton()
            btn.setTitle(buttonTitles[i], for: .normal)
            btn.backgroundColor = UIColor.white
            btn.layer.cornerRadius = 5
            btn.tag = i
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            btn.frame = CGRect(x: CGFloat(i) * ((kScreenWidth - btnW * 2) / 3) + (CGFloat(i) + 1) * btnW, y: blogLabel.y + blogLabel.height + 10, width: btnW, height: 30)
            btn.addTarget(self, action: Selector(("btnClick:")), for: UIControlEvents.touchUpInside)
            btn.setTitleColor(UIColor.black, for: .normal)
            view.addSubview(btn)
        }
    }
    
    private func bulidTextLabel(label: UILabel, text: String, tag: Int) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 13)
        label.sizeToFit()
        label.isUserInteractionEnabled = true
        label.textColor = UIColor.colorWithCustom(r: 100, g: 100, b: 100)
        label.numberOfLines = 0
        
        switch tag {
        case 1: label.frame = CGRect(x: 40, y: authorLabel.y + authorLabel.height + 20, width: gitHubLabel.width, height: gitHubLabel.height + 10)
            break
        case 2: label.frame = CGRect(x: 40, y: gitHubLabel.y + gitHubLabel.height + 10, width: kScreenWidth, height: gitHubLabel.height + 10)
            break
        default:break
        }
        
        label.tag = tag
        view.addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action: Selector(("textLabelClick:")))
        label.addGestureRecognizer(tap)
    }
    
    // MARK: - Action
    func textLabelClick(tap: UITapGestureRecognizer) {
        switch tap.view!.tag {
        case 1: UIApplication.shared.openURL(URL(string: GitHubURLString)! as URL)
            break

        default: UIApplication.shared.openURL(URL(string: BlogURLString)! as URL)
            break
        }
    }
    
    func btnClick(sender: UIButton) {
        switch sender.tag {
        case 0: UIApplication.shared.openURL(URL(string: GitHubURLString)! as URL)
            break
        case 1: UIApplication.shared.openURL(URL(string: BlogURLString)! as URL)
            break
        default: 
            break
        }
    }
    
}
