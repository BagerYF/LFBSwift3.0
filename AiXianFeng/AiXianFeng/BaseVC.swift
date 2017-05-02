//
//  BaseVC.swift
//  swiftdoctor
//
//  Created by Bager on 16/1/20.
//  Copyright © 2016年 Bager. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
        
    let selectedColor = UIColor.init(red: 255/255.0, green: 239/255.0, blue: 226/255.0, alpha: 1)
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
//        if ((self.navigationController?.viewControllers.count)! > 2)
//        {
//            setBackBtn()
//        }
    }
    
    func setBackBtn () {
        let button =  UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 44)
        button.setImage(UIImage(named: "v2_goback"), for: .normal)
        button.addTarget(self, action: #selector(BaseVC.back), for: .touchUpInside)
        
        let leftBarBtn = UIBarButtonItem(customView: button)
        
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
            action: nil)
        spacer.width = -10;
        
        self.navigationItem.leftBarButtonItems = [spacer,leftBarBtn]
    }
    
    func back ()
    {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
