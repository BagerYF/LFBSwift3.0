
//
//  TestVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/8.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit

class TestVC: AnimationViewController{

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        let test = UIImageView()
//        test.backgroundColor = UIColor.green
//        test.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        
//        view.addSubview(test)
//        
//        addProductsAnimation(imageView: test)
//    }
    
    var lineActionView      :   UIView?
    var circleAtcionView    :   UIView?
    
    lazy var lineKeyAnimation:CAKeyframeAnimation={
        var val=CAKeyframeAnimation()
        return val
    }()
    
    lazy var circleKeyAnimation:CAKeyframeAnimation={
        var val=CAKeyframeAnimation()
        return val
    }()
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        prepareView(view: self.view)
    }
    
    func prepareView(view:UIView){
        view.backgroundColor    = UIColor.orange
        lineActionView          = UIView(frame: CGRect(x: 20, y: 100, width: 50, height: 50))
        circleAtcionView        = UIView(frame: CGRect(x: 20, y: 200, width: 80, height: 50))
        lineActionView?.backgroundColor     =   UIColor.cyan
        circleAtcionView?.backgroundColor   =   UIColor.purple
        view.addSubview(lineActionView!)
        view.addSubview(circleAtcionView!)
        
        toolAddAnimation2View(view: lineActionView!, key: "lineKeyAnimation", animation:lineKeyAnimation, procFunc: configLineKeyAnimation)
        toolAddAnimation2View(view: circleAtcionView!, key: "circlceKeyAnimation", animation:circleKeyAnimation, procFunc: configCircleKeyAnimation)
    }
    
    
    func toolAddAnimation2View(view:UIView,key:String,animation:CAKeyframeAnimation,procFunc:((CAKeyframeAnimation)->(CAKeyframeAnimation))) {
        view.layer.add(procFunc(animation), forKey: key)
    }
    
    
    //MARK: - config
    
    func configLineKeyAnimation(animation:CAKeyframeAnimation) -> CAKeyframeAnimation {
        animation.keyPath   =   "position.x"
        animation.values    =   [20,120,180,210,300,20]
        animation.keyTimes  =   [0,0.2,0.7,0.8,0.9,1]
        animation.duration  =   3
        //动画开始前设置动画
        animation.isAdditive  =   true
        return animation
    }
    
    func configCircleKeyAnimation(animation:CAKeyframeAnimation) -> CAKeyframeAnimation {
        animation.keyPath   =   "position"
        animation.path      =   UIBezierPath(ovalIn: CGRect(x: 20, y: 200, width: 200, height: 200)).cgPath
        animation.duration  =   3
        animation.isAdditive  =   true
        animation.repeatCount   =   3
        /*
         kCAAnimationLinear     :   默认差值
         kCAAnimationDiscrete   :   逐帧显示
         kCAAnimationPaced      :   匀速 无视keyTimes
         kCAAnimationCubic      :   keyValue之间曲线平滑 可用 tensionValues,continuityValues,biasValues 调整
         kCAAnimationCubicPaced :   keyValue之间平滑差值 无视keyTimes
         */
        animation.calculationMode   =   kCAAnimationPaced //无视keytimes
        /*
         kCAAnimationRotateAuto         :   自动
         kCAAnimationRotateAutoReverse  :   自动翻转
         不设置则不旋转
         */
        animation.rotationMode  =   kCAAnimationRotateAuto
        
        return animation
    }
    
    func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        toolAddAnimation2View(view: lineActionView!, key: "lineKeyAnimation", animation:lineKeyAnimation, procFunc: configLineKeyAnimation)
        toolAddAnimation2View(view: circleAtcionView!, key: "circlceKeyAnimation", animation:circleKeyAnimation, procFunc: configCircleKeyAnimation)
    }
}
