//
//  MyNavigationController.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/11.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer!.delegate = self
    }
    
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    override class func initialize() {
        //导航栏的颜色
        let naviBar = UINavigationBar.appearance()
        naviBar.barTintColor = UIColor(red: 255.0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1)
        //字体的颜色
        naviBar.titleTextAttributes = NSDictionary(object: UIColor.whiteColor(), forKey: NSForegroundColorAttributeName) as? [String : AnyObject]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
