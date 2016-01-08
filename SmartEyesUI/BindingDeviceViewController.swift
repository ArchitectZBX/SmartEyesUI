//
//  BindingDeviceViewController.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/14.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class BindingDeviceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var deviceListTableView = UITableView()
    var cameraArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "绑定摄像机"
        deviceListTableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenSize.size.width, height: ScreenSize.size.height))
        deviceListTableView.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        deviceListTableView.dataSource = self
        deviceListTableView.delegate = self
        deviceListTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(deviceListTableView)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentify = "binding"
        var cell :BindingDeviceTableViewCell?
        cell = self.deviceListTableView.dequeueReusableCellWithIdentifier(cellIdentify) as? BindingDeviceTableViewCell
        if (cell == nil) {
            cell = BindingDeviceTableViewCell(style:UITableViewCellStyle.Default,reuseIdentifier: cellIdentify)
        }
        cell?.cameraInfo = self.cameraArray[indexPath.row] as! NSDictionary
        cell?.setupCell()
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cameraArray.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
