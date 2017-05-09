//
//  MainTabBarC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/4/27.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class MainTabBarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
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
        tabBarControllerAddChildViewController(childView: ShopCartViewController(), title: "购物车", imageName: "shopCart", selectedImageName: "shopCart", tag: 2)
        tabBarControllerAddChildViewController(childView: MineVC(), title: "我的", imageName: "v2_my", selectedImageName: "v2_my_r", tag: 3)
    }
    
    private func tabBarControllerAddChildViewController(childView: UIViewController, title: String, imageName: String, selectedImageName: String, tag: Int) {
        let vcItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vcItem.tag = tag
        
        childView.tabBarItem = vcItem
        
        let navigationVC = BaseNavigationController(rootViewController:childView)
        navigationVC.navigationBar.barTintColor = YFMainYellowColor
        navigationVC.navigationBar.tintColor = UIColor.black
        navigationVC.navigationBar.isTranslucent = false
        addChildViewController(navigationVC)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item.tag == 2 {
            let vc = childViewControllers[selectedIndex]
            let shopCar = ShopCartViewController()
            let nav = UINavigationController(rootViewController: shopCar)
            vc.present(nav, animated: true, completion: nil)
            
            return
        }
    }

    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
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
