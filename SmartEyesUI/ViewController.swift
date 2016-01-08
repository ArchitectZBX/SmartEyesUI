//
//  ViewController.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/10.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonClick = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 30))
        buttonClick.backgroundColor = UIColor.redColor()
        buttonClick.setTitle("点我", forState: UIControlState.Normal)
        buttonClick.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonClick)
    }
    
    func click() {
        let viewController = AddDeviceViewController()
//        let viewController = CameraListViewController()
//        let viewController = SearchDeviceByWifiViewController()
//        let viewController = BindingDeviceViewController()
//        let viewController = ControlDeviceViewController()
//        let viewController = BarCodeViewController()
//        let viewController = SettingViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

