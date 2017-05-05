//
//  MainTabBarC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/4/27.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class MainTabBarC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabbar()
        buildMainTabBarChildViewController()
    }
    
    private func setupTabbar() {
        
        self.tabBar.tintColor = YFMainYellowColor
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSForegroundColorAttributeName: UIColor.gray], for:.normal)
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSForegroundColorAttributeName: UIColor.gray], for:.selected)
    }
    
    private func buildMainTabBarChildViewController() {
        
        tabBarControllerAddChildViewController(childView: HomePageVC(), title: "首页", imageName: "v2_home", selectedImageName: "v2_home_r", tag: 0)
        tabBarControllerAddChildViewController(childView: MarketVC(), title: "闪电超市", imageName: "v2_order", selectedImageName: "v2_order_r", tag: 1)
        tabBarControllerAddChildViewController(childView: HomePageVC(), title: "购物车", imageName: "shopCart", selectedImageName: "shopCart", tag: 2)
        tabBarControllerAddChildViewController(childView: HomePageVC(), title: "我的", imageName: "v2_my", selectedImageName: "v2_my_r", tag: 3)
        selectedIndex = 1
    }
    
    private func tabBarControllerAddChildViewController(childView: UIViewController, title: String, imageName: String, selectedImageName: String, tag: Int) {
        let vcItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vcItem.tag = tag
        
        childView.tabBarItem = vcItem
        
        let navigationVC = UINavigationController(rootViewController:childView)
        navigationVC.navigationBar.barTintColor = YFMainYellowColor
        navigationVC.navigationBar.tintColor = UIColor.black
        navigationVC.navigationBar.isTranslucent = false
        addChildViewController(navigationVC)
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        let childArr = tabBarController.childViewControllers as NSArray
        let index = childArr.index(of: viewController)
        
        if index == 2
        {
            return false
        }
        
        return true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
