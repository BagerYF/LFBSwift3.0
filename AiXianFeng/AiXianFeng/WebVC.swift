//
//  WebVC.swift
//  swiftdoctor
//
//  Created by Bager on 16/5/20.
//  Copyright © 2016年 Bager. All rights reserved.
//


import UIKit

class WebVC: BaseVC {
    
    var webView = UIWebView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 64))
    var urlStr: String?
    let loadProgressAnimationView: LoadProgressAnimationView = LoadProgressAnimationView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 3))
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        view.addSubview(webView)
        webView.addSubview(loadProgressAnimationView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(navigationTitle: String, urlStr: String) {
        self.init(nibName: nil, bundle: nil)
        super.setBackBtn()
        navigationItem.title = navigationTitle
        webView.loadRequest(URLRequest(url: URL(string: urlStr)!))
        self.urlStr = urlStr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildRightItemBarButton()
        
        view.backgroundColor = UIColor.colorWithCustom(r: 230, g: 230, b: 230)
        webView.backgroundColor = UIColor.colorWithCustom(r: 230, g: 230, b: 230)
        webView.delegate = self
        webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = YFNavigationBarWhiteBackgroundColor
    }
    
    private func buildRightItemBarButton() {
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
        rightButton.setImage(UIImage(named: "v2_refresh"), for: UIControlState.normal)
        rightButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -53)
        rightButton.addTarget(self, action: #selector(WebVC.refreshClick), for: UIControlEvents.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    // MARK: - Action
    func refreshClick() {
        if urlStr != nil && urlStr!.characters.count > 1 {
            webView.loadRequest(URLRequest(url: URL(string: urlStr!)!))
        }
    }
}

extension WebVC: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadProgressAnimationView.startLoadProgressAnimation()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadProgressAnimationView.endLoadProgressAnimation()
    }
}
