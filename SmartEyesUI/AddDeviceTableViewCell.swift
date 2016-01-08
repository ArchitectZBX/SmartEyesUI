//
//  AddDeviceTableViewCell.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/10.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class AddDeviceTableViewCell: UITableViewCell {
    var name:NSString?
    var iconPath:String?
    func setCell() {
        let imageView = UIImageView(image: UIImage(named: iconPath!))
        imageView.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
        let labelName = UILabel(frame: CGRect(x: imageView.frame.maxX + 30, y: 20, width: ScreenSize.size.width/2, height: 10))
        labelName.text = self.name as? String
        labelName.textAlignment = NSTextAlignment.Left
        
        let label = UILabel(frame: CGRect(x: 0, y: 49, width: ScreenSize.size.width, height: 1))
        label.backgroundColor = UIColor.grayColor()
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(labelName)
        self.contentView.addSubview(label)
    }
}
