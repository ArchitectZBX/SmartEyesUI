//
//  ControlDeviceViewController.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/15.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class ControlDeviceViewController: UIViewController {
    var playView = UIImageView()
    var snapshotImage = UIImage()
    var detailView = UIView()
    var controlView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    let channelManage = UsePPPPChannelManagement()
    var cameraID:String?
    var password:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "摄像头"
        self.view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        initNavigation()
        initPlayViewUI()
        initDetailViewUI()
        initControlViewUI()
        channelManage.initDevice()
        channelManage.connectDevice(self.cameraID, password: self.password)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("startVideo"), name: "startVideoNotification", object: nil)
//        NSTimer.scheduledTimerWithTimeInterval(15, target: self, selector: Selector("startVideo"), userInfo: nil, repeats: false)
        
        
    }
    
    func startVideo() {
        
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.removeFromSuperview()
        print("次数")
        channelManage.startVideo(self.playView, cameraID: cameraID)
    }
    
    func setting() {
        print("跳转到设置界面")
    }
    func initNavigation() {
        let settingButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        settingButton.setTitle("设置", forState: UIControlState.Normal)
        settingButton.titleLabel?.font = UIFont.systemFontOfSize(15)
        settingButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        settingButton.addTarget(self, action: Selector("setting"), forControlEvents: UIControlEvents.TouchUpInside)
        let rightItem = UIBarButtonItem(customView: settingButton)
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        negativeSpacer.width = -10
        let itemArray = [negativeSpacer,rightItem]
        self.navigationItem.rightBarButtonItems = itemArray
    }
    
    func initPlayViewUI() {
        
        playView.frame = CGRect(x: 0, y: 64, width: ScreenSize.size.width, height: ScreenSize.size.height/3)
        playView.backgroundColor = UIColor.blackColor()
        activityIndicator.frame = CGRect(x: (playView.frame.width - 40)/2, y: (playView.frame.height - 40)/2, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.White
        activityIndicator.startAnimating()
        
        self.playView.addSubview(activityIndicator)
        self.view.addSubview(playView)
    }
    
    func initDetailViewUI() {
        
        detailView.frame = CGRect(x: 10, y: playView.frame.maxY + 10, width: ScreenSize.size.width - 20, height: ScreenSize.size.height/3 - 10 - 64 - 10)
        detailView.backgroundColor = UIColor.whiteColor()
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: detailView.frame.width - detailView.frame.height - 20, height: detailView.frame.height*2/5))
        titleLabel.text = "摄像机1"
        titleLabel.textAlignment = NSTextAlignment.Center
        self.detailView.addSubview(titleLabel)
        
        let statusLabel = UILabel(frame: CGRect(x: 30, y: titleLabel.frame.maxY, width:60, height: detailView.frame.height * 1.5/5))
        statusLabel.text = "状态："
        self.detailView.addSubview(statusLabel)
        
        let statusDetailLabel = UILabel(frame: CGRect(x: statusLabel.frame.maxX, y: titleLabel.frame.maxY, width: detailView.frame.width - detailView.frame.height - 20 - 30 - 40, height: detailView.frame.height * 1.5/5))
        statusDetailLabel.text = "没有插卡"
        self.detailView.addSubview(statusDetailLabel)
        
        let remarkLabel = UILabel(frame: CGRect(x: 30, y: statusLabel.frame.maxY, width: 60, height: detailView.frame.height * 1.5/5))
        remarkLabel.text = "备注："
        self.detailView.addSubview(remarkLabel)
        
        let remarkDetailTextField = UITextField(frame: CGRect(x: remarkLabel.frame.maxX, y: statusLabel.frame.maxY, width: detailView.frame.width - detailView.frame.height - 20 - 30 - 40, height: detailView.frame.height * 1.5/5))
        remarkDetailTextField.text = "客厅的云眼"
        remarkDetailTextField.textColor = UIColor.grayColor()
        self.detailView.addSubview(remarkDetailTextField)
        self.view.addSubview(detailView)
    }
    
    func initControlViewUI() {
        controlView.frame = CGRect(x: 10, y: detailView.frame.maxY + 10, width: ScreenSize.size.width - 20, height: ScreenSize.size.height/3)
        controlView.backgroundColor = UIColor.whiteColor()
        
        let horizontalLine = UIView(frame: CGRect(x: 0, y: controlView.frame.height/2, width: controlView.frame.width, height: 2))
        horizontalLine.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        self.controlView.addSubview(horizontalLine)
        
        let verticalLine = UIView(frame: CGRect(x: controlView.frame.width/2, y:0, width: 2, height: controlView.frame.height))
        verticalLine.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        self.controlView.addSubview(verticalLine)
        //添加四个按钮
        let XscreenShotImageView = (controlView.frame.width/2 - controlView.frame.height*1/3 + 10)/2
        let screenShotImageView = UIImageView(frame: CGRect(x: XscreenShotImageView, y: 10, width: controlView.frame.height*1/3-10, height: controlView.frame.height*1/3-10))
        screenShotImageView.image = UIImage(named: "screenshot.png")
        self.controlView.addSubview(screenShotImageView)
        
        let screenShotLabel = UILabel(frame: CGRect(x: controlView.frame.width/4-20, y: screenShotImageView.frame.maxY+15, width: 40, height: 10))
        screenShotLabel.text = "抓图"
        screenShotLabel.textAlignment = NSTextAlignment.Center
        self.controlView.addSubview(screenShotLabel)
        
        let XtalkImageView = (controlView.frame.width/2 - controlView.frame.height*1/3 + 10)/2 + controlView.frame.width/2
        let talkImageView = UIImageView(frame: CGRect(x: XtalkImageView, y: 10, width: controlView.frame.height*1/3-10, height: controlView.frame.height*1/3-10))
        talkImageView.image = UIImage(named: "talk.png")
        self.controlView.addSubview(talkImageView)
        
        let talkLabel = UILabel(frame: CGRect(x: controlView.frame.width * 3/4-20, y: talkImageView.frame.maxY + 15, width: 40, height: 10))
        talkLabel.text = "对讲"
        talkLabel.textAlignment = NSTextAlignment.Center
        self.controlView.addSubview(talkLabel)
        
        let XvideoImageView = (controlView.frame.width/2 - controlView.frame.height*1/3 + 10)/2
        let videoImageView = UIImageView(frame: CGRect(x: XvideoImageView, y: 10 + controlView.frame.height/2, width: controlView.frame.height*1/3-10, height: controlView.frame.height*1/3-10))
        videoImageView.image = UIImage(named: "video.png")
        self.controlView.addSubview(videoImageView)
        
        let videoLabel = UILabel(frame: CGRect(x: controlView.frame.width/4-20, y: videoImageView.frame.maxY + 15, width: 40, height: 10))
        videoLabel.text = "录像"
        videoLabel.textAlignment = NSTextAlignment.Center
        self.controlView.addSubview(videoLabel)
        
        let XlistenImageView = (controlView.frame.width/2 - controlView.frame.height*1/3 + 10)/2 + controlView.frame.width/2
        let listenImageView = UIImageView(frame: CGRect(x: XlistenImageView, y: 10 + controlView.frame.height/2, width: controlView.frame.height*1/3-10, height: controlView.frame.height*1/3-10))
        listenImageView.image = UIImage(named: "listen.png")
        self.controlView.addSubview(listenImageView)
        let listenLabel = UILabel(frame: CGRect(x: controlView.frame.width * 3/4-20, y: listenImageView.frame.maxY + 15, width: 40, height: 10))
        listenLabel.text = "监听"
        listenLabel.textAlignment = NSTextAlignment.Center
        self.controlView.addSubview(listenLabel)
        self.view.addSubview(controlView)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
