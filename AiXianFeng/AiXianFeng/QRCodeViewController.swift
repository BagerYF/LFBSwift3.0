//
//  ProductDetailVC.swift
//  AiXianFeng
//
//  Created by Bager on 2017/5/10.
//  Copyright © 2017年 Bager. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: BaseVC, AVCaptureMetadataOutputObjectsDelegate {
    private var titleLabel = UILabel()
    private var captureSession: AVCaptureSession?
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var animationLineView = UIImageView()
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildNavigationItem()
        
        buildInputAVCaptureDevice()
        
        buildFrameImageView()
        
        buildTitleLabel()
        
        buildAnimationLineView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
    }
    
    // MARK: - Build UI
    private func buildNavigationItem() {
        navigationItem.title = "店铺二维码"
        
        navigationController?.navigationBar.barTintColor = YFNavigationBarWhiteBackgroundColor
    }
    
    private func buildTitleLabel() {
        
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.frame = CGRect(x: 0, y: 340, width: kScreenWidth, height: 30)
        titleLabel.textAlignment = NSTextAlignment.center
        view.addSubview(titleLabel)
    }
    
    private func buildInputAVCaptureDevice() {
        
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        titleLabel.text = "将店铺二维码对准方块内既可收藏店铺"
        let input = try? AVCaptureDeviceInput(device: captureDevice)
        if input == nil {
            titleLabel.text = "没有摄像头你描个蛋啊~换真机试试"
            
            return
        }
        
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession = AVCaptureSession()
        captureSession?.addInput(input!)
        captureSession?.addOutput(captureMetadataOutput)
        let dispatchQueue = DispatchQueue(label: "myQueue")
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatchQueue)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode]
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = view.layer.frame
        view.layer.addSublayer(videoPreviewLayer!)
        captureMetadataOutput.rectOfInterest = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        captureSession?.startRunning()
    }
    
    private func buildFrameImageView() {
        
        let lineT = [CGRect(x: 0, y: 0, width: kScreenWidth, height: 100),
                     CGRect(x: 0, y: 100, width: kScreenWidth * 0.2, height: kScreenWidth * 0.6),
                     CGRect(x: 0, y: 100 + kScreenWidth * 0.6, width: kScreenWidth, height: kScreenHeight - 100 - kScreenWidth * 0.6),
                     CGRect(x: kScreenWidth * 0.8, y: 100, width: kScreenWidth * 0.2, height: kScreenWidth * 0.6)]
        for lineTFrame in lineT {
            buildTransparentView(frame: lineTFrame)
        }
        
        let lineR = [CGRect(x: kScreenWidth * 0.2, y: 100, width: kScreenWidth * 0.6, height: 2),
                     CGRect(x: kScreenWidth * 0.2, y: 100, width: 2, height: kScreenWidth * 0.6),
                     CGRect(x: kScreenWidth * 0.8 - 2, y: 100, width: 2, height: kScreenWidth * 0.6),
                     CGRect(x: kScreenWidth * 0.2, y: 100 + kScreenWidth * 0.6, width: kScreenWidth * 0.6, height: 2)]
        
        for lineFrame in lineR {
            buildLineView(frame: lineFrame)
        }
        
        let yellowHeight: CGFloat = 4
        let yellowWidth: CGFloat = 30
        let yellowX: CGFloat = kScreenWidth * 0.2
        let bottomY: CGFloat = 100 + kScreenWidth * 0.6
        let lineY = [CGRect(x: yellowX, y: 100, width: yellowWidth, height: yellowHeight),
                     CGRect(x: yellowX, y: 100, width: yellowHeight, height: yellowWidth),
                     CGRect(x: kScreenWidth * 0.8 - yellowHeight, y: 100, width: yellowHeight, height: yellowWidth),
                     CGRect(x: kScreenWidth * 0.8 - yellowWidth, y: 100, width: yellowWidth, height: yellowHeight),
                     CGRect(x: yellowX, y: bottomY - yellowHeight + 2, width: yellowWidth, height: yellowHeight),
                     CGRect(x: kScreenWidth * 0.8 - yellowWidth, y: bottomY - yellowHeight + 2, width: yellowWidth, height: yellowHeight),
                     CGRect(x: yellowX, y: bottomY - yellowWidth, width: yellowHeight, height: yellowWidth),
                     CGRect(x: kScreenWidth * 0.8 - yellowHeight, y: bottomY - yellowWidth, width: yellowHeight, height: yellowWidth)]
        
        for yellowRect in lineY {
            buildYellowLineView(frame: yellowRect)
        }
    }
    
    private func buildLineView(frame: CGRect) {
        let view1 = UIView(frame: frame)
        view1.backgroundColor = UIColor.colorWithCustom(r: 230, g: 230, b: 230)
        view.addSubview(view1)
    }
    
    private func buildYellowLineView(frame: CGRect) {
        let yellowView = UIView(frame: frame)
        yellowView.backgroundColor = YFMainYellowColor
        view.addSubview(yellowView)
    }
    
    private func buildTransparentView(frame: CGRect) {
        let tView = UIView(frame: frame)
        tView.backgroundColor = UIColor.black
        tView.alpha = 0.5
        view.addSubview(tView)
    }
    
    private func buildAnimationLineView() {
        animationLineView.image = UIImage(named: "yellowlight")
        view.addSubview(animationLineView)
        
        timer = Timer(timeInterval: 2.5, target: self, selector: #selector(QRCodeViewController.startYellowViewAnimation), userInfo: nil, repeats: true)
        let runloop = RunLoop.current
        runloop.add(timer!, forMode: RunLoopMode.commonModes)
        timer!.fire()
    }
    
    func startYellowViewAnimation() {
        weak var weakSelf = self
        animationLineView.frame = CGRect(x: kScreenWidth * 0.2 + kScreenWidth * 0.1 * 0.5, y: 100, width: kScreenWidth * 0.5, height: 20)
        UIView.animate(withDuration: 2.5) { () -> Void in
            weakSelf!.animationLineView.frame.origin.y += kScreenWidth * 0.55
        }
    }
}
