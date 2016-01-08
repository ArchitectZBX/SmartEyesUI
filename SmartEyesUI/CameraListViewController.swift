//
//  CameraListViewController.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/11.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class CameraListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var cameraListTableView = UITableView()
    var arrayCamera = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
//        arrayCamera = [["roomName":"客厅","cameraStatus":"正在连接"],["roomName":"主卧","cameraStatus":"在线"]]
//        print(arrayCamera)
        self.title = "摄像机"
        cameraListTableView = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenSize.size.width, height: ScreenSize.size.height), style: UITableViewStyle.Grouped)
        
        cameraListTableView.dataSource = self
        cameraListTableView.delegate = self
        self.view.addSubview(cameraListTableView)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "摄像机"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentify = "cellCamera"
        var cell:CameraListTableViewCell?
        cell = self.cameraListTableView.dequeueReusableCellWithIdentifier(cellIdentify) as? CameraListTableViewCell
        if(cell == nil) {
            cell = CameraListTableViewCell(style:UITableViewCellStyle.Default,reuseIdentifier: cellIdentify)
        } else {
            while (cell!.contentView.subviews.last != nil) {
                cell!.contentView.subviews.last?.removeFromSuperview()
            }
        }
        cell?.setupCell()
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
