//
//  CameraListTableViewCell.swift
//  SmartEyesUI
//
//  Created by Architect_ZBX on 15/12/11.
//  Copyright © 2015年 zhaobingxu. All rights reserved.
//

import UIKit

class CameraListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        let imageViewRoom:UIImageView = UIImageView(image: UIImage(named: "meinv.jpg"))
        imageViewRoom.frame = CGRect(x: 5, y: 5, width: ScreenSize.size.width/2-10, height: 90)
        let roomName:UILabel = UILabel(frame: CGRect(x: imageViewRoom.frame.maxX+10, y: 20, width: ScreenSize.size.width/2-50, height: 20))
        roomName.text = "客厅"
        let familyNames = UIFont.familyNames()
        roomName.font = UIFont(name: familyNames[10], size: 20)
        let deviceStatus:UILabel = UILabel(frame: CGRect(x: imageViewRoom.frame.maxX+10, y: 70, width: ScreenSize.size.width/2-50, height: 20))
        deviceStatus.text = "在线"
        
        self.contentView.addSubview(imageViewRoom)
        self.contentView.addSubview(roomName)
        self.contentView.addSubview(deviceStatus)
    }

}
