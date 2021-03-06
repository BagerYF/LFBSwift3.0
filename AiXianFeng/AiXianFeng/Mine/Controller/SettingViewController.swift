//
//  SettingViewController.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/5.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class SettingViewController: BaseVC {
    
    private let subViewHeight: CGFloat = 50
    
    private var aboutMeView: UIView!
    private var cleanCacheView: UIView!
    private var cacheNumberLabel: UILabel!
    private var logoutView: UIView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
        buildaboutMeView()
        buildCleanCacheView()
        buildLogoutView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        print(self)
    }
    
    // MARK: - Build UI
    private func setUpUI() {
        navigationItem.title = "设置"
        
    }
    
    private func buildaboutMeView() {
        aboutMeView = UIView(frame: CGRect(x: 0, y: 10, width: kScreenWidth, height: subViewHeight))
        aboutMeView.backgroundColor = UIColor.white
        view.addSubview(aboutMeView!)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SettingViewController.aboutMeViewClick))
        aboutMeView.addGestureRecognizer(tap)
        
        let aboutLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: subViewHeight))
        aboutLabel.text = "关于贝格"
        aboutLabel.font = UIFont.systemFont(ofSize: 16)
        aboutMeView.addSubview(aboutLabel)
        
        let arrowImageView = UIImageView(image: UIImage(named: "icon_go"))
        arrowImageView.frame = CGRect(x: kScreenWidth - 20, y: (subViewHeight - 10) * 0.5, width: 5, height: 10)
        aboutMeView.addSubview(arrowImageView)
    }
    
    private func buildCleanCacheView() {
        cleanCacheView = UIView(frame: CGRect(x: 0, y: subViewHeight + 10, width: kScreenWidth, height: subViewHeight))
        cleanCacheView.backgroundColor = UIColor.white
        view.addSubview(cleanCacheView!)
        
        let cleanCacheLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: subViewHeight))
        cleanCacheLabel.text = "清理缓存"
        cleanCacheLabel.font = UIFont.systemFont(ofSize: 16)
        cleanCacheView.addSubview(cleanCacheLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SettingViewController.cleanCacheViewClick))
        cleanCacheView.addGestureRecognizer(tap)
        
        cacheNumberLabel = UILabel(frame: CGRect(x: 150, y: 0, width: kScreenWidth - 165, height: subViewHeight))
        cacheNumberLabel.textAlignment = NSTextAlignment.right
        cacheNumberLabel.textColor = UIColor.colorWithCustom(r: 180, g: 180, b: 180)
//        cacheNumberLabel.text = String().stringByAppendingFormat("%.2fM", FileTool.folderSize(LFBCachePath)).cleanDecimalPointZear()
        cleanCacheView.addSubview(cacheNumberLabel)
        
        let lineView = UIView(frame: CGRect(x: 10, y: -0.5, width: kScreenWidth - 10, height: 0.5))
        lineView.backgroundColor = UIColor.black
        lineView.alpha = 0.08
        cleanCacheView.addSubview(lineView)
    }
    
    private func buildLogoutView() {
        logoutView = UIView(frame: CGRect(x: 0, y: cleanCacheView.y + cleanCacheView.height + 20, width: kScreenHeight, height: subViewHeight))
        logoutView.backgroundColor = UIColor.white
        view.addSubview(logoutView)
        
        let logoutLabel = UILabel(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: subViewHeight))
        logoutLabel.text = "退出当前账号"
        logoutLabel.textColor = UIColor.colorWithCustom(r: 60, g: 60, b: 60)
        logoutLabel.font = UIFont.systemFont(ofSize: 15)
        logoutLabel.textAlignment = NSTextAlignment.center
        logoutView.addSubview(logoutLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(SettingViewController.logoutViewClick))
        logoutView.addGestureRecognizer(tap)
    }
    
    // MARK: - Action
    func aboutMeViewClick() {
        let aboutVc = AboutAuthorViewController()
        navigationController?.pushViewController(aboutVc, animated: true)
    }
    
    func cleanCacheViewClick() {
//        weak var tmpSelf = self
//        ProgressHUDManager.show()
//        FileTool.cleanFolder(LFBCachePath) { () -> () in
//            tmpSelf!.cacheNumberLabel.text = "0M"
//            ProgressHUDManager.dismiss()
//        }
    }
    
    func logoutViewClick() {
        let navigationVC = UINavigationController(rootViewController:LoginVC())
        navigationVC.navigationBar.tintColor = UIColor.black
        navigationVC.navigationBar.isTranslucent = false
        present(navigationVC, animated: true) {
            
        }
    }
}
