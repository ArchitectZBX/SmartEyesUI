//
//  SearchDeviceViewController.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/11.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class SearchDeviceViewController: UIViewController {
    var radarView:RadarView!
    var channelManage = UsePPPPChannelManagement()
    var indexArray = [NSInteger]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "搜索局域网"
        self.view.backgroundColor = UIColor.whiteColor()
        self.initUI()
        self.channelManage.startSearch()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("myFunction:"), name: "sendDevicesNotification", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func myFunction(notification:NSNotification) {
        let cameraArray = notification.object as? NSMutableArray
        print(cameraArray?.count)
        let vcA = CameraListViewController()
        let vcB = BindingDeviceViewController()
        vcB.cameraArray = cameraArray!
        self.navigationController?.setViewControllers([vcA,vcB], animated: true)
    }
    
    func initUI() {
        let radarSize = CGSizeMake(200, 200)
        radarView = RadarView(frame: CGRectMake((ScreenSize.size.width-radarSize.width)/2, (ScreenSize.size.height-radarSize.height)/2, radarSize.width, radarSize.height))
        
        let statusLabel = UILabel(frame: CGRect(x: (ScreenSize.size.width-100)/2, y: ScreenSize.size.height/2 + ScreenSize.size.width/2, width: 100, height: 30))
        statusLabel.text = "正在搜索..."
        
        statusLabel.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(radarView)
        self.view.addSubview(statusLabel)
        
//        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("removeAllGroup"), userInfo: nil, repeats: false)
    }
    
    func removeAllGroup() {
        var viewArray = view.subviews
        print(view.subviews.count)
        for(var i = 0;i<=view.subviews.count;i++) {
            viewArray[i].removeFromSuperview()
        }
        failedConfig()
    }
    
    func failedConfig() {
        let imageView = UIImageView(image: UIImage(named: "failed.png"))
        imageView.frame = CGRect(x: 0, y: (ScreenSize.size.height-ScreenSize.size.width)/2, width: ScreenSize.size.width, height: ScreenSize.size.width)
        let statusLabel = UILabel(frame: CGRect(x: (ScreenSize.size.width-100)/2, y: ScreenSize.size.height/2 + ScreenSize.size.width/2, width: 100, height: 30))
        statusLabel.text = "搜索失败"
        statusLabel.textAlignment = NSTextAlignment.Center
        
        let researchButton = UIButton(frame: CGRect(x: 0, y: ScreenSize.size.height-50, width: ScreenSize.size.width, height: 50))
        researchButton.setTitle("重新搜索", forState: UIControlState.Normal)
        researchButton.backgroundColor = UIColor.redColor()
        self.view.addSubview(statusLabel)
        self.view.addSubview(imageView)
        self.view.addSubview(researchButton)
    }
    
}


//class RadarView: UIView {
//    weak var animationLayer:CALayer?
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("resume"), name: UIApplicationDidBecomeActiveNotification, object: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    deinit {
//        NSNotificationCenter.defaultCenter().removeObserver(self)
//    }
//    
//    func resume() {
//        
//    }
//    
//    
//    
//    override func drawRect(rect: CGRect) {
//        UIColor.whiteColor().setFill()
//        UIRectFill(rect)
//        //中间的wifi 标志
//        let imageCenter = UIImageView(frame: CGRect(x: (rect.width-50)/2, y: (rect.height-50)/2, width: 50, height: 50))
//        imageCenter.image = UIImage(named: "center.png")
//        self.addSubview(imageCenter)
//        
//        let count = 7
//        let animationDuration:Double = 4
//        let animationLayer = CALayer()
//        for(var i = 2;i<count;i++) {
//            let pulsingLayer = CALayer()
//            pulsingLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height)
//            pulsingLayer.borderColor = UIColor.redColor().CGColor
//            pulsingLayer.borderWidth = 3
//            pulsingLayer.cornerRadius = rect.size.height/2
//            let defalutCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//            let animationGroup = CAAnimationGroup()
//            animationGroup.fillMode = kCAFillModeBackwards
//            animationGroup.beginTime = CACurrentMediaTime() + Double(i) * animationDuration / Double(count)
//            animationGroup.duration = animationDuration
//            animationGroup.repeatCount = HUGE
//            animationGroup.timingFunction = defalutCurve
//            
//            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
//            scaleAnimation.fromValue = Double(0.2)
//            scaleAnimation.toValue = Double(1.5)
//            
//            let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
//            opacityAnimation.values = [Double(1),Double(0.7),Double(0)]
//            opacityAnimation.keyTimes = [Double(0),Double(0.5),Double(1)]
//            animationGroup.animations = [scaleAnimation,opacityAnimation]
//            pulsingLayer.addAnimation(animationGroup, forKey: "pulsing")
//            animationLayer.addSublayer(pulsingLayer)
//            
//        }
//        
//        self.layer.addSublayer(animationLayer)
//        self.animationLayer = animationLayer
//    }
//}
