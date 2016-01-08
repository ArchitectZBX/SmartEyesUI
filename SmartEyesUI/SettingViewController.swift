//
//  SettingViewController.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/18.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate {
    let screenBounds = UIScreen.mainScreen().bounds
    var segment = YYSegmentedControl()
    var scrollView = UIScrollView()
    var systemParameterView = UIView()
    var headerView = UIView()
    var pictureHeaderView = UIView()
    var playView = UIImageView()
    var parameterTableView = UITableView()
    var pictureTableView = UITableView()
    var parameterNameArray = ["无线设置","存储设置","密码设置","报警设置"]
    var parameterImageArray = ["wifi.png","storage.png","secure.png","alarm.png"]
    var pictureNameArray = ["夜视","水平镜像","垂直镜像"]
    var pictureImageArray = ["dark.png","mirror1.png","mirror2.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        self.initSegment()
        self.initScrollView()
        self.initSystemParametersView()
        self.initVideoPictureView()
        print(parameterNameArray.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initSegment() {
        self.segment = self.segmentedNormalControlWithItems([" 系统参数 "," 视频画面 " ])
        self.segment.center = CGPointMake(ScreenSize.size.width/2, 85)
        self.segment.addTarget(self, action: Selector("changeView"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(self.segment)
    }
    
    func changeView() {
        let segmentIndex = self.segment.selectedSegmentIndex
        let width  = ScreenSize.size.width
        self.scrollView.contentOffset = CGPoint(x: Int(width) * segmentIndex!, y: 0)
    }
    
    func initScrollView() {
        scrollView.frame = CGRect(x: 0, y: 100, width: ScreenSize.size.width, height: ScreenSize.size.height - 94)
        scrollView.delegate = self
        scrollView.bounces = false
        scrollView.pagingEnabled = true
        scrollView.scrollEnabled = false
        scrollView.contentSize = CGSize(width: ScreenSize.size.width * 2, height: ScreenSize.size.height - 94)
        self.view.addSubview(scrollView)
        
    }
    
    func initSystemParametersView() {
        systemParameterView.frame = CGRect(x: 0, y: 0, width: ScreenSize.size.width, height: ScreenSize.size.height - 94)
        self.scrollView.addSubview(systemParameterView)
        
        parameterTableView.frame = CGRect(x: 0, y: 5, width: screenBounds.size.width, height: systemParameterView.frame.height)
        parameterTableView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        parameterTableView.tag = 1111
        parameterTableView.delegate = self
        parameterTableView.dataSource = self
        parameterTableView.layer.cornerRadius = 10
        self.scrollView.addSubview(parameterTableView)
        
        headerView.frame = CGRect(x: 0, y: 0, width: screenBounds.size.width, height: 170)
        let headerView1 = UIView(frame: CGRect(x: 20, y: 0, width: screenBounds.size.width-40, height: 150))
        headerView1.backgroundColor = UIColor.redColor()
        headerView1.layer.cornerRadius = 10
        self.headerView.addSubview(headerView1)
        self.parameterTableView.tableHeaderView = self.headerView
        
    }
    
    func initVideoPictureView() {
        pictureTableView.frame = CGRect(x: ScreenSize.size.width, y: 5, width: ScreenSize.size.width, height: ScreenSize.size.height - 94)
        pictureTableView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        pictureTableView.tag = 2222
        pictureTableView.delegate = self
        pictureTableView.dataSource = self
        self.scrollView.addSubview(pictureTableView)
        
        pictureHeaderView.frame = CGRect(x: 0, y: 0, width: screenBounds.size.width, height: 280)
        self.pictureTableView.tableHeaderView = pictureHeaderView
        
        playView.frame = CGRect(x: 0, y: 0, width: screenBounds.size.width, height: 200)
        playView.backgroundColor = UIColor.blackColor()
        self.pictureHeaderView.addSubview(playView)
        
        let brightnessLabel = UILabel(frame: CGRect(x: 25, y: playView.frame.maxY + 15, width: 60, height: 20))
        brightnessLabel.text = "亮度:"
        brightnessLabel.textAlignment = NSTextAlignment.Center
        self.pictureHeaderView.addSubview(brightnessLabel)
        
        let brightnessSlider = UISlider(frame: CGRect(x: brightnessLabel.frame.maxX + 20, y: playView.frame.maxY + 15, width: 200, height: 20))
        self.pictureHeaderView.addSubview(brightnessSlider)
        
        let contrastLabel = UILabel(frame: CGRect(x: 25, y: brightnessLabel.frame.maxY + 15, width: 60, height: 20))
        contrastLabel.text = "对比度:"
        contrastLabel.textAlignment = NSTextAlignment.Center
        self.pictureHeaderView.addSubview(contrastLabel)
        
        let contrastSlider = UISlider(frame: CGRect(x: contrastLabel.frame.maxX + 20, y: brightnessSlider.frame.maxY + 15, width: 200, height: 20))
        self.pictureHeaderView.addSubview(contrastSlider)
        
        
    }
    
    
    
    func segmentedNormalControlWithItems(items:NSArray)->YYSegmentedControl{
        let segmentedControl = YYSegmentedControl(items:items)
        segmentedControl.titleColor = UIColor.blackColor()
        segmentedControl.selectedTitleTextColor = UIColor.whiteColor()
        segmentedControl.selectedTitleFont = UIFont.boldSystemFontOfSize(13.0)
        segmentedControl.segmentIndicatorBackgroundColor = UIColor.redColor()
        segmentedControl.backgroundColor = UIColor.whiteColor()
        segmentedControl.borderWidth = 1.0
        segmentedControl.borderColor = UIColor.redColor()
        segmentedControl.segmentIndicatorBorderWidth = 2.0
        segmentedControl.segmentIndicatorBorderColor = UIColor.redColor()
        segmentedControl.sizeToFit()
        segmentedControl.segmentIndicatorCornerRadius = 0
        return segmentedControl
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(tableView.tag == 1111) {
            let identify = "parameter"
            var cell : ParameterTableViewCell?
            cell = self.parameterTableView.dequeueReusableCellWithIdentifier(identify) as? ParameterTableViewCell
            if (nil == cell) {
                cell = ParameterTableViewCell(style:UITableViewCellStyle.Default,reuseIdentifier: identify)
            }
            cell?.parameterImage = parameterImageArray[indexPath.row]
            cell?.name = parameterNameArray[indexPath.row]
            cell?.setupCell()
            cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell!
        } else {
            let identify = "picture"
            var cell : ParameterTableViewCell?
            cell = self.parameterTableView.dequeueReusableCellWithIdentifier(identify) as? ParameterTableViewCell
            if (nil == cell) {
                cell = ParameterTableViewCell(style:UITableViewCellStyle.Default,reuseIdentifier: identify)
            }
            cell?.parameterImage = pictureImageArray[indexPath.row]
            cell?.name = pictureNameArray[indexPath.row]
            cell?.setupCell()
            let mySwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            cell?.accessoryView = mySwitch
            return cell!
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 1111) {
            return parameterNameArray.count
        }else {
            return pictureNameArray.count
        }
    }
    
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        let xOffContent = self.scrollView.contentOffset.x
//        self.segment.selectedSegmentIndex = Int(xOffContent/ScreenSize.size.width)
    }
    

}
