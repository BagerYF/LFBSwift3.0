//
//  WebVC.swift
//  swiftdoctor
//
//  Created by Bager on 16/5/2.
//  Copyright © 2016年 Bager. All rights reserved.
//

import UIKit

class LoadProgressAnimationView: UIView {
    
    var viewWidth: CGFloat = 0
    override var frame: CGRect {
        willSet {
            if frame.size.width == viewWidth {
                self.isHidden = true
            }
            super.frame = frame
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewWidth = frame.size.width
        backgroundColor = YFMainYellowColor
        self.frame.size.width = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoadProgressAnimation() {
        self.frame.size.width = 0
        isHidden = false
        weak var tmpSelf = self
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            tmpSelf!.frame.size.width = tmpSelf!.viewWidth * 0.6
            
            }) { (finish) -> Void in
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4, execute: { 
                    UIView.animate(withDuration: 0.3, animations: { () -> Void in
                        tmpSelf!.frame.size.width = tmpSelf!.viewWidth * 0.8
                    })
                })
        }
        
    }
    
    func endLoadProgressAnimation() {
        weak var tmpSelf = self
        
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            tmpSelf!.frame.size.width = tmpSelf!.viewWidth
            }) { (finish) -> Void in
                tmpSelf!.isHidden = true
        }
    }
}
