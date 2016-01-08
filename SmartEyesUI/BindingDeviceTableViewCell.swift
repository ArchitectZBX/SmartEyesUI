//
//  BindingDeviceTableViewCell.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/14.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit
class BindingDeviceTableViewCell: UITableViewCell,UIAlertViewDelegate {
    var cameraInfo:NSDictionary?
    var passwordAlert = UIAlertView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell() {
        let container = UIView(frame: CGRect(x: 20, y: 5, width: ScreenSize.size.width-40, height: 235))
        container.layer.cornerRadius = 10
        container.layer.masksToBounds = true
        container.backgroundColor = UIColor(red: 240/255, green: 255/255, blue: 255/255, alpha: 1)
        self.contentView.addSubview(container)
        
        let imageView = UIImageView(frame: CGRect(x: 20, y: 5, width: ScreenSize.size.width-40, height: 120))
        imageView.image = cameraInfo!["img"] as! UIImage
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        self.contentView.addSubview(imageView)
        
        let iconView = UIImageView(frame: CGRect(x: 40, y: imageView.frame.maxY - 25, width: 50, height: 50))
        iconView.image = UIImage(named: "binding.png")
        self.contentView.addSubview(iconView)
        
        let deviceIDLabel = UILabel(frame: CGRect(x: iconView.frame.maxX + 10, y: imageView.frame.maxY+5, width: ScreenSize.size.width-100, height: 20))
        deviceIDLabel.text = cameraInfo!["did"] as! String
        self.contentView.addSubview(deviceIDLabel)
        
        let descriptionLabel = UILabel(frame: CGRect(x: 20, y: deviceIDLabel.frame.maxY+5, width: ScreenSize.size.width-40, height: 30))
        descriptionLabel.text = "发现1台摄像机，需要绑定它吗？"
        descriptionLabel.textColor = UIColor(red: 255/255, green: 125/255, blue: 64/255, alpha: 1)
        descriptionLabel.textAlignment = NSTextAlignment.Center
        self.contentView.addSubview(descriptionLabel)
        
        let bindingButton = UIButton(frame: CGRect(x: 50, y: descriptionLabel.frame.maxY+5, width: ScreenSize.size.width-100, height: 40))
        bindingButton.layer.cornerRadius = 8
        bindingButton.backgroundColor = UIColor.redColor()
        bindingButton.setTitle("立即绑定", forState: UIControlState.Normal)
        bindingButton.addTarget(self, action: Selector("inputPwd"), forControlEvents: UIControlEvents.TouchUpInside)
        self.contentView.addSubview(bindingButton)
        
        self.contentView.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        
        
       
    }
    
    func inputPwd() {
        passwordAlert = UIAlertView(title: "请输入摄像机密码", message: nil, delegate: nil, cancelButtonTitle: "确定")
        passwordAlert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        passwordAlert.show()
        passwordAlert.delegate = self
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if(buttonIndex == 0) {
            let textField = self.passwordAlert.textFieldAtIndex(0)
            let password = textField?.text
            let vc = CameraListViewController()
//            vc.cameraID = self.cameraInfo?.cameraID
//            vc.password = password
//            self.window?.rootViewController = vc
//            self.
        }
    }

}
