//
//  MineVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/6.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class MyShopViewController: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "我的店铺"
        
        let imageView = UIImageView(image: UIImage(named: "v2_store_empty"))
        imageView.center = CGPoint(x: view.center.x, y: view.center.y - 150);
        view.addSubview(imageView)
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: (imageView.y) + imageView.height + 10, width: view.width, height: 30))
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        titleLabel.text = "还没有收藏的店铺呦~"
        view.addSubview(titleLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
