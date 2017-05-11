//
//  GuideViewController.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/11.
//  Copyright © 2017年 Bager. All rights reserved.
//  GitHub地址:https://github.com/BagerYF/LFBSwift3.0
//  Blog地址:http://www.jianshu.com/u/25c75c8055c6


import UIKit

class GuideViewController: BaseVC {
    
    var collectionView: UICollectionView?
    var imageNames = ["guide_40_1", "guide_40_2", "guide_40_3", "guide_40_4"]
    let cellIdentifier = "GuideCell"
    var isHiddenNextButton = true
    var pageController = UIPageControl(frame: CGRect(x: 0, y: kScreenHeight - 50, width: kScreenWidth, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = false

        buildCollectionView()
        
        buildPageController()
    }
    
    // MARK: - Build UI
    private func buildCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.itemSize = ScreenBounds.size
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        collectionView = UICollectionView(frame: ScreenBounds, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.isPagingEnabled = true
        collectionView?.bounces = false
        collectionView?.register(GuideCell.self, forCellWithReuseIdentifier: cellIdentifier)
        view.addSubview(collectionView!)
    }
    
    private func buildPageController() {
        pageController.numberOfPages = imageNames.count
        pageController.currentPage = 0
        view.addSubview(pageController)
    }
}

extension GuideViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath as IndexPath) as! GuideCell
        cell.newImage = UIImage(named: imageNames[indexPath.row])
        if indexPath.row != imageNames.count - 1 {
            cell.setNextButtonHidden(hidden: true)
        }
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == kScreenWidth * CGFloat(imageNames.count - 1) {
            let cell = collectionView?.cellForItem(at: IndexPath(item: imageNames.count - 1, section: 0)) as! GuideCell
            cell.setNextButtonHidden(hidden: false)
            isHiddenNextButton = false
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != kScreenWidth * CGFloat(imageNames.count - 1) && !isHiddenNextButton && scrollView.contentOffset.x > kScreenWidth * CGFloat(imageNames.count - 2) {
            let cell = collectionView?.cellForItem(at: IndexPath(item: imageNames.count - 1, section: 0)) as! GuideCell
            cell.setNextButtonHidden(hidden: true)
            isHiddenNextButton = true
        }
        
        pageController.currentPage = Int(scrollView.contentOffset.x / kScreenWidth + 0.5)
    }
}
