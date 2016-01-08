//
//  AddDeviceViewController.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/10.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class AddDeviceViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate,UITextFieldDelegate{
    var addDeviceTableView = UITableView()
    let optionArray:NSArray = ["扫一扫","搜索局域网","一键Wifi配置","",""]
    let iconPath:NSArray = ["saoma.png","juyuwang.png","wifi.png","",""]
    var nextStepButton = UIButton()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        self.title = "添加摄像头"
        self.view.backgroundColor = UIColor.whiteColor()
        addDeviceTableView = UITableView(frame: CGRect(x: 0, y: 64, width: ScreenSize.size.width, height: ScreenSize.size.height), style: UITableViewStyle.Plain)
        addDeviceTableView.delegate = self
        addDeviceTableView.dataSource = self
        addDeviceTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        nextStepButton = UIButton(frame: CGRect(x: 0, y: 0, width: 66, height: 44))
        nextStepButton.setTitle("下一步", forState: UIControlState.Normal)
        nextStepButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        let rightItem = UIBarButtonItem(customView: nextStepButton)
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        negativeSpacer.width = -15
        let itemArray = [negativeSpacer,rightItem]
        self.navigationItem.rightBarButtonItems = itemArray
        
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenSize.size.width, height: 0))
        self.view.addSubview(emptyView)
        self.view.addSubview(addDeviceTableView)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row == 4) {
            var cell:textFieldTableViewCell?
            cell = textFieldTableViewCell(style:UITableViewCellStyle.Default,reuseIdentifier: "textField")
            cell?.setCell()
            cell?.initWithClosure(getEighteen)
            return cell!
        } else {
            let cellIdentify:String! = "optionCell"
            var cell:AddDeviceTableViewCell?
            cell = self.addDeviceTableView.dequeueReusableCellWithIdentifier(cellIdentify) as? AddDeviceTableViewCell
            if (cell == nil) {
                cell = AddDeviceTableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:cellIdentify)
            } else {
                while (cell!.contentView.subviews.last != nil) {
                    cell!.contentView.subviews.last?.removeFromSuperview()
                }
            }
            cell!.name = self.optionArray[indexPath.row] as? NSString
            cell?.iconPath = iconPath[indexPath.row] as? String
            cell!.setCell()
            cell?.selectionStyle = UITableViewCellSelectionStyle.Blue
            cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            if(indexPath.row == 3) {
                cell?.accessoryType = UITableViewCellAccessoryType.None
            }
            return cell!
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0) {
            let vc = BarCodeViewController()
            self.navigationController?.pushViewController(vc, animated: false)
        } else if (indexPath.row == 1) {
            let vc = SearchDeviceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if (indexPath.row == 2) {
            let vc = WifiConfigViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //闭包方法
    func getEighteen(num:Int)->Void {
        if(num == 17){
            self.nextStepButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            self.nextStepButton.addTarget(self, action: Selector("nextStep"), forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    func nextStep() {
        print("下一步")
        let vc = CameraListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
   
   
}
